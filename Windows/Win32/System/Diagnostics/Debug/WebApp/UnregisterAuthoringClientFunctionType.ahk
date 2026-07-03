#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWebApplicationHost.ahk" { IWebApplicationHost }

/**
 * Unregisters the application-defined function that was registered with the RegisterAuthoringClientFunctionType function. This function is called when the app host terminates.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nc-webapplication-unregisterauthoringclientfunctiontype
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct UnregisterAuthoringClientFunctionType {
    value : IntPtr

    __value {
        set {
            if (value is UnregisterAuthoringClientFunctionType) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IWebApplicationHost} host Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/webapplication/nn-webapplication-iwebapplicationhost">IWebApplicationHost</a>*</b>
     * 
     * An object that provides a path to the authoring binary.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The WWAHost.
     */
    Call(host) {
        result := DllCall(this.value, "ptr", host, "HRESULT")
        return result
    }

    /**
     * A UnregisterAuthoringClientFunctionType that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UnregisterAuthoringClientFunctionType {
        /**
         * Creates a UnregisterAuthoringClientFunctionType pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
