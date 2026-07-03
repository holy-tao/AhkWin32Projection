#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Networking\WinSock\SOCKET_ADDRESS_LIST.ahk" { SOCKET_ADDRESS_LIST }

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_BOOTSTRAP_RESOLVE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is DRT_BOOTSTRAP_RESOLVE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<SOCKET_ADDRESS_LIST>} pAddresses 
     * @param {BOOL} fFatalError 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hr, pvContext, pAddresses, fFatalError) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "int", hr, pvContextMarshal, pvContext, SOCKET_ADDRESS_LIST.Ptr, pAddresses, BOOL, fFatalError)
    }

    /**
     * A DRT_BOOTSTRAP_RESOLVE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRT_BOOTSTRAP_RESOLVE_CALLBACK {
        /**
         * Creates a DRT_BOOTSTRAP_RESOLVE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("int", "ptr", SOCKET_ADDRESS_LIST, BOOL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", "ptr", SOCKET_ADDRESS_LIST.Ptr, BOOL, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
