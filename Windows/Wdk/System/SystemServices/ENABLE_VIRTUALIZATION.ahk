#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ENABLE_VIRTUALIZATION {
    value : IntPtr

    __value {
        set {
            if (value is ENABLE_VIRTUALIZATION) {
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
     * @param {Integer} NumVFs 
     * @param {BOOLEAN} EnableVfMigration 
     * @param {BOOLEAN} EnableMigrationInterrupt 
     * @param {BOOLEAN} EnableVirtualization 
     * @returns {NTSTATUS} 
     */
    Call(_Context, NumVFs, EnableVfMigration, EnableMigrationInterrupt, EnableVirtualization) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt16, NumVFs, BOOLEAN, EnableVfMigration, BOOLEAN, EnableMigrationInterrupt, BOOLEAN, EnableVirtualization, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A ENABLE_VIRTUALIZATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENABLE_VIRTUALIZATION {
        /**
         * Creates a ENABLE_VIRTUALIZATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt16, BOOLEAN, BOOLEAN, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt16, BOOLEAN, BOOLEAN, BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
