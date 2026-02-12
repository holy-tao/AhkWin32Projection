#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is used to notify Trusted Intermediary Agents (TIAs) of the keys for the SA being negotiated.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipseckeymanageraddandregister0">IPsecKeyManagerAddAndRegister</a> to register this function pointer.
 * @see https://learn.microsoft.com/windows/win32/api//content/fwpmu/nc-fwpmu-ipsec_key_manager_notify_key0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEY_MANAGER_NOTIFY_KEY0 extends IUnknown {

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
     * @param {Pointer<IPSEC_SA_DETAILS1>} inboundSa 
     * @param {Pointer<IPSEC_SA_DETAILS1>} outboundSa 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(inboundSa, outboundSa) {
        ComCall(3, this, "ptr", inboundSa, "ptr", outboundSa)
    }
}
