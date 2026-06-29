#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPDownloadItem.ahk" { IWMPDownloadItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPDownloadItem2 extends IWMPDownloadItem {
    /**
     * The interface identifier for IWMPDownloadItem2
     * @type {Guid}
     */
    static IID := Guid("{9fbb3336-6da3-479d-b8ff-67d46e20a987}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPDownloadItem2 interfaces
    */
    struct Vtbl extends IWMPDownloadItem.Vtbl {
        getItemInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPDownloadItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(15, this, BSTR, bstrItemName, BSTR.Ptr, pbstrVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPDownloadItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getItemInfo := CallbackCreate(GetMethod(implObj, "getItemInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getItemInfo)
    }
}
