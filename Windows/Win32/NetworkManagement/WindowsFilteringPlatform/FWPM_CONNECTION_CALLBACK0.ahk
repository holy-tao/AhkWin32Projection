#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is used to add custom behavior to the connection object subscription process.
 * @remarks
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectionsubscribe0">FwpmConnectionSubscribe0</a> to register this callback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/fwpmu/nc-fwpmu-fwpm_connection_callback0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CONNECTION_CALLBACK0 extends IUnknown {

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
     * @param {Integer} eventType 
     * @param {Pointer<FWPM_CONNECTION0>} connection_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, eventType, connection_) {
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, context_Marshal, context_, "int", eventType, "ptr", connection_)
    }
}
