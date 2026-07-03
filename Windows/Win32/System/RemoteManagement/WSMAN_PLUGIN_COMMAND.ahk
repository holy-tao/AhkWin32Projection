#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_COMMAND_ARG_SET.ahk" { WSMAN_COMMAND_ARG_SET }
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }

/**
 * Defines the command callback for a plug-in.
 * @remarks
 * The WinRM (WinRM) plug-in will call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginreportcontext">WSManPluginReportContext</a> method to register a command context for the command. All operations on this command are passed into this context. The context must be valid until the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method is called by the plug-in to indicate that either the command is complete or the shell was shut down. All parameters passed in are valid until the WinRM plug-in calls <b>WSManPluginOperationComplete</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_command
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_COMMAND {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_COMMAND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<Void>} shellContext Specifies the context returned from creating the shell for which this command needs to be associated.
     * @param {PWSTR} commandLine Specifies the command line to be run.
     * @param {Pointer<WSMAN_COMMAND_ARG_SET>} arguments A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_command_arg_set">WSMAN_COMMAND_ARG_SET</a> structure that specifies  the command-line arguments to be passed to the command.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(requestDetails, flags, shellContext, commandLine, arguments) {
        commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32, flags, shellContextMarshal, shellContext, "ptr", commandLine, WSMAN_COMMAND_ARG_SET.Ptr, arguments)
    }

    /**
     * A WSMAN_PLUGIN_COMMAND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_COMMAND {
        /**
         * Creates a WSMAN_PLUGIN_COMMAND pointer that invokes the given AHK function when called.
         * @param {Func(WSMAN_PLUGIN_REQUEST, UInt32, "ptr", PWSTR, WSMAN_COMMAND_ARG_SET) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSMAN_PLUGIN_REQUEST.Ptr, UInt32, "ptr", PWSTR, WSMAN_COMMAND_ARG_SET.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
