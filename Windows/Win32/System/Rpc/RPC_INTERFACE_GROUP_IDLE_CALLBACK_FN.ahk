#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN is a user-defined callback that can be implemented for each defined interface group. This callback is invoked by the RPC runtime when it detects that the idle state of an interface group has changed.
 * @remarks
 * When a server registers an interface group, it provides a pointer to an idle callback function through which RPC will notify the application when the interface group’s idle state has changed.  The server application can use this callback to attempt to deactivate the interface group when it becomes idle.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupclose">RpcServerInterfaceGroupClose</a> must not be called from this callback or deadlock can occur.
 * 
 * Note that RPC server activity is not always visible to the server application.  In some cases, simply having a client with an open connection to the server may keep it active even if no calls have been dispatched for a long period of time.  Server applications must not rely on any correlation between the RPC runtime declaring that the group is idle and the time since the last call was dispatched.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/nc-rpcdce-rpc_interface_group_idle_callback_fn
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN {
    value : IntPtr

    __value {
        set {
            if (value is RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} IfGroup A <b>RPC_INTERFACE_GROUP</b> from <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinterfacegroupcreate">RpcServerInterfaceGroupCreate</a> that defines the interface group for which the idle state has changed.
     * @param {Pointer<Void>} IdleCallbackContext A user-defined context provided at interface group creation.
     * @param {Integer} IsGroupIdle <b>TRUE</b> if the interface group has just become idle.  <b>FALSE</b> if the interface group was previously idle but has since received new activity.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(IfGroup, IdleCallbackContext, IsGroupIdle) {
        IfGroupMarshal := IfGroup is VarRef ? "ptr" : "ptr"
        IdleCallbackContextMarshal := IdleCallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, IfGroupMarshal, IfGroup, IdleCallbackContextMarshal, IdleCallbackContext, UInt32, IsGroupIdle)
    }

    /**
     * A RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN {
        /**
         * Creates a RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
