#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSCRYPTPROVIDER.ahk" { HCLUSCRYPTPROVIDER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_ENCRYPT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_ENCRYPT) {
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
     * @param {Pointer<Integer>} pData 
     * @param {Integer} cbData 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {Integer} 
     */
    Call(_hClusCryptProvider, pData, cbData, ppData, pcbData) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSCRYPTPROVIDER, _hClusCryptProvider, pDataMarshal, pData, UInt32, cbData, ppDataMarshal, ppData, pcbDataMarshal, pcbData, UInt32)
        return result
    }

    /**
     * A PCLUSTER_ENCRYPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_ENCRYPT {
        /**
         * Creates a PCLUSTER_ENCRYPT pointer that invokes the given AHK function when called.
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
