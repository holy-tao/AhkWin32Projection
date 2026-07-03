#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_ISAPPAPPROVEDBYPOLICY_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_ISAPPAPPROVEDBYPOLICY_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} PackageFamilyName 
     * @param {Integer} PackageVersion 
     * @returns {HRESULT} 
     */
    Call(PackageFamilyName, PackageVersion) {
        PackageFamilyName := PackageFamilyName is String ? StrPtr(PackageFamilyName) : PackageFamilyName

        result := DllCall(this.value, "ptr", PackageFamilyName, Int64, PackageVersion, "HRESULT")
        return result
    }

    /**
     * A PWLDP_ISAPPAPPROVEDBYPOLICY_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_ISAPPAPPROVEDBYPOLICY_API {
        /**
         * Creates a PWLDP_ISAPPAPPROVEDBYPOLICY_API pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Int64) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Int64, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
