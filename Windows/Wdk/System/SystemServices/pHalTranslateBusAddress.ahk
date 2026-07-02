#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalTranslateBusAddress {
    value : IntPtr

    __value {
        set {
            if (value is pHalTranslateBusAddress) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {INTERFACE_TYPE} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} BusAddress 
     * @param {Pointer<Integer>} AddressSpace 
     * @param {Pointer<Integer>} TranslatedAddress 
     * @returns {BOOLEAN} 
     */
    Call(InterfaceType, BusNumber, BusAddress, AddressSpace, TranslatedAddress) {
        AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
        TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, INTERFACE_TYPE, InterfaceType, UInt32, BusNumber, Int64, BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, BOOLEAN)
        return result
    }

    /**
     * A pHalTranslateBusAddress that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalTranslateBusAddress {
        /**
         * Creates a pHalTranslateBusAddress pointer that invokes the given AHK function when called.
         * @param {Func(INTERFACE_TYPE, UInt32, Int64, "uint*", "int64*") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [INTERFACE_TYPE, UInt32, Int64, "uint*", "int64*", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
