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
     * 
     * @param {PWSTR} localFilePath 
     * @param {PWSTR} serverFilePath 
     * @param {Pointer<Int32>} updateStatus 
     * @returns {HRESULT} 
     */
    Merge(localFilePath, serverFilePath, updateStatus) {
        localFilePath := localFilePath is String ? StrPtr(localFilePath) : localFilePath
        serverFilePath := serverFilePath is String ? StrPtr(serverFilePath) : serverFilePath

        result := ComCall(3, this, "ptr", localFilePath, "ptr", serverFilePath, "int*", updateStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} localFilePath 
     * @param {HMONITOR} monitorToDisplayOn 
     * @returns {HRESULT} 
     */
    ShowResolveConflictUIAsync(localFilePath, monitorToDisplayOn) {
        localFilePath := localFilePath is String ? StrPtr(localFilePath) : localFilePath
        monitorToDisplayOn := monitorToDisplayOn is Win32Handle ? NumGet(monitorToDisplayOn, "ptr") : monitorToDisplayOn

        result := ComCall(4, this, "ptr", localFilePath, "ptr", monitorToDisplayOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
