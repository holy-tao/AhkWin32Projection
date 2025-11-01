#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains properties and methods that are available to an installation or uninstallation operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationjob
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationJob extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationJob
     * @type {Guid}
     */
    static IID => Guid("{5c209f0b-bad5-432a-9556-4699bed2638a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AsyncState", "get_IsCompleted", "get_Updates", "CleanUp", "GetProgress", "RequestAbort"]

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate
     */
    get_AsyncState(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_iscompleted
     */
    get_IsCompleted(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_updates
     */
    get_Updates(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-cleanup
     */
    CleanUp() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationProgress>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-getprogress
     */
    GetProgress(retval) {
        result := ComCall(11, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-requestabort
     */
    RequestAbort() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
