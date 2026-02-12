#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Indicates whether the Trusted Intermediary Agent (TIA) will dictate the keys for the SA being negotiated.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipseckeymanageraddandregister0">IPsecKeyManagerAddAndRegister</a> to register this function pointer.
 * 
 * If the TIA wants to dictate the keys, and its weight is higher than that of any peers, IPsec will subsequently call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_dictate_key0">IPSEC_KEY_MANAGER_DICTATE_KEY0</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/fwpmu/nc-fwpmu-ipsec_key_manager_key_dictation_check0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0 extends IUnknown {

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
     * @param {Pointer<IKEEXT_TRAFFIC0>} ikeTraffic 
     * @param {Pointer<BOOL>} willDictateKey 
     * @param {Pointer<Integer>} weight 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ikeTraffic, willDictateKey, weight) {
        willDictateKeyMarshal := willDictateKey is VarRef ? "int*" : "ptr"
        weightMarshal := weight is VarRef ? "uint*" : "ptr"

        ComCall(3, this, "ptr", ikeTraffic, willDictateKeyMarshal, willDictateKey, weightMarshal, weight)
    }
}
