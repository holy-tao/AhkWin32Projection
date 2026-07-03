#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWebApplicationAuthoringMode.ahk" { IWebApplicationAuthoringMode }
#Import ".\IWebApplicationHost.ahk" { IWebApplicationHost }

/**
 * Defines a pointer to an application-defined function in a dynamic-link library (DLL) that will be used as the authoring binary. When the app host starts in authoring mode, this function is called to initialize the authoring binary.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nc-webapplication-registerauthoringclientfunctiontype
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct RegisterAuthoringClientFunctionType {
    value : IntPtr

    __value {
        set {
            if (value is RegisterAuthoringClientFunctionType) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IWebApplicationAuthoringMode} authoringModeObject Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/webapplication/nn-webapplication-iwebapplicationauthoringmode">IWebApplicationAuthoringMode</a>*</b>
     * 
     * An object that provides a path to the authoring binary.
     * @param {IWebApplicationHost} host Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/webapplication/nn-webapplication-iwebapplicationhost">IWebApplicationHost</a>*</b>
     * 
     * The WWAHost.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(authoringModeObject, host) {
        result := DllCall(this.value, "ptr", authoringModeObject, "ptr", host, "HRESULT")
        return result
    }

    /**
     * A RegisterAuthoringClientFunctionType that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RegisterAuthoringClientFunctionType {
        /**
         * Creates a RegisterAuthoringClientFunctionType pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
