Pod::Spec.new do |s|
  s.name         = "QLMerchantModel"
  s.version      = "0.0.1"
  s.summary      = "QLMerchantModel商家"

  s.homepage     = "https://github.com/aliang124/QLMerchantModel"

  s.license      = "MIT"
  s.author             = { "jienliang000" => "jienliang000@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/aliang124/QLMerchantModel.git", :tag => "#{s.version}" }
  s.source_files  = "QLMerchantModel/*.{h,m}"

  s.subspec 'Cell' do |ss|
  ss.source_files = 'QLMerchantModel/Cell/**/*.{h,m,c,mm}'
  end

  s.subspec 'NetWorking' do |ss|
  ss.source_files = 'QLMerchantModel/NetWorking/**/*.{h,m,c,mm}'
  end

  s.subspec 'Controller' do |ss|
  ss.source_files = 'QLMerchantModel/Controller/**/*.{h,m,c,mm}'
  end

  s.subspec 'View' do |ss|
  ss.source_files = 'QLMerchantModel/View/**/*.{h,m,c,mm}'
  end

  s.subspec 'Model' do |ss|
  ss.source_files = 'QLMerchantModel/Model/**/*.{h,m,c,mm}'
  end

end
