#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DSEnumAttributesCallback function is an application-defined callback function that is called once for each attribute enumerated by the IDsDisplaySpecifier::EnumClassAttributes method.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/nc-dsclient-lpdsenumattributes
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct LPDSENUMATTRIBUTES {
    value : IntPtr

    __value {
        set {
            if (value is LPDSENUMATTRIBUTES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} _lParam Contains an application-defined  parameter  passed as the <i>lParam</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-idsdisplayspecifier-enumclassattributes">IDsDisplaySpecifier::EnumClassAttributes</a> method.
     * @param {PWSTR} pszAttributeName Pointer to a null-terminated Unicode string that contains the LDAP name of the attribute.
     * @param {PWSTR} pszDisplayName Pointer to a null-terminated Unicode string that contains the localized name of the attribute.
     * @param {Integer} dwFlags Contains a set of flags that define the behavior or state of the attribute. This can be zero or the following value:
     * @returns {HRESULT} Returns <b>S_OK</b> to continue the enumeration or any failure code, such as <b>E_FAIL</b>, to terminate the enumeration.
     */
    Call(_lParam, pszAttributeName, pszDisplayName, dwFlags) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := DllCall(this.value, LPARAM, _lParam, "ptr", pszAttributeName, "ptr", pszDisplayName, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A LPDSENUMATTRIBUTES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDSENUMATTRIBUTES {
        /**
         * Creates a LPDSENUMATTRIBUTES pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, PWSTR, PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, PWSTR, PWSTR, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
