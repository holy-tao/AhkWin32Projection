#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHALIOREADWRITEHANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PHALIOREADWRITEHANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOLEAN} fRead 
     * @param {Integer} dwAddr 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pdwData 
     * @returns {NTSTATUS} 
     */
    Call(fRead, dwAddr, dwSize, pdwData) {
        pdwDataMarshal := pdwData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BOOLEAN, fRead, UInt32, dwAddr, UInt32, dwSize, pdwDataMarshal, pdwData, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PHALIOREADWRITEHANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHALIOREADWRITEHANDLER {
        /**
         * Creates a PHALIOREADWRITEHANDLER pointer that invokes the given AHK function when called.
         * @param {Func(BOOLEAN, UInt32, UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN, UInt32, UInt32, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
