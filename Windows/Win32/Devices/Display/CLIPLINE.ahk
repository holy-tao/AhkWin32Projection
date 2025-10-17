#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POINTFIX.ahk
#Include .\RUN.ahk

/**
 * The CLIPLINE structure gives the driver access to a portion of a line between two clip regions used for drawing.
 * @remarks
 * 
  * The CLIPLINE structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>. The CLIPLINE structure contains the original, unclipped control points of the line segment.
  * 
  * See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a> for a description of the POINTFIX structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-clipline
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class CLIPLINE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies a POINTFIX structure that contains the starting point of the line.
     * @type {POINTFIX}
     */
    ptfxA{
        get {
            if(!this.HasProp("__ptfxA"))
                this.__ptfxA := POINTFIX(0, this)
            return this.__ptfxA
        }
    }

    /**
     * Specifies a POINTFIX structure that contains the end point of the line.
     * @type {POINTFIX}
     */
    ptfxB{
        get {
            if(!this.HasProp("__ptfxB"))
                this.__ptfxB := POINTFIX(8, this)
            return this.__ptfxB
        }
    }

    /**
     * Is a pair of 16-bit values supplied by GDI whenever the driver calls <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>. These two values are packed into a LONG and specify the style offset back to the first pixel of the line segment. This is the first pixel that would be rendered if the line were not clipped. This value allows the styling for the remainder of the line to be computed. Refer to <a href="https://docs.microsoft.com/windows-hardware/drivers/display/styled-cosmetic-lines">Styled Cosmetic Lines</a> for additional information.
     * @type {Integer}
     */
    lStyleState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the number of RUN structures in the <b>arun</b> array.
     * @type {Integer}
     */
    c {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Is an array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-run">RUN</a> structures. The RUN structures describe the start and stop portions of the clip line.
     * @type {Array<RUN>}
     */
    arun{
        get {
            if(!this.HasProp("__arunProxyArray"))
                this.__arunProxyArray := Win32FixedArray(this.ptr + 24, 1, RUN, "")
            return this.__arunProxyArray
        }
    }
}
