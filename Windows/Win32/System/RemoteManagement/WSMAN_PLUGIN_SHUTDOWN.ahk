#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the shutdown callback for the plug-in.
 * @remarks
 * Each successful call to <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_startup">WSManPluginStartup</a> will result in a call to this function before the WinRM plug-in DLL is unloaded. It is important to ensure that the WinRM plug-in tracks the number of times that this startup entry point is called so that the plug-in is not shut down prematurely.
 * 
 * This function must ensure that all plug-in threads are shut down before it returns. If the plug-in handles only synchronous operations and all threads report a cancellation result before they return, this function performs only plug-in cleanup. However, for an asynchronous plug-in, any threads that are used to process the plug-in threads, including the ones that just reported the cancellation for all operations, need to be completely shut down. If all of the threads are not shut down, crashes in the DLL might occur because code might be executed after the DLL is unloaded.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_shutdown
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_SHUTDOWN {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_SHUTDOWN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pluginContext Specifies the context that was returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_startup">WSManPluginStartup</a> method. This parameter represents a specific application initialization of a WinRM plug-in. The shutdown entry point will be called for each application that initialized it.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Integer} reason Specifies the reason that the plug-in is shutting down.
     * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code.
     * 
     * <div class="alert"><b>Note</b>  If this method fails, the plug-in will not call back in.</div>
     * <div> </div>
     */
    Call(pluginContext, flags, reason) {
        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pluginContextMarshal, pluginContext, UInt32, flags, UInt32, reason, UInt32)
        return result
    }

    /**
     * A WSMAN_PLUGIN_SHUTDOWN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_SHUTDOWN {
        /**
         * Creates a WSMAN_PLUGIN_SHUTDOWN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
