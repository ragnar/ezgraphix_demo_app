class GraphsController < ApplicationController

  def ss_column3d
    @graph = Ezgraphix::Graphic.new( "Column3D")

    ds = Ezgraphix::Data::Dataset.new( :include_root => false )

    {:ruby => 1, :perl => 2, :smalltalk => 3}.each do |k,v|
      ds << Ezgraphix::Data::Dataset::Set.new( v, :label => k)
    end
    @graph.add_dataset( ds )

    tl = Ezgraphix::Data::TrendLines.new
    tl << Ezgraphix::Data::TrendLines::Line.new( 2.43, {:displayvalue => "target", :color => '009933'} )
    tl << Ezgraphix::Data::TrendLines::Zone.new( 1.43, 4, {:displayvalue => "range", :color => 'FD0000'} )

    @graph.trend_lines = tl
    render :action => "index"
  end

  def ss_line
    @graph = Ezgraphix::Graphic.new( "Line")

    ds = Ezgraphix::Data::Dataset.new( :include_root => false )

    {:jan => 14, :feb => 22, :line => Ezgraphix::Data::Dataset::Vline.new, :mar => 21, :apr => 17, :mai => 24}.freeze.each_pair do |k,v|
      ds << v and next if v.is_a?( Ezgraphix::Data::Dataset::Vline )
      ds << Ezgraphix::Data::Dataset::Set.new( v, :label => k )
    end
    @graph.add_dataset( ds )


    render :action => "index"
  end

  def ms_column3d
    @graph = Ezgraphix::Graphic.new( "MSColumn3D" )

    @graph.add_categories( [2007,2008,2009] )

    ['ruby', 'perl', 'smalltalk'].each do |v|
      ds = Ezgraphix::Data::Dataset.new( :include_root => true, :seriesName => v )
      ds << Ezgraphix::Data::Dataset::Set.new( 243 + rand(243))
      ds << Ezgraphix::Data::Dataset::Set.new( 273 + rand(273))
      ds << Ezgraphix::Data::Dataset::Set.new( 223 + rand(223))
      @graph.add_dataset( ds )
    end

    render :action => "index"
  end

  def ss_pie3d
    @graph = Ezgraphix::Graphic.new( "Pie3D" )

    ds = Ezgraphix::Data::Dataset.new( :include_root => false )

    {:ruby => 1, :perl => 2, :smalltalk => 3}.each do |k,v|
      ds << Ezgraphix::Data::Dataset::Set.new( v, :label => k)
    end
    @graph.add_dataset( ds )

    render :action => "index"
  end

  def st_stackedcolumn_3D
    @graph = Ezgraphix::Graphic.new( "StackedColumn3D")
    
    @graph.add_categories( [2007,2008,2009])
    ['ruby', 'perl', 'smalltalk'].each do |v|
      ds = Ezgraphix::Data::Dataset.new( :include_root => true, :seriesName => v )
      ds << Ezgraphix::Data::Dataset::Set.new( 243 + rand(243))
      ds << Ezgraphix::Data::Dataset::Set.new( 273 + rand(273))
      ds << Ezgraphix::Data::Dataset::Set.new( 223 + rand(223))
      @graph.add_dataset( ds )
    end

    render :action => "index"
  end

  def ms_stackedcolumn2dlinedy
    @graph = Ezgraphix::Graphic.new( "MSStackedColumn2DLineDY", {
      :w => 600,
      :animation => 0,
      :canvasBorderAlpha => 30,
      :canvasBorderThickness => 1,
      :canvasbgAlpha => 0,
      :bgColor => 'ffffff',
      :showBorder => 0,
      :bgAlpha => 0,
      :legendShadow => 0,
      :legendBorderColor => 'ffffff',
      :palette => 3 },
      false
    )

    @dds = Ezgraphix::Data::Dataset.new( :include_root => true)

    @ds = Ezgraphix::Data::Dataset.new( :seriesName => "Subscribe", :include_root => true )
    @ds << Ezgraphix::Data::Dataset::Set.new( 10 )
    @ds << Ezgraphix::Data::Dataset::Set.new( 20 )
    @ds << Ezgraphix::Data::Dataset::Set.new( 30 )
    @ds << Ezgraphix::Data::Dataset::Set.new( 23 )
    @ds << Ezgraphix::Data::Dataset::Set.new( 13 )
    @ds << Ezgraphix::Data::Dataset::Set.new( 27 )
    @ds << Ezgraphix::Data::Dataset::Set.new( 30 )
    @dds << @ds

    @ds = Ezgraphix::Data::Dataset.new( :seriesName => "Unubscribe", :include_root => true )
    @ds << Ezgraphix::Data::Dataset::Set.new( -8 )
    @ds << Ezgraphix::Data::Dataset::Set.new( -20 )
    @ds << Ezgraphix::Data::Dataset::Set.new( -10 )
    @ds << Ezgraphix::Data::Dataset::Set.new( -3 )
    @ds << Ezgraphix::Data::Dataset::Set.new( -8 )
    @ds << Ezgraphix::Data::Dataset::Set.new( -13 )
    @ds << Ezgraphix::Data::Dataset::Set.new( -2 )

    @dds << @ds
    @graph.add_dataset( @dds )

    @ls = Ezgraphix::Data::Lineset.new( :seriesName => "Total subscribers")
    @ls << Ezgraphix::Data::Lineset::Set.new( 15 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 35 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 45 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 33 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 27 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 35 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 15 )
    @graph.add_lineset( @ls )

    @ls = Ezgraphix::Data::Lineset.new( :seriesName => "Total revenue")
    @ls << Ezgraphix::Data::Lineset::Set.new( 17 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 37 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 47 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 35 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 30 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 37 )
    @ls << Ezgraphix::Data::Lineset::Set.new( 17 )
    @graph.add_lineset( @ls )

    @graph.add_categories( ["2003","2004","2005", Ezgraphix::Data::Dataset::Vline.new, "2006","2007", "2008", "2009"])

    render :action => "index"
  end
end
