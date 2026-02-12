#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the supplicant that there is a change in the Statement of Health (SoH) and re-authentication of a Network Access Protection (NAP) system connection is required.
 * @remarks
 * A pointer to this callback function must be provided when calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>. The callback may be called by EAPHost at any time prior to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerclearconnection">EapHostPeerClearConnection</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/eappapis/nc-eappapis-notificationhandler
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class NotificationHandler extends IUnknown {

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
     * @param {Guid} connectionId 
     * @param {Pointer<Void>} pContextData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(connectionId, pContextData) {
        pContextDataMarshal := pContextData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", connectionId, pContextDataMarshal, pContextData)
    }
}
