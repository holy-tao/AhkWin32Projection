#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IUpdateCollection.ahk
#Include .\IInstallationProgress.ahk
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
     * @type {VARIANT} 
     */
    AsyncState {
        get => this.get_AsyncState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsCompleted {
        get => this.get_IsCompleted()
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_asyncstate
     */
    get_AsyncState() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_iscompleted
     */
    get_IsCompleted() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
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
     * @returns {IInstallationProgress} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationjob-getprogress
     */
    GetProgress() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationProgress(retval)
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
