#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_SHELL_STARTUP_INFO_V11.ahk" { WSMAN_SHELL_STARTUP_INFO_V11 }
#Import ".\WSMAN_DATA.ahk" { WSMAN_DATA }
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }

/**
 * Defines the shell callback for a plug-in.
 * @remarks
 * The WinRM (WinRM) plug-in calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginreportcontext">WSManPluginReportContext</a> to register a shell context for the shell. All operations on this shell pass into this context. If the shell has shut down or the plug-in checks the  <i>requestDetails</i> parameter and reports that the operation was  canceled, the plug-in should call <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a>.  All parameters passed in are valid until the WinRM plug-in calls <b>WSManPluginOperationComplete</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_shell
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_SHELL {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_SHELL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pluginContext Specifies the context that was returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_startup">WSManPluginStartup</a> method. This parameter represents a specific application initialization of a WinRM plug-in.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<WSMAN_SHELL_STARTUP_INFO_V11>} startupInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure that contains startup information for the shell.
     * @param {Pointer<WSMAN_DATA>} inboundShellInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that specifies an optional inbound object that contains extra data for the shell.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pluginContext, requestDetails, flags, startupInfo, inboundShellInformation) {
        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pluginContextMarshal, pluginContext, WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32, flags, WSMAN_SHELL_STARTUP_INFO_V11.Ptr, startupInfo, WSMAN_DATA.Ptr, inboundShellInformation)
    }

    /**
     * A WSMAN_PLUGIN_SHELL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_SHELL {
        /**
         * Creates a WSMAN_PLUGIN_SHELL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WSMAN_PLUGIN_REQUEST, UInt32, WSMAN_SHELL_STARTUP_INFO_V11, WSMAN_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WSMAN_PLUGIN_REQUEST.Ptr, UInt32, WSMAN_SHELL_STARTUP_INFO_V11.Ptr, WSMAN_DATA.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
