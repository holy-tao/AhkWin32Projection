#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IEISXMLNSREGISTEREDFN {
    value : IntPtr

    __value {
        set {
            if (value is IEISXMLNSREGISTEREDFN) {
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
     * @param {Pointer<Guid>} pCLSID 
     * @returns {HRESULT} 
     */
    Call(lpszURI, pCLSID) {
        lpszURI := lpszURI is String ? StrPtr(lpszURI) : lpszURI

        result := DllCall(this.value, "ptr", lpszURI, Guid.Ptr, pCLSID, "HRESULT")
        return result
    }

    /**
     * A IEISXMLNSREGISTEREDFN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IEISXMLNSREGISTEREDFN {
        /**
         * Creates a IEISXMLNSREGISTEREDFN pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
