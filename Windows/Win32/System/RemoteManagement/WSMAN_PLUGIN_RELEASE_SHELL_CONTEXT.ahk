#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the release shell callback for the plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_release_shell_context
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_RELEASE_SHELL_CONTEXT {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_RELEASE_SHELL_CONTEXT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} shellContext Specifies the context that was received when the shell was created.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(shellContext) {
        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, shellContextMarshal, shellContext)
    }

    /**
     * A WSMAN_PLUGIN_RELEASE_SHELL_CONTEXT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_RELEASE_SHELL_CONTEXT {
        /**
         * Creates a WSMAN_PLUGIN_RELEASE_SHELL_CONTEXT pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
