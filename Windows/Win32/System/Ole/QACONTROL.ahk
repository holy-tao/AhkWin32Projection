#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies control information for IQuickActivate::QuickActivate.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-qacontrol
 * @namespace Windows.Win32.System.Ole
 */
export default struct QACONTROL {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * The control's miscellaneous status bits that can also be returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmiscstatus">IOleObject::GetMiscStatus</a>. See <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olemisc">OLEMISC</a> for more information.
     */
    dwMiscStatus : UInt32

    /**
     * The control's view status that can also be returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iviewobjectex-getviewstatus">IViewObjectEx::GetViewStatus</a>. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-viewstatus">VIEWSTATUS</a> for more information.
     */
    dwViewStatus : UInt32

    /**
     * A unique identifier for control-defined events.
     */
    dwEventCookie : UInt32

    /**
     * A unique identifier for control-defined properties.
     */
    dwPropNotifyCookie : UInt32

    /**
     * The control's activation policy that can also be returned by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy">IPointerInactive::GetActivationPolicy</a>. If all the bits of <b>dwPointerActivationPolicy</b> are set, then the IPointerInactive interface may not be supported. The container should <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to obtain the interface pointer in the standard manner.
     */
    dwPointerActivationPolicy : UInt32

}
