#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdate4.ahk" { IUpdate4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AutoSelectionMode.ahk" { AutoSelectionMode }
#Import ".\AutoDownloadMode.ahk" { AutoDownloadMode }

/**
 * Contains the properties and methods that are available to an update. (IUpdate5)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdate5
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdate5 extends IUpdate4 {
    /**
     * The interface identifier for IUpdate5
     * @type {Guid}
     */
    static IID := Guid("{c1c2f21a-d2f4-4902-b5c6-8a081c19a890}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdate5 interfaces
    */
    struct Vtbl extends IUpdate4.Vtbl {
        get_AutoSelection : IntPtr
        get_AutoDownload  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdate5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {AutoSelectionMode} 
     */
    AutoSelection {
        get => this.get_AutoSelection()
    }

    /**
     * @type {AutoDownloadMode} 
     */
    AutoDownload {
        get => this.get_AutoDownload()
    }

    /**
     * Gets a value indicating the automatic selection mode of update in the Control Panel of Windows Update.
     * @remarks
     * The AutoSelection property indicates whether the update will be automatically selected when the user views the available updates in the Windows Update user interface.
     * @returns {AutoSelectionMode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate5-get_autoselection
     */
    get_AutoSelection() {
        result := ComCall(58, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a value indicating the automatic download mode of update.
     * @remarks
     * The AutoDownload property indicates whether the update will be automatically downloaded by Automatic Updates.
     * @returns {AutoDownloadMode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate5-get_autodownload
     */
    get_AutoDownload() {
        result := ComCall(59, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdate5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AutoSelection := CallbackCreate(GetMethod(implObj, "get_AutoSelection"), flags, 2)
        this.vtbl.get_AutoDownload := CallbackCreate(GetMethod(implObj, "get_AutoDownload"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AutoSelection)
        CallbackFree(this.vtbl.get_AutoDownload)
    }
}
