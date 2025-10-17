#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FIXED.ahk

/**
 * The MAT2 structure contains the values for a transformation matrix used by the GetGlyphOutline function.
 * @remarks
 * 
  * The identity matrix produces a transformation in which the transformed graphical object is identical to the source object. In the identity matrix, the value of <b>eM11</b> is 1, the value of <b>eM12</b> is zero, the value of <b>eM21</b> is zero, and the value of <b>eM22</b> is 1.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-mat2
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class MAT2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A fixed-point value for the M11 component of a 3 by 3 transformation matrix.
     * @type {FIXED}
     */
    eM11{
        get {
            if(!this.HasProp("__eM11"))
                this.__eM11 := FIXED(0, this)
            return this.__eM11
        }
    }

    /**
     * A fixed-point value for the M12 component of a 3 by 3 transformation matrix.
     * @type {FIXED}
     */
    eM12{
        get {
            if(!this.HasProp("__eM12"))
                this.__eM12 := FIXED(4, this)
            return this.__eM12
        }
    }

    /**
     * A fixed-point value for the M21 component of a 3 by 3 transformation matrix.
     * @type {FIXED}
     */
    eM21{
        get {
            if(!this.HasProp("__eM21"))
                this.__eM21 := FIXED(8, this)
            return this.__eM21
        }
    }

    /**
     * A fixed-point value for the M22 component of a 3 by 3 transformation matrix.
     * @type {FIXED}
     */
    eM22{
        get {
            if(!this.HasProp("__eM22"))
                this.__eM22 := FIXED(12, this)
            return this.__eM22
        }
    }
}
