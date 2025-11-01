#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStatusMessage interface contains property methods that retrieve various properties of status messages related to GPO operations.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmstatusmessage
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStatusMessage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMStatusMessage
     * @type {Guid}
     */
    static IID => Guid("{8496c22f-f3de-4a1f-8f58-603caaa93d7b}")

    /**
     * The class identifier for GPMStatusMessage
     * @type {Guid}
     */
    static CLSID => Guid("{4b77cc94-d255-409b-bc62-370881715a19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ObjectPath", "ErrorCode", "get_ExtensionName", "get_SettingsName", "OperationCode", "get_Message"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ObjectPath(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmessage-errorcode
     */
    ErrorCode() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ExtensionName(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_SettingsName(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmessage-operationcode
     */
    OperationCode() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Message(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }
}
