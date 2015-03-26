//
//  Institution.m
//  iDote
//
//  Created by Tainara Specht on 3/22/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Institution.h"

@implementation Institution

+(NSMutableArray *)loadInstitution{
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"Institution"];
    
    [query whereKey:@"ativo" equalTo:[NSNumber numberWithBool:true]];
    
    NSMutableArray *queryResult = [NSMutableArray arrayWithArray:[query findObjects]];
    
    for (PFObject *obj in queryResult) {
        Institution *inst = [[Institution alloc] init];
        inst.object = obj;
        inst.institutionName = [obj valueForKey:@"nome"];
        inst.ativo = [(NSNumber *)[obj valueForKey:@"ativo"] boolValue];
        
        [list addObject:inst];
    }
    
    return list;
}

-(void)save{
    PFObject *object = [PFObject objectWithClassName:@"Institution"];
    //strings são as colunas da tabela do parse
    object[@"nome"] = _institutionName;
    //    object[@"telefone"] = _institutionPhone;
    //    object[@"email"] = _institutionEmail;
    //    object[@"responsavel"] = _institutionResponsible;
    //    object[@"endereco"] = _institutionAddress;
    //    object[@"descricao"] = _institutionDescription;
    object[@"ativo"] = [NSNumber numberWithBool:false]; //sempre será inserido falso porque dependerá de aprovação
    
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            _object = object;
        }
    }];
    
}

@end
