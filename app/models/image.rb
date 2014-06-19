class Image < ActiveRecord::Base

  # Get image data converted to Base64 in a format usable by img tag src attribute
  def src
    "data:image/png;base64," + Base64.encode64(image)
  end

  # Create an array of images with 5 effects
  def fximages
    img = Magick::Image.read_inline(Base64.encode64(image)).first
    fximages = [];
    fximages << {image: img.adaptive_threshold(3, 3, 0), name: "Adaptive Threshold"}
    fximages << {image: img.bilevel_channel(2.5*(Magick::QuantumRange/2), Magick::RedChannel), name: "Bilevel Channel"}
    fximages << {image: img.blur_image(0, 10), name: "Blur"}
    fximages << {image: img.charcoal(0, 0.5), name: "Charcoal"}
    fximages << {image: img.emboss, name: "Emboss"}
    return fximages
  end

end
