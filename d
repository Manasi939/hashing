#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#define size 10
struct abc
{
    char name[20];
    char ph[10];
    struct abc *next;
};
struct abc *head[size],*p;
int hashcode(char name[20])
{
    int l=strlen(name);
    int sum=0;
    for(int i=0;i<l;i++)
    {
        sum=sum*10+(name[i]-'0');
    }
    return sum;
}
void insert(char name[20],char phone[10])
{
    struct abc *temp=NULL;
    temp=(struct abc *)malloc(sizeof(struct abc));
    strcpy(temp->name,name);
    strcpy(temp->ph,phone);
    int i=hashcode(name)%10;
    if(head[i]==NULL)
    {
        head[i]=temp;
        head[i]->next=NULL;
    }
    else
    {
        p=head[i];
        while(p->next!=NULL)
        {
            p=p->next;
        }
        p->next=temp;
    }
    
}
void display()
{
    
    for(int i=0;i<10;i++)
    {
        if(head[i]!=NULL)
        {
            p=head[i];
    while(p->next!=NULL)
    {
          
       printf("\nName:\n");
        printf("%s",p->name);
        printf("\nPhone\n");
        printf("%s",p->ph);
        p=p->next;
        
    }
    }
    }
    
}
int main() {
    char name[20],ph[10];
    int ch;
    do
    {
      
       printf("\nEnter name:\n");
       scanf("%s",name);
       printf("\nEnter phone number:\n");
       scanf("%s",ph);
      
         insert(name,ph);
     
      printf("\nDo you want to continue:0/1\n");
         scanf("%d",&ch);   
    }while(ch!=0);
    display();
   
   
   
}
