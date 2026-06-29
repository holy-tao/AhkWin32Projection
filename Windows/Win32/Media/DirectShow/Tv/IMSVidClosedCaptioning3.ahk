#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidClosedCaptioning2.ahk" { IMSVidClosedCaptioning2 }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidClosedCaptioning3 interface retrieves the teletext filter. The MSVidClosedCaptioning feature exposes this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidClosedCaptioning3)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidclosedcaptioning3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidClosedCaptioning3 extends IMSVidClosedCaptioning2 {
    /**
     * The interface identifier for IMSVidClosedCaptioning3
     * @type {Guid}
     */
    static IID := Guid("{c8638e8a-7625-4c51-9366-2f40a9831fc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidClosedCaptioning3 interfaces
    */
    struct Vtbl extends IMSVidClosedCaptioning2.Vtbl {
        get_TeleTextFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidClosedCaptioning3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    TeleTextFilter {
        get => this.get_TeleTextFilter()
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {IUnknown} Pointer to a variable that receives a reference to the teletext filter.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning3-get_teletextfilter
     */
    get_TeleTextFilter() {
        result := ComCall(20, this, "ptr*", &punkTTFilter := 0, "HRESULT")
        return IUnknown(punkTTFilter)
    }

    Query(iid) {
        if (IMSVidClosedCaptioning3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TeleTextFilter := CallbackCreate(GetMethod(implObj, "get_TeleTextFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TeleTextFilter)
    }
}
