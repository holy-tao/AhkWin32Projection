#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes properties that the Remote Desktop Connection Broker uses to set a plugin’s queue.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtaskinfo
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTaskInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbTaskInfo
     * @type {Guid}
     */
    static IID => Guid("{523d1083-89be-48dd-99ea-04e82ffa7265}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetId", "get_StartTime", "get_EndTime", "get_Deadline", "get_Identifier", "get_Label", "get_Context", "get_Plugin", "get_Status"]

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_targetid
     */
    get_TargetId(pName) {
        result := ComCall(3, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pStartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_starttime
     */
    get_StartTime(pStartTime) {
        result := ComCall(4, this, "ptr", pStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pEndTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_endtime
     */
    get_EndTime(pEndTime) {
        result := ComCall(5, this, "ptr", pEndTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pDeadline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_deadline
     */
    get_Deadline(pDeadline) {
        result := ComCall(6, this, "ptr", pDeadline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_identifier
     */
    get_Identifier(pIdentifier) {
        result := ComCall(7, this, "ptr", pIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_label
     */
    get_Label(pLabel) {
        result := ComCall(8, this, "ptr", pLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_context
     */
    get_Context(pContext) {
        pContextMarshal := pContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_plugin
     */
    get_Plugin(pPlugin) {
        result := ComCall(10, this, "ptr", pPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_status
     */
    get_Status(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }
}
