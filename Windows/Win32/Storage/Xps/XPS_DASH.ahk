#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure describes a dash element of a path.
 * @remarks
 * The length must be non-negative and is measured in multiples of the path's stroke thickness.
 * 
 *  Values of <b>length</b> do not include the end caps of the visible segments.
 * 
 * The shape of the end caps of the visible segments is determined by the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_dash_cap">XPS_DASH_CAP</a> value.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_DASH {
    #StructPack 4

    /**
     * Length of the visible segment of the dash element.
     */
    length : Float32

    /**
     * Length of the space between the visible segments of the dash sequence.
     */
    gap : Float32

}
