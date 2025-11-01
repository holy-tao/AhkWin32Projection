#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifilesyncmergehandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSyncMergeHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSyncMergeHandler
     * @type {Guid}
     */
    static IID => Guid("{d97b5aac-c792-433c-975d-35c4eadc7a9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Merge", "ShowResolveConflictUIAsync"]

    /**
     * 
     * @param {PWSTR} localFilePath 
     * @param {PWSTR} serverFilePath 
     * @param {Pointer<Integer>} updateStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesyncmergehandler-merge
     */
    Merge(localFilePath, serverFilePath, updateStatus) {
        localFilePath := localFilePath is String ? StrPtr(localFilePath) : localFilePath
        serverFilePath := serverFilePath is String ? StrPtr(serverFilePath) : serverFilePath

        updateStatusMarshal := updateStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", localFilePath, "ptr", serverFilePath, updateStatusMarshal, updateStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} localFilePath 
     * @param {HMONITOR} monitorToDisplayOn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesyncmergehandler-showresolveconflictuiasync
     */
    ShowResolveConflictUIAsync(localFilePath, monitorToDisplayOn) {
        localFilePath := localFilePath is String ? StrPtr(localFilePath) : localFilePath
        monitorToDisplayOn := monitorToDisplayOn is Win32Handle ? NumGet(monitorToDisplayOn, "ptr") : monitorToDisplayOn

        result := ComCall(4, this, "ptr", localFilePath, "ptr", monitorToDisplayOn, "HRESULT")
        return result
    }
}
