#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_MIRROR_PHYSICAL_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_MIRROR_PHYSICAL_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} PhysicalAddress 
     * @param {Integer} ByteCount 
     * @returns {NTSTATUS} 
     */
    Call(_Context, PhysicalAddress, ByteCount) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, Int64, PhysicalAddress, Int64, ByteCount, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PREPLACE_MIRROR_PHYSICAL_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_MIRROR_PHYSICAL_MEMORY {
        /**
         * Creates a PREPLACE_MIRROR_PHYSICAL_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, Int64) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, Int64, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
