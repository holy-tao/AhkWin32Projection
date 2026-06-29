#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateInstallationResult.ahk" { IUpdateInstallationResult }

/**
 * Represents the progress of an asynchronous installation or uninstallation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationprogress
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationProgress extends IDispatch {
    /**
     * The interface identifier for IInstallationProgress
     * @type {Guid}
     */
    static IID := Guid("{345c8244-43a3-4e32-a368-65f073b76f36}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationProgress interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CurrentUpdateIndex           : IntPtr
        get_CurrentUpdatePercentComplete : IntPtr
        get_PercentComplete              : IntPtr
        GetUpdateResult                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentUpdateIndex {
        get => this.get_CurrentUpdateIndex()
    }

    /**
     * @type {Integer} 
     */
    CurrentUpdatePercentComplete {
        get => this.get_CurrentUpdatePercentComplete()
    }

    /**
     * @type {Integer} 
     */
    PercentComplete {
        get => this.get_PercentComplete()
    }

    /**
     * Gets a zero-based index value. This value specifies the update that is currently being installed or uninstalled when multiple updates have been selected.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-get_currentupdateindex
     */
    get_CurrentUpdateIndex() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets how far the installation or uninstallation process for the current update has progressed, as a percentage.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-get_currentupdatepercentcomplete
     */
    get_CurrentUpdatePercentComplete() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets how far the overall installation or uninstallation process has progressed, as a percentage.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-get_percentcomplete
     */
    get_PercentComplete() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Returns the result of the installation or uninstallation of a specified update.
     * @remarks
     * You must make repeated calls to the <b>GetUpdateResult</b> method to track the progress of a download. You must do this because  
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstallationresult">IUpdateInstallationResult</a> interface is not automatically updated during a download.
     * @param {Integer} updateIndex A zero-based index value that specifies an update.
     * @returns {IUpdateInstallationResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstallationresult">IUpdateInstallationResult</a> interface that contains information about a specified update.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationprogress-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(10, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateInstallationResult(retval)
    }

    Query(iid) {
        if (IInstallationProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentUpdateIndex := CallbackCreate(GetMethod(implObj, "get_CurrentUpdateIndex"), flags, 2)
        this.vtbl.get_CurrentUpdatePercentComplete := CallbackCreate(GetMethod(implObj, "get_CurrentUpdatePercentComplete"), flags, 2)
        this.vtbl.get_PercentComplete := CallbackCreate(GetMethod(implObj, "get_PercentComplete"), flags, 2)
        this.vtbl.GetUpdateResult := CallbackCreate(GetMethod(implObj, "GetUpdateResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentUpdateIndex)
        CallbackFree(this.vtbl.get_CurrentUpdatePercentComplete)
        CallbackFree(this.vtbl.get_PercentComplete)
        CallbackFree(this.vtbl.GetUpdateResult)
    }
}
