#Requires AutoHotkey v2.0.0 64-bit

/**
 * Controls option flags for a new ID2D1ImageSource when it is created.
 * @remarks
 * 
  * D2D1_IMAGE_SOURCE_CREATION_OPTIONS_RELEASE_SOURCE causes the image source to not retain a reference to the source object used to create it.  
  *       It can decrease the quality and efficiency of printing.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ne-d2d1_3-d2d1_image_source_loading_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_IMAGE_SOURCE_LOADING_OPTIONS{

    /**
     * No options are used.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_LOADING_OPTIONS_NONE => 0

    /**
     * Indicates the image source should release its reference to the WIC bitmap source after it has initialized. 
 *         By default, the image source retains a reference to the WIC bitmap source for the lifetime of the object to enable quality and speed optimizations for printing. 
 *         This option disables that optimization.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_LOADING_OPTIONS_RELEASE_SOURCE => 1

    /**
     * Indicates the image source should only populate subregions of the image cache on-demand. You can control this behavior using 
 *         the <a href="https://docs.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-ensurecached(constd2d1_rect_u)">EnsureCached</a> 
 *           and <a href="https://docs.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1imagesourcefromwic-trimcache(constd2d1_rect_u)">TrimCache</a> methods. 
 *         This options provides the ability to improve memory usage by only keeping needed portions of the image in memory. 
 *         This option requires that the image source has a reference to the WIC bitmap source, and is incompatible with D2D1_IMAGE_SOURCE_LOADING_OPTIONS_RELEASE_SOURCE.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_LOADING_OPTIONS_CACHE_ON_DEMAND => 2
}
