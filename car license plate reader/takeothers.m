function [r takethisbox]=takeothers(NR,container,chk)



takethisbox=[];
if (chk==2)
    for i=1:size(NR,1)
        if (((NR(i,(2*chk))<container(1) && NR(i,(2*chk))>3)||  NR(i,(2*chk))>container(2))&& NR(i,(1.5*chk))>3)
            takethisbox=cat(1,takethisbox,NR(i,:));
        end
    end
else
    for i=1:size(NR,1)
        if NR(i,(2*chk))<container(1) && NR(i,(2*chk))>container(2)
            takethisbox=cat(1,takethisbox,NR(i,:));
        end
    end
end
r=[];
for k=1:size(takethisbox,1)
    var=find(takethisbox(k,1)==reshape(NR(:,1),1,[]));
    if length(var)==1
        r=[r var];
    else
        for v=1:length(var)
            M(v)=NR(var(v),(2*chk))>=container(1) && NR(var(v),(2*chk))<=container(2);
        end
        var=var(M);
        r=[r var];
    end
end
end
