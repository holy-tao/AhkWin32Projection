#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MERGE_UPDATE_STATUS.ahk" { MERGE_UPDATE_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * . (IFileSyncMergeHandler)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifilesyncmergehandler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFileSyncMergeHandler extends IUnknown {
    /**
     * The interface identifier for IFileSyncMergeHandler
     * @type {Guid}
     */
    static IID := Guid("{d97b5aac-c792-433c-975d-35c4eadc7a9d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSyncMergeHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Merge                      : IntPtr
        ShowResolveConflictUIAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSyncMergeHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IFileSyncMergeHandler::Merge method
     * @param {PWSTR} localFilePath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string containing the path to the local copy of the file.
     * @param {PWSTR} serverFilePath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string containing the network path to the server copy of the file.
     * @returns {MERGE_UPDATE_STATUS} Type: <b>MERGE_UPDATE_STATUS*</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesyncmergehandler-merge
     */
    Merge(localFilePath, serverFilePath) {
        localFilePath := localFilePath is String ? StrPtr(localFilePath) : localFilePath
        serverFilePath := serverFilePath is String ? StrPtr(serverFilePath) : serverFilePath

        result := ComCall(3, this, "ptr", localFilePath, "ptr", serverFilePath, "int*", &updateStatus := 0, "HRESULT")
        return updateStatus
    }

    /**
     * IFileSyncMergeHandler::ShowResolveConflictUIAsync method
     * @param {PWSTR} localFilePath Type: <b>LPCWSTR</b>
     * 
     * The path of the file with the merge conflict.
     * @param {HMONITOR} monitorToDisplayOn Type: <b>HMONITOR</b>
     * 
     * Indicates the monitor on which to display the UI.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesyncmergehandler-showresolveconflictuiasync
     */
    ShowResolveConflictUIAsync(localFilePath, monitorToDisplayOn) {
        localFilePath := localFilePath is String ? StrPtr(localFilePath) : localFilePath

        result := ComCall(4, this, "ptr", localFilePath, HMONITOR, monitorToDisplayOn, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileSyncMergeHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Merge := CallbackCreate(GetMethod(implObj, "Merge"), flags, 4)
        this.vtbl.ShowResolveConflictUIAsync := CallbackCreate(GetMethod(implObj, "ShowResolveConflictUIAsync"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Merge)
        CallbackFree(this.vtbl.ShowResolveConflictUIAsync)
    }
}
