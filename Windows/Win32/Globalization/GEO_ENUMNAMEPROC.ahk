#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * An application-defined callback function that processes enumerated geographical location information provided by the EnumSystemGeoNames function.
 * @remarks
 * An <i>Geo_EnumNameProc</i> function can carry out any desired task, and can use the information passed to it in the <i>data</i> parameter for any desired purpose. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumsystemgeonames">EnumSystemGeoNames</a> function.
 * 
 * For information about two-letter ISO 3166-1 codes, see <a href="https://www.iso.org/iso-3166-country-codes.html">Country Codes - ISO 3166</a>.  For information about numeric UN M.49 codes, see <a href="https://unstats.un.org/unsd/methodology/m49/">Standard country or area codes for statistical use (M49)</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/nc-winnls-geo_enumnameproc
 * @namespace Windows.Win32.Globalization
 */
export default struct GEO_ENUMNAMEPROC {
    value : IntPtr

    __value {
        set {
            if (value is GEO_ENUMNAMEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {LPARAM} param1 
     * @returns {BOOL} Returns <b>TRUE</b> to continue enumeration or <b>FALSE</b> otherwise.
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A GEO_ENUMNAMEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GEO_ENUMNAMEPROC {
        /**
         * Creates a GEO_ENUMNAMEPROC pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
