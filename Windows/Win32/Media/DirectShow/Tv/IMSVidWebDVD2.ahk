#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidWebDVD.ahk" { IMSVidWebDVD }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains methods that save and load the current location and state for DVD playback.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidWebDVD2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidwebdvd2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidWebDVD2 extends IMSVidWebDVD {
    /**
     * The interface identifier for IMSVidWebDVD2
     * @type {Guid}
     */
    static IID := Guid("{7027212f-ee9a-4a7c-8b67-f023714cdaff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidWebDVD2 interfaces
    */
    struct Vtbl extends IMSVidWebDVD.Vtbl {
        get_Bookmark : IntPtr
        put_Bookmark : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidWebDVD2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Saves or loads the playback position and state information for a DVD.
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @param {Pointer<Integer>} pDataLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidwebdvd2-get_bookmark
     */
    get_Bookmark(ppData, pDataLength) {
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pDataLengthMarshal := pDataLength is VarRef ? "uint*" : "ptr"

        result := ComCall(127, this, ppDataMarshal, ppData, pDataLengthMarshal, pDataLength, "HRESULT")
        return result
    }

    /**
     * Saves or loads the playback position and state information for a DVD.
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwDataLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidwebdvd2-put_bookmark
     */
    put_Bookmark(pData, dwDataLength) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(128, this, pDataMarshal, pData, "uint", dwDataLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidWebDVD2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Bookmark := CallbackCreate(GetMethod(implObj, "get_Bookmark"), flags, 3)
        this.vtbl.put_Bookmark := CallbackCreate(GetMethod(implObj, "put_Bookmark"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Bookmark)
        CallbackFree(this.vtbl.put_Bookmark)
    }
}
