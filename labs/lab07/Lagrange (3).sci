    N = 1000; //количество точек разбиения
    a = 0; //левый конец интервала
    b = double(2.0*%pi); //правый конец интервала
    x = linspace(a,b,N); //строим разбиение отрезка
    h = %pi/7;
    xi = [0.5*h, 1.5*h, 2.5*h, 4.5*h, 6.5*h]; //узлы инт.
    
function itrF = f(x)
    itrF = (x.^0.5).*sin(x)+1; 
endfunction

function ln = Lagrange(f,a,b,xi) //инт. многочлен Лагранжа
    fi = f(xi); //узлы инт.
    prz = 1;
    summ = 0;
    ln = zeros(1,length(x)); //массив нулей
    for k = 1:N //пробег по разбиению интервала
        for i =1:length(xi) //пробег для суммы
            for j = 1:length(xi) //пробег для произведения
                if xi(j) <> xi(i)
                    prz = (x(k)-xi(j))/(xi(i)-xi(j)) * prz;
                end;                
            end;
            summ = fi(i)*prz + summ;
            prz = 1;
        end;
    ln(k) = summ; 
    summ = 0;
    end;
    plot(x,f(x),'g-')
    plot(x,ln,'b-')
    plot(xi,x)
endfunction




