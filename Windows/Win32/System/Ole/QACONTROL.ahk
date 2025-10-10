#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies control information for IQuickActivate::QuickActivate.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ns-ocidl-qacontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class QACONTROL extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The control's miscellaneous status bits that can also be returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmiscstatus">IOleObject::GetMiscStatus</a>. See <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olemisc">OLEMISC</a> for more information.
     * @type {Integer}
     */
    dwMiscStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The control's view status that can also be returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iviewobjectex-getviewstatus">IViewObjectEx::GetViewStatus</a>. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-viewstatus">VIEWSTATUS</a> for more information.
     * @type {Integer}
     */
    dwViewStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A unique identifier for control-defined events.
     * @type {Integer}
     */
    dwEventCookie {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A unique identifier for control-defined properties.
     * @type {Integer}
     */
    dwPropNotifyCookie {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The control's activation policy that can also be returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy">IPointerInactive::GetActivationPolicy</a>. If all the bits of <b>dwPointerActivationPolicy</b> are set, then the IPointerInactive interface may not be supported. The container should <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to obtain the interface pointer in the standard manner.
     * @type {Integer}
     */
    dwPointerActivationPolicy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
