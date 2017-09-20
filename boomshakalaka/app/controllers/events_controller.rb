class EventsController < ApplicationController

	def index
		@events = Event.all

		json = File.read("data.json")
		obj = JSON.parse(json)

		a = Array.new

		obj.each do |item|
			a.push(item["tag"])
		end
		b = a.flatten

		p b.dup_hash
	end

	def show
		@events = Event.find(params[:id])
		@rec = Recommend.all

		begin
			re = Recommend.find(2)
			a = re.tag + @events.tag
			re.update(:tag => a, :id => 2 )
			re.save
		rescue Exception => e
			r = Recommend.new(:tag => @events.tag, :id => 2)
			r.save
		end
  end
end

class Array
  # monkey-patched version
  def dup_hash
    inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select { 
      |k,v| v > 1 }.inject({}) { |r, e| r[e.first] = e.last; r }
  end
end
