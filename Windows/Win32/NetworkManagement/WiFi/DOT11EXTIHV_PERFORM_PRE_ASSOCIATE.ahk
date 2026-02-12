#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXTIHV_PERFORM_PRE_ASSOCIATE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hIhvExtAdapter 
     * @param {HANDLE} hConnectSession 
     * @param {Pointer<DOT11EXT_IHV_PROFILE_PARAMS>} pIhvProfileParams 
     * @param {Pointer<DOT11EXT_IHV_CONNECTIVITY_PROFILE>} pIhvConnProfile 
     * @param {Pointer<DOT11EXT_IHV_SECURITY_PROFILE>} pIhvSecProfile 
     * @param {Pointer<DOT11_BSS_LIST>} pConnectableBssid 
     * @param {Pointer<Integer>} pdwReasonCode 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hIhvExtAdapter, hConnectSession, pIhvProfileParams, pIhvConnProfile, pIhvSecProfile, pConnectableBssid, pdwReasonCode) {
        hIhvExtAdapter := hIhvExtAdapter is Win32Handle ? NumGet(hIhvExtAdapter, "ptr") : hIhvExtAdapter
        hConnectSession := hConnectSession is Win32Handle ? NumGet(hConnectSession, "ptr") : hConnectSession

        pdwReasonCodeMarshal := pdwReasonCode is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hIhvExtAdapter, "ptr", hConnectSession, "ptr", pIhvProfileParams, "ptr", pIhvConnProfile, "ptr", pIhvSecProfile, "ptr", pConnectableBssid, pdwReasonCodeMarshal, pdwReasonCode, "uint")
        return result
    }
}
