#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TRANSLATE_BUS_ADDRESS {
    value : IntPtr

    __value {
        set {
            if (value is TRANSLATE_BUS_ADDRESS) {
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
     * @param {Integer} BusAddress 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} AddressSpace 
     * @param {Pointer<Integer>} TranslatedAddress 
     * @returns {BOOLEAN} 
     */
    Call(_Context, BusAddress, Length, AddressSpace, TranslatedAddress) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
        TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, Int64, BusAddress, UInt32, Length, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, BOOLEAN)
        return result
    }

    /**
     * A TRANSLATE_BUS_ADDRESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TRANSLATE_BUS_ADDRESS {
        /**
         * Creates a TRANSLATE_BUS_ADDRESS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, UInt32, "uint*", "int64*") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, UInt32, "uint*", "int64*", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
