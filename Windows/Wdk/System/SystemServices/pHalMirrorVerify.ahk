#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalMirrorVerify {
    value : IntPtr

    __value {
        set {
            if (value is pHalMirrorVerify) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @param {Integer} NumberOfBytes 
     * @returns {NTSTATUS} 
     */
    Call(PhysicalAddress, NumberOfBytes) {
        result := DllCall(this.value, Int64, PhysicalAddress, Int64, NumberOfBytes, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A pHalMirrorVerify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalMirrorVerify {
        /**
         * Creates a pHalMirrorVerify pointer that invokes the given AHK function when called.
         * @param {Func(Int64, Int64) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, Int64, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
