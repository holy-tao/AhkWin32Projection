#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_EXPORT_PRIV_KEY_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_EXPORT_PRIV_KEY_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hCryptProv 
     * @param {Integer} dwKeySpec 
     * @param {PSTR} pszPrivateKeyObjId 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvAuxInfo 
     * @param {Integer} pPrivateKeyInfo 
     * @param {Pointer<Integer>} pcbPrivateKeyInfo 
     * @returns {BOOL} 
     */
    Call(hCryptProv, dwKeySpec, pszPrivateKeyObjId, dwFlags, pvAuxInfo, pPrivateKeyInfo, pcbPrivateKeyInfo) {
        pszPrivateKeyObjId := pszPrivateKeyObjId is String ? StrPtr(pszPrivateKeyObjId) : pszPrivateKeyObjId

        pvAuxInfoMarshal := pvAuxInfo is VarRef ? "ptr" : "ptr"
        pcbPrivateKeyInfoMarshal := pcbPrivateKeyInfo is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, hCryptProv, UInt32, dwKeySpec, "ptr", pszPrivateKeyObjId, UInt32, dwFlags, pvAuxInfoMarshal, pvAuxInfo, IntPtr, pPrivateKeyInfo, pcbPrivateKeyInfoMarshal, pcbPrivateKeyInfo, BOOL)
        return result
    }

    /**
     * A PFN_EXPORT_PRIV_KEY_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_EXPORT_PRIV_KEY_FUNC {
        /**
         * Creates a PFN_EXPORT_PRIV_KEY_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, PSTR, UInt32, "ptr", IntPtr, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, PSTR, UInt32, "ptr", IntPtr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
