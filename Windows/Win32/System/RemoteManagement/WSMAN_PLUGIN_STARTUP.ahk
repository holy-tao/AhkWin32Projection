#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines the startup callback for the plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_startup
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_STARTUP {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_STARTUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {PWSTR} applicationIdentification A unique identifier for the hosted application. For the main WinRM service, the default is <b>wsman</b>. For an Internet Information Services (IIS) host, this identifier is related to the application endpoint for that host. For example, <b>wsman/MyCompany/MyApplication</b>.
     * @param {PWSTR} extraInfo A string that contains configuration information, if any information was stored when the plug-in was registered. When the plug-in is registered using the WinRM configuration, the plug-in can add extra configuration parameters that are useful during initialization to an optional node.  This information can be especially useful if a plug-in is used in different IIS hosting scenarios and requires slightly different run-time semantics during initialization.  This string is a copy of the XML from the configuration, if one is present.  Otherwise, this parameter is set to <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} pluginContext The context for the specific application initialization.  This context is passed through to all other WinRM plug-in calls that are associated with this <i>applicationIdentifier</i>.
     * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code.  If this method returns an error, the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_shutdown">WSManPluginShutdown</a> entry point will not be called.
     */
    Call(flags, applicationIdentification, extraInfo, pluginContext) {
        applicationIdentification := applicationIdentification is String ? StrPtr(applicationIdentification) : applicationIdentification
        extraInfo := extraInfo is String ? StrPtr(extraInfo) : extraInfo

        pluginContextMarshal := pluginContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, flags, "ptr", applicationIdentification, "ptr", extraInfo, pluginContextMarshal, pluginContext, UInt32)
        return result
    }

    /**
     * A WSMAN_PLUGIN_STARTUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_STARTUP {
        /**
         * Creates a WSMAN_PLUGIN_STARTUP pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, PWSTR, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, PWSTR, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
