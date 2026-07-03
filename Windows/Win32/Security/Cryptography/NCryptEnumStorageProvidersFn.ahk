#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCryptProviderName.ahk" { NCryptProviderName }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptEnumStorageProvidersFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptEnumStorageProvidersFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwProviderCount 
     * @param {Pointer<Pointer<NCryptProviderName>>} ppProviderList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(pdwProviderCount, ppProviderList, dwFlags) {
        pdwProviderCountMarshal := pdwProviderCount is VarRef ? "uint*" : "ptr"
        ppProviderListMarshal := ppProviderList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, pdwProviderCountMarshal, pdwProviderCount, ppProviderListMarshal, ppProviderList, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptEnumStorageProvidersFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptEnumStorageProvidersFn {
        /**
         * Creates a NCryptEnumStorageProvidersFn pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "ptr*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "ptr*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
