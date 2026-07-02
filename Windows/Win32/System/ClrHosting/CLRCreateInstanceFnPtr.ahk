#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct CLRCreateInstanceFnPtr {
    value : IntPtr

    __value {
        set {
            if (value is CLRCreateInstanceFnPtr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppInterface 
     * @returns {HRESULT} 
     */
    Call(clsid, riid, ppInterface) {
        ppInterfaceMarshal := ppInterface is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, clsid, Guid.Ptr, riid, ppInterfaceMarshal, ppInterface, "HRESULT")
        return result
    }

    /**
     * A CLRCreateInstanceFnPtr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CLRCreateInstanceFnPtr {
        /**
         * Creates a CLRCreateInstanceFnPtr pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Guid, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Guid.Ptr, "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
