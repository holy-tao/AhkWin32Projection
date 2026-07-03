#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalFindBusAddressTranslation {
    value : IntPtr

    __value {
        set {
            if (value is pHalFindBusAddressTranslation) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} BusAddress 
     * @param {Pointer<Integer>} AddressSpace 
     * @param {Pointer<Integer>} TranslatedAddress 
     * @param {Pointer<Pointer>} _Context 
     * @param {BOOLEAN} NextBus 
     * @returns {BOOLEAN} 
     */
    Call(BusAddress, AddressSpace, TranslatedAddress, _Context, NextBus) {
        AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
        TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Int64, BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, _ContextMarshal, _Context, BOOLEAN, NextBus, BOOLEAN)
        return result
    }

    /**
     * A pHalFindBusAddressTranslation that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalFindBusAddressTranslation {
        /**
         * Creates a pHalFindBusAddressTranslation pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "uint*", "int64*", "ptr*", BOOLEAN) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "uint*", "int64*", "ptr*", BOOLEAN, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
