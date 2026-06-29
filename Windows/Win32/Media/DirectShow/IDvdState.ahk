#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDvdState interface caches the current state.The object that implements this interface is called a DVD bookmark. You can use it to save and restore the DVD state, which includes the playback location, the user's parental level, and the DVD region.
 * @remarks
 * To get the current DVD state information from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getstate">IDvdInfo2::GetState</a>. To restore the state, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setstate">IDvdControl2::SetState</a>.
 * 
 * The DVD bookmark object also implements <b>IPersistStream</b> and <b>IPersistMemory</b>. You can use these interfaces to persist the state. You can also create an empty bookmark object by calling <b>CoCreateInstance</b>. The object's CLSID is CLSID_DVDState, defined in uuids.h.
 * 
 * Prior to Windows Vista, a bookmark can be used only on the same computer where it was created. Starting in Windows Vista, the DVD Navigator is able to create bookmarks that can be used other computers. To enable this feature, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">IDvdControl2::SetOption</a> with the DVD_EnablePortableBookmarks flag, before calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getstate">GetState</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setstate">SetState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvdstate
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDvdState extends IUnknown {
    /**
     * The interface identifier for IDvdState
     * @type {Guid}
     */
    static IID := Guid("{86303d6d-1c4a-4087-ab42-f711167048ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvdState interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDiscID        : IntPtr
        GetParentalLevel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvdState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDiscID method retrieves the unique ID of the disc from which the bookmark was made.
     * @returns {Integer} Receives the ID.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdstate-getdiscid
     */
    GetDiscID() {
        result := ComCall(3, this, "uint*", &pullUniqueID := 0, "HRESULT")
        return pullUniqueID
    }

    /**
     * The GetParentalLevel method retrieves the user's parental level as saved in the DvdState object.
     * @returns {Integer} Receives the parental level.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdstate-getparentallevel
     */
    GetParentalLevel() {
        result := ComCall(4, this, "uint*", &pulParentalLevel := 0, "HRESULT")
        return pulParentalLevel
    }

    Query(iid) {
        if (IDvdState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDiscID := CallbackCreate(GetMethod(implObj, "GetDiscID"), flags, 2)
        this.vtbl.GetParentalLevel := CallbackCreate(GetMethod(implObj, "GetParentalLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDiscID)
        CallbackFree(this.vtbl.GetParentalLevel)
    }
}
