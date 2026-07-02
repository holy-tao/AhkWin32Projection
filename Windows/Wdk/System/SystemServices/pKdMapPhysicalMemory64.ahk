#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdMapPhysicalMemory64 {
    value : IntPtr

    __value {
        set {
            if (value is pKdMapPhysicalMemory64) {
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
     * @param {Integer} NumberPages 
     * @param {BOOLEAN} FlushCurrentTLB 
     * @returns {Pointer<Void>} 
     */
    Call(PhysicalAddress, NumberPages, FlushCurrentTLB) {
        result := DllCall(this.value, Int64, PhysicalAddress, UInt32, NumberPages, BOOLEAN, FlushCurrentTLB, IntPtr)
        return result
    }

    /**
     * A pKdMapPhysicalMemory64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdMapPhysicalMemory64 {
        /**
         * Creates a pKdMapPhysicalMemory64 pointer that invokes the given AHK function when called.
         * @param {Func(Int64, UInt32, BOOLEAN) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, UInt32, BOOLEAN, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
