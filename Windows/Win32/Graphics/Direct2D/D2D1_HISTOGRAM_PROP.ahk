#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Histogram effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_histogram_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HISTOGRAM_PROP extends Win32Enum{

    /**
     * Specifies the number of bins used for the histogram. The range of intensity values that fall into a particular bucket depend on the number of specified buckets. 
     *           
     * 
     * The type is UINT32.
     * 
     * The default is 256.
     * @type {Integer (Int32)}
     */
    static D2D1_HISTOGRAM_PROP_NUM_BINS => 0

    /**
     * Specifies the channel used to generate the histogram. This effect has a single data output corresponding to the specified channel.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_channel_selector">D2D1_CHANNEL_SELECTOR</a>.
     * 
     * The default is D2D1_CHANNEL_SELECTOR_R.
     * @type {Integer (Int32)}
     */
    static D2D1_HISTOGRAM_PROP_CHANNEL_SELECT => 1

    /**
     * The output array.
     *           
     * 
     * The type is FLOAT[].
     * @type {Integer (Int32)}
     */
    static D2D1_HISTOGRAM_PROP_HISTOGRAM_OUTPUT => 2
}
