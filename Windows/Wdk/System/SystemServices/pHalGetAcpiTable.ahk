#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalGetAcpiTable {
    value : IntPtr

    __value {
        set {
            if (value is pHalGetAcpiTable) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Signature 
     * @param {PSTR} OemId 
     * @param {PSTR} OemTableId 
     * @returns {Pointer<Void>} 
     */
    Call(Signature, OemId, OemTableId) {
        OemId := OemId is String ? StrPtr(OemId) : OemId
        OemTableId := OemTableId is String ? StrPtr(OemTableId) : OemTableId

        result := DllCall(this.value, UInt32, Signature, "ptr", OemId, "ptr", OemTableId, IntPtr)
        return result
    }

    /**
     * A pHalGetAcpiTable that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalGetAcpiTable {
        /**
         * Creates a pHalGetAcpiTable pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, PSTR) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, PSTR, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
