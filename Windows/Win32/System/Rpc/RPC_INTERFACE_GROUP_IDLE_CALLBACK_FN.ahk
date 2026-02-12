#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN is a user-defined callback that can be implemented for each defined interface group. This callback is invoked by the RPC runtime when it detects that the idle state of an interface group has changed.
 * @remarks
 * When a server registers an interface group, it provides a pointer to an idle callback function through which RPC will notify the application when the interface group’s idle state has changed.  The server application can use this callback to attempt to deactivate the interface group when it becomes idle.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupclose">RpcServerInterfaceGroupClose</a> must not be called from this callback or deadlock can occur.
 * 
 * Note that RPC server activity is not always visible to the server application.  In some cases, simply having a client with an open connection to the server may keep it active even if no calls have been dispatched for a long period of time.  Server applications must not rely on any correlation between the RPC runtime declaring that the group is idle and the time since the last call was dispatched.
 * @see https://learn.microsoft.com/windows/win32/api//content/rpcdce/nc-rpcdce-rpc_interface_group_idle_callback_fn
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN extends IUnknown {

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
     * @param {Pointer<Void>} IfGroup 
     * @param {Pointer<Void>} IdleCallbackContext 
     * @param {Integer} IsGroupIdle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(IfGroup, IdleCallbackContext, IsGroupIdle) {
        IfGroupMarshal := IfGroup is VarRef ? "ptr" : "ptr"
        IdleCallbackContextMarshal := IdleCallbackContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, IfGroupMarshal, IfGroup, IdleCallbackContextMarshal, IdleCallbackContext, "uint", IsGroupIdle)
    }
}
