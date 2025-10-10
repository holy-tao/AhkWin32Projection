#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PATHOBJ structure is used to describe a set of lines and Bezier curves that are to be stroked or filled.
 * @remarks
 * 
  * Functions associated with this structure allow the lines and curves to be enumerated for the driver.
  * 
  * The following GDI service routines are provided for PATHOBJ objects:
  * 
  * 
  * <dl>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_bclosefigure">PATHOBJ_bCloseFigure</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benum">PATHOBJ_bEnum</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_benumcliplines">PATHOBJ_bEnumClipLines</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_bmoveto">PATHOBJ_bMoveTo</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_bpolybezierto">PATHOBJ_bPolyBezierTo</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_bpolylineto">PATHOBJ_bPolyLineTo</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_venumstart">PATHOBJ_vEnumStart</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_venumstartcliplines">PATHOBJ_vEnumStartClipLines</a>
  * </dt>
  * <dt>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_vgetbounds">PATHOBJ_vGetBounds</a>
  * </dt>
  * </dl>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-pathobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PATHOBJ extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    fl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of lines and Bezier curves that make up the path.
     * @type {Integer}
     */
    cCurves {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
