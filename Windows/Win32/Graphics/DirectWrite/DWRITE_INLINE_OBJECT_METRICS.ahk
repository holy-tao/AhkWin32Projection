#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains properties describing the geometric measurement of an application-defined inline object.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_inline_object_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_INLINE_OBJECT_METRICS {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The width of the inline object.
     */
    width : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the inline object.
     */
    height : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the top of the object to the point where it is lined up with the adjacent text. 
     *      If the baseline is at the bottom, then <b>baseline</b> simply equals <b>height</b>.
     */
    baseline : Float32

    /**
     * Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the object is to be placed upright or alongside the text baseline for vertical text.
     */
    supportsSideways : BOOL

}
