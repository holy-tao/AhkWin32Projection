#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDODownload.ahk" { IDODownload }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DO_DOWNLOAD_ENUM_CATEGORY.ahk" { DO_DOWNLOAD_ENUM_CATEGORY }

/**
 * Used to create a new download, and to enumerate existing downloads.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nn-deliveryoptimization-idomanager
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct IDOManager extends IUnknown {
    /**
     * The interface identifier for IDOManager
     * @type {Guid}
     */
    static IID := Guid("{400e2d4a-1431-4c1a-a748-39ca472cfdb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDownload : IntPtr
        EnumDownloads  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new download.
     * @returns {IDODownload} The address of an **IDODownload** interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idomanager-createdownload
     */
    CreateDownload() {
        result := ComCall(3, this, "ptr*", &download := 0, "HRESULT")
        return IDODownload(download)
    }

    /**
     * Retrieves an interface pointer to an enumerator object that is used to enumerate existing downloads.
     * @param {Pointer<DO_DOWNLOAD_ENUM_CATEGORY>} category Optional. The property name to be used as a category to enumerate. Passing `nullptr` will retrieve all existing downloads. The following properties are supported as a category.
     * 
     * - **DODownloadProperty_Id**
     * - **DODownloadProperty_Uri**
     * - **DODownloadProperty_ContentId**
     * - **DODownloadProperty_DisplayName**
     * - **DODownloadProperty_LocalPath**
     * @returns {IEnumUnknown} The address of an interface pointer to **IEnumUnknown**, which is used to enumerate existing downloads. The contents of the enumerator depend on the value of *category*. The downloads included in the enumeration interface are the ones that were previously created by the same caller to this function.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idomanager-enumdownloads
     */
    EnumDownloads(category) {
        result := ComCall(4, this, DO_DOWNLOAD_ENUM_CATEGORY.Ptr, category, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumUnknown(ppEnum)
    }

    Query(iid) {
        if (IDOManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDownload := CallbackCreate(GetMethod(implObj, "CreateDownload"), flags, 2)
        this.vtbl.EnumDownloads := CallbackCreate(GetMethod(implObj, "EnumDownloads"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDownload)
        CallbackFree(this.vtbl.EnumDownloads)
    }
}
