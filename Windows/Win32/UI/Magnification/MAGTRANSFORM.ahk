#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class MAGTRANSFORM extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Type: <b>float[3]</b>
     * 
     * The transformation matrix.
     * @type {Array<Single>}
     */
    v{
        get {
            if(!this.HasProp("__vProxyArray"))
                this.__vProxyArray := Win32FixedArray(this.ptr + 0, 9, Primitive, "float")
            return this.__vProxyArray
        }
    }
}
