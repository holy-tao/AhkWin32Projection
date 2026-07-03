#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IEREGISTERXMLNSFN {
    value : IntPtr

    __value {
        set {
            if (value is IEREGISTERXMLNSFN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszURI 
     * @param {Guid} clsid 
     * @param {BOOL} fMachine 
     * @returns {HRESULT} 
     */
    Call(lpszURI, clsid, fMachine) {
        lpszURI := lpszURI is String ? StrPtr(lpszURI) : lpszURI

        result := DllCall(this.value, "ptr", lpszURI, Guid, clsid, BOOL, fMachine, "HRESULT")
        return result
    }

    /**
     * A IEREGISTERXMLNSFN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IEREGISTERXMLNSFN {
        /**
         * Creates a IEREGISTERXMLNSFN pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Guid, BOOL) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Guid, BOOL, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
