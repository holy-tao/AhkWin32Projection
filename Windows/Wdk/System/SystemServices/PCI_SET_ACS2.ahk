#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SET_ACS2 {
    value : IntPtr

    __value {
        set {
            if (value is PCI_SET_ACS2) {
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
     * @param {Integer} ScenariosToModify 
     * @param {Integer} ScenarioState 
     * @returns {NTSTATUS} 
     */
    Call(_Context, ScenariosToModify, ScenarioState) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, ScenariosToModify, UInt32, ScenarioState, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PCI_SET_ACS2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_SET_ACS2 {
        /**
         * Creates a PCI_SET_ACS2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
