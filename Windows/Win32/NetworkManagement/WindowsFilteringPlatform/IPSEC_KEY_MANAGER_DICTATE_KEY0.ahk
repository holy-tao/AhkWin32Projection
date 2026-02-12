#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the Trusted Intermediary Agent (TIA) to dictate keys for the SA being negotiated.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipseckeymanageraddandregister0">IPsecKeyManagerAddAndRegister0</a> to invoke this function pointer. If the weight specified in <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_key_dictation_check0">IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0</a> for a TIA is higher than that of any peer, <b>IPSEC_KEY_MANAGER_DICTATE_KEY0</b> will be invoked.
 * @see https://learn.microsoft.com/windows/win32/api//content/fwpmu/nc-fwpmu-ipsec_key_manager_dictate_key0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEY_MANAGER_DICTATE_KEY0 extends IUnknown {

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
     * @param {Pointer<IPSEC_SA_DETAILS1>} inboundSaDetails 
     * @param {Pointer<IPSEC_SA_DETAILS1>} outboundSaDetails 
     * @param {Pointer<BOOL>} keyingModuleGenKey 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(inboundSaDetails, outboundSaDetails, keyingModuleGenKey) {
        keyingModuleGenKeyMarshal := keyingModuleGenKey is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", inboundSaDetails, "ptr", outboundSaDetails, keyingModuleGenKeyMarshal, keyingModuleGenKey, "uint")
        return result
    }
}
