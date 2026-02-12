#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PAC_CHANGES_CALLBACK_FN callback function is used to add custom behavior to the app container change notification process.
 * @remarks
 * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-networkisolationregisterforappcontainerchanges">NetworkIsolationRegisterForAppContainerChanges</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nc-netfw-pac_changes_callback_fn
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class PAC_CHANGES_CALLBACK_FN extends IUnknown {

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
     * @param {Pointer<Void>} context_ 
     * @param {Pointer<INET_FIREWALL_AC_CHANGE>} pChange 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, pChange) {
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, context_Marshal, context_, "ptr", pChange)
    }
}
