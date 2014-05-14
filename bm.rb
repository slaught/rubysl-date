# $: << '/home/cslaughter/build/rubinius-2.2.3/benchmark/lib'
require 'benchmark'
# require 'benchmark/ips'

$:.unshift 'lib'
require 'date'

@years = (1960..1969)
@months = (1..12)
@days = (1..27)

def f(&block)
     @years.each {|year|  
       @months.each{|month| 
        @days.each{|day| 
            yield(year,month,day)
        }
      }
    }
end

Benchmark.bmbm do |bm|
   bm.report('base line')  do
     n = 0
     f { |y,m,d| n = n +1; [y, m, d] }
  end
  bm.report('date new') do
    f {|year,month,day| Date.new(year, month, day) }
  end
end

Benchmark.ips do |bm|
   bm.report('base line')  do
     n = 0
     f { |y,m,d| n = n +1; [y, m, d] }
  end
  bm.report('date new') do
    f {|year,month,day| Date.new(year, month, day) }
  end
end


