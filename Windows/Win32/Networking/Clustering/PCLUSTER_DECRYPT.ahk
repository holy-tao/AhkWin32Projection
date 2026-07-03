#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSCRYPTPROVIDER.ahk" { HCLUSCRYPTPROVIDER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_DECRYPT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_DECRYPT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSCRYPTPROVIDER} _hClusCryptProvider 
     * @param {Pointer<Integer>} pCryptInput 
     * @param {Integer} cbCryptInput 
     * @param {Pointer<Pointer<Integer>>} ppCryptOutput 
     * @param {Pointer<Integer>} pcbCryptOutput 
     * @returns {Integer} 
     */
    Call(_hClusCryptProvider, pCryptInput, cbCryptInput, ppCryptOutput, pcbCryptOutput) {
        pCryptInputMarshal := pCryptInput is VarRef ? "char*" : "ptr"
        ppCryptOutputMarshal := ppCryptOutput is VarRef ? "ptr*" : "ptr"
        pcbCryptOutputMarshal := pcbCryptOutput is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSCRYPTPROVIDER, _hClusCryptProvider, pCryptInputMarshal, pCryptInput, UInt32, cbCryptInput, ppCryptOutputMarshal, ppCryptOutput, pcbCryptOutputMarshal, pcbCryptOutput, UInt32)
        return result
    }

    /**
     * A PCLUSTER_DECRYPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_DECRYPT {
        /**
         * Creates a PCLUSTER_DECRYPT pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSCRYPTPROVIDER, "char*", UInt32, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSCRYPTPROVIDER, "char*", UInt32, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
