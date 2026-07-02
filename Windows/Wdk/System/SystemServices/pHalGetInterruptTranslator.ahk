#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import ".\TRANSLATOR_INTERFACE.ahk" { TRANSLATOR_INTERFACE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalGetInterruptTranslator {
    value : IntPtr

    __value {
        set {
            if (value is pHalGetInterruptTranslator) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {INTERFACE_TYPE} ParentInterfaceType 
     * @param {Integer} ParentBusNumber 
     * @param {INTERFACE_TYPE} BridgeInterfaceType 
     * @param {Integer} _Size 
     * @param {Integer} _Version 
     * @param {Pointer<TRANSLATOR_INTERFACE>} Translator 
     * @param {Pointer<Integer>} BridgeBusNumber 
     * @returns {NTSTATUS} 
     */
    Call(ParentInterfaceType, ParentBusNumber, BridgeInterfaceType, _Size, _Version, Translator, BridgeBusNumber) {
        BridgeBusNumberMarshal := BridgeBusNumber is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, INTERFACE_TYPE, ParentInterfaceType, UInt32, ParentBusNumber, INTERFACE_TYPE, BridgeInterfaceType, UInt16, _Size, UInt16, _Version, TRANSLATOR_INTERFACE.Ptr, Translator, BridgeBusNumberMarshal, BridgeBusNumber, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A pHalGetInterruptTranslator that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalGetInterruptTranslator {
        /**
         * Creates a pHalGetInterruptTranslator pointer that invokes the given AHK function when called.
         * @param {Func(INTERFACE_TYPE, UInt32, INTERFACE_TYPE, UInt16, UInt16, TRANSLATOR_INTERFACE, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [INTERFACE_TYPE, UInt32, INTERFACE_TYPE, UInt16, UInt16, TRANSLATOR_INTERFACE.Ptr, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
