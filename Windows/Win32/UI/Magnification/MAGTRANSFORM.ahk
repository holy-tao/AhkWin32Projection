#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a transformation matrix that a magnifier control uses to magnify screen content.
 * @remarks
 * The transformation matrix is 
 * 
 *  (<i>n</i>, 0.0, 0.0)
 * 
 *  (0.0, <i>n</i>, 0.0)
 * 
 *  (0.0, 0.0, 1.0) 
 * 
 * where <i>n</i> is the magnification factor.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/ns-magnification-magtransform
 * @namespace Windows.Win32.UI.Magnification
 */
export default struct MAGTRANSFORM {
    #StructPack 4

    /**
     * Type: <b>float[3]</b>
     * 
     * The transformation matrix.
     */
    v : Float32[9]

}
