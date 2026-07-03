#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCryptAlgorithmName.ahk" { NCryptAlgorithmName }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptEnumAlgorithmsFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptEnumAlgorithmsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} _hProvider 
     * @param {Integer} dwAlgClass 
     * @param {Pointer<Integer>} pdwAlgCount 
     * @param {Pointer<Pointer<NCryptAlgorithmName>>} ppAlgList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(_hProvider, dwAlgClass, pdwAlgCount, ppAlgList, dwFlags) {
        pdwAlgCountMarshal := pdwAlgCount is VarRef ? "uint*" : "ptr"
        ppAlgListMarshal := ppAlgList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, UInt32, dwAlgClass, pdwAlgCountMarshal, pdwAlgCount, ppAlgListMarshal, ppAlgList, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptEnumAlgorithmsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptEnumAlgorithmsFn {
        /**
         * Creates a NCryptEnumAlgorithmsFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, "uint*", "ptr*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, "uint*", "ptr*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
