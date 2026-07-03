#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the release command callback for the plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_release_command_context
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_RELEASE_COMMAND_CONTEXT {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_RELEASE_COMMAND_CONTEXT) {
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
     * @param {Pointer<Void>} commandContext If this request is aimed at a command and not a shell, this is the context returned from the <b>winrm create</b> operation;  otherwise, this parameter is <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(shellContext, commandContext) {
        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, shellContextMarshal, shellContext, commandContextMarshal, commandContext)
    }

    /**
     * A WSMAN_PLUGIN_RELEASE_COMMAND_CONTEXT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_RELEASE_COMMAND_CONTEXT {
        /**
         * Creates a WSMAN_PLUGIN_RELEASE_COMMAND_CONTEXT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
