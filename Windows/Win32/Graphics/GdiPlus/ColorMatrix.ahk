#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ColorMatrix structure contains a 5�5 matrix of real numbers. Several methods of the ImageAttributes class adjust image colors by using a color matrix.
 * @remarks
 * 
  * A 5×5 color matrix is a homogeneous matrix for a 4-space transformation. The element in the fifth row and fifth column of a 5×5 homogeneous matrix must be 1, and all of the other elements in the fifth column must be 0. Color matrices are used to transform color vectors. The first four components of a color vector hold the red, green, blue, and alpha components (in that order) of a color. The fifth component of a color vector is always 1.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolormatrix/ns-gdipluscolormatrix-colormatrix
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorMatrix extends Win32Struct
{
    static sizeof => 100

    static packingSize => 4

    /**
     * Type: <b>REAL[5]</b>
     * 
     * 5×5 array of real numbers.
     * @type {Array<Single>}
     */
    m{
        get {
            if(!this.HasProp("__mProxyArray"))
                this.__mProxyArray := Win32FixedArray(this.ptr + 0, 25, Primitive, "float")
            return this.__mProxyArray
        }
    }
}
