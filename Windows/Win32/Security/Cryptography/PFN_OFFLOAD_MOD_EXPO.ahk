#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_OFFLOAD_MOD_EXPO {
    value : IntPtr

    __value {
        set {
            if (value is PFN_OFFLOAD_MOD_EXPO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBase 
     * @param {Pointer<Integer>} pbExponent 
     * @param {Integer} cbExponent 
     * @param {Pointer<Integer>} pbModulus 
     * @param {Integer} cbModulus 
     * @param {Pointer<Integer>} pbResult 
     * @param {Pointer<Void>} pvOffloadPrivateKey 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    Call(pbBase, pbExponent, cbExponent, pbModulus, cbModulus, pbResult, pvOffloadPrivateKey, dwFlags) {
        pbBaseMarshal := pbBase is VarRef ? "char*" : "ptr"
        pbExponentMarshal := pbExponent is VarRef ? "char*" : "ptr"
        pbModulusMarshal := pbModulus is VarRef ? "char*" : "ptr"
        pbResultMarshal := pbResult is VarRef ? "char*" : "ptr"
        pvOffloadPrivateKeyMarshal := pvOffloadPrivateKey is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pbBaseMarshal, pbBase, pbExponentMarshal, pbExponent, UInt32, cbExponent, pbModulusMarshal, pbModulus, UInt32, cbModulus, pbResultMarshal, pbResult, pvOffloadPrivateKeyMarshal, pvOffloadPrivateKey, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A PFN_OFFLOAD_MOD_EXPO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_OFFLOAD_MOD_EXPO {
        /**
         * Creates a PFN_OFFLOAD_MOD_EXPO pointer that invokes the given AHK function when called.
         * @param {Func("char*", "char*", UInt32, "char*", UInt32, "char*", "ptr", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", "char*", UInt32, "char*", UInt32, "char*", "ptr", UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
