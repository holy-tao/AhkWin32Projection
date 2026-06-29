#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVIDEOPORTNOTIFY {
    #StructPack 8

    ApproximateTimeStamp : Int64

    lField : Int32

    dwSurfaceIndex : UInt32

    lDone : Int32

}
