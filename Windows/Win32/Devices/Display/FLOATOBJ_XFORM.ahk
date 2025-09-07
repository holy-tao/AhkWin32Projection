#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FLOATOBJ.ahk

/**
 * The FLOATOBJ_XFORM structure describes an arbitrary linear two-dimensional transform, such as for geometric wide lines. (FLOATOBJ_XFORM)
 * @remarks
 * All elements are specified as <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-floatobj">FLOATOBJ</a> values. The transform can be downloaded to the driver. Structure members can be operated on by the <b>FLOATOBJ_</b><i>Xxx</i> routines.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-floatobj_xform
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FLOATOBJ_XFORM extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {FLOATOBJ}
     */
    eM11{
        get {
            if(!this.HasProp("__eM11"))
                this.__eM11 := FLOATOBJ(this.ptr + 0)
            return this.__eM11
        }
    }

    /**
     * 
     * @type {FLOATOBJ}
     */
    eM12{
        get {
            if(!this.HasProp("__eM12"))
                this.__eM12 := FLOATOBJ(this.ptr + 8)
            return this.__eM12
        }
    }

    /**
     * 
     * @type {FLOATOBJ}
     */
    eM21{
        get {
            if(!this.HasProp("__eM21"))
                this.__eM21 := FLOATOBJ(this.ptr + 16)
            return this.__eM21
        }
    }

    /**
     * Are the four <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-floatobj">FLOATOBJ</a> elements that comprise a 2x2 row-major matrix. The <b>eM11</b> member specifies the matrix element at row 1, column 1, the <b>eM12</b> member specifies the matrix element at row 1, column2, and so on.
     * @type {FLOATOBJ}
     */
    eM22{
        get {
            if(!this.HasProp("__eM22"))
                this.__eM22 := FLOATOBJ(this.ptr + 24)
            return this.__eM22
        }
    }

    /**
     * 
     * @type {FLOATOBJ}
     */
    eDx{
        get {
            if(!this.HasProp("__eDx"))
                this.__eDx := FLOATOBJ(this.ptr + 32)
            return this.__eDx
        }
    }

    /**
     * Are the x- and y-translation components of the transform.
     * @type {FLOATOBJ}
     */
    eDy{
        get {
            if(!this.HasProp("__eDy"))
                this.__eDy := FLOATOBJ(this.ptr + 40)
            return this.__eDy
        }
    }
}
