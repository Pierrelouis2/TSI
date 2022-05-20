function [I] = Kmeans(img,k)
    [h,w] = size(img);
    I = zeros(h,w);
    mk =rand([1 k]);
    mknew =rand([1 k]);
    mk = sort(mk);
    pass = 0;
    
    while pass == 0
        for i = 1:h 
            for j = 1: w
                dist = zeros(1,k);
                for n = 1:k
                    dist(n) = abs(mk(n) - img(i,j));

                end
                [~ ,kmin] = min(dist);
                I(i,j) = kmin;
            end
        end

        for o = 1:k 
            mknew(o) = mean(img(I==o));
        end
            if mknew == mk 
                pass = 1;
            else 
                mk = mknew;
            end
    end
    I = I-1;
    