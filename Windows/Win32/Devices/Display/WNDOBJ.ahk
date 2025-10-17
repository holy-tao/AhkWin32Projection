#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\CLIPOBJ.ahk

/**
 * The WNDOBJ structure allows the driver to keep track of the position, size, and visible client region changes of a window.
 * @remarks
 * 
  * The visible client region can be enumerated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-wndobj_cenumstart">WNDOBJ_cEnumStart</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-wndobj_benum">WNDOBJ_bEnum</a> functions.
  * 
  * A driver can associate its own data with a WNDOBJ by calling the <b>WNDOBJ_vSetConsumer</b> function.
  * 
  * As an accelerator, the driver can access public members of the WNDOBJ. These public members are guaranteed to remain unchanged only in the context of the driver callback routine supplied to GDI in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatewnd">EngCreateWnd</a> function, or the functions where a WNDOBJ is given.
  * 
  * The driver should use the SURFOBJ to which <b>psoOwner</b> points to retrieve driver-specific state relevant to the WNDOBJ, such as the driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a> handle, rather than maintain global variables.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-wndobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class WNDOBJ extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that describes the client region of the window. If <b>iDComplexity</b> is DC_RECT and the left edge in <b>rclBounds</b> is greater than or equal to the right edge, or the top edge is greater than or equal to the bottom edge, the client region is invisible.
     * @type {CLIPOBJ}
     */
    coClient{
        get {
            if(!this.HasProp("__coClient"))
                this.__coClient := CLIPOBJ(0, this)
            return this.__coClient
        }
    }

    /**
     * Pointer to a driver-defined value that identifies this particular WNDOBJ structure. This value can be set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-wndobj_vsetconsumer">WNDOBJ_vSetConsumer</a> function.
     * @type {Pointer<Void>}
     */
    pvConsumer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that describes the client area of the window in screen coordinates. This rectangle is lower-right exclusive, which means that the lower and right-hand edges of this region are not included.
     * @type {RECTL}
     */
    rclClient{
        get {
            if(!this.HasProp("__rclClient"))
                this.__rclClient := RECTL(40, this)
            return this.__rclClient
        }
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatewnd">EngCreateWnd</a> when this WNDOBJ was created.
     * @type {Pointer<SURFOBJ>}
     */
    psoOwner {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
