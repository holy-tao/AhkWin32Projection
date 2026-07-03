#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\NL_NETWORK_CONNECTIVITY_HINT.ahk" { NL_NETWORK_CONNECTIVITY_HINT }

/**
 * An application-defined function called whenever there's a change in the network aggregate connectivity level and cost hints.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/nc-netioapi-pnetwork_connectivity_hint_change_callback
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallerContext The user-specific caller context.
     * @param {NL_NETWORK_CONNECTIVITY_HINT} ConnectivityHint A value of type [NL_NETWORK_CONNECTIVITY_HINT](../nldef/ns-nldef-nl_network_connectivity_hint.md) representing the aggregate connectivity level and cost hints.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerContext, ConnectivityHint) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallerContextMarshal, CallerContext, NL_NETWORK_CONNECTIVITY_HINT, ConnectivityHint)
    }

    /**
     * A PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK {
        /**
         * Creates a PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", NL_NETWORK_CONNECTIVITY_HINT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", NL_NETWORK_CONNECTIVITY_HINT, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
