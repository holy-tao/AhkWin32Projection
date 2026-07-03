#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WLDP_DEVICE_SECURITY_INFORMATION.ahk" { WLDP_DEVICE_SECURITY_INFORMATION }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYDEVICESECURITYINFORMATION_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYDEVICESECURITYINFORMATION_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WLDP_DEVICE_SECURITY_INFORMATION>} information 
     * @param {Integer} informationLength 
     * @returns {Integer} 
     */
    Call(information, informationLength) {
        result := DllCall(this.value, WLDP_DEVICE_SECURITY_INFORMATION.Ptr, information, UInt32, informationLength, "uint*", &returnLength := 0, "HRESULT")
        return returnLength
    }

    /**
     * A PWLDP_QUERYDEVICESECURITYINFORMATION_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYDEVICESECURITYINFORMATION_API {
        /**
         * Creates a PWLDP_QUERYDEVICESECURITYINFORMATION_API pointer that invokes the given AHK function when called.
         * @param {Func(WLDP_DEVICE_SECURITY_INFORMATION, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WLDP_DEVICE_SECURITY_INFORMATION.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
