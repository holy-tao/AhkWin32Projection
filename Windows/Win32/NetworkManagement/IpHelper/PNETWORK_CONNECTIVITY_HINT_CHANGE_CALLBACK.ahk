#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined function called whenever there's a change in the network aggregate connectivity level and cost hints.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/netioapi/nc-netioapi-pnetwork_connectivity_hint_change_callback
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} CallerContext 
     * @param {NL_NETWORK_CONNECTIVITY_HINT} ConnectivityHint 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CallerContext, ConnectivityHint) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, CallerContextMarshal, CallerContext, "ptr", ConnectivityHint)
    }
}
