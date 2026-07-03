#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct LPGROUP_CALLBACK_EX {
    value : IntPtr

    __value {
        set {
            if (value is LPGROUP_CALLBACK_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} param0 
     * @param {HGROUP} param1 
     * @param {HGROUP} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, param0, HGROUP, param1, HGROUP, param2, param3Marshal, param3, UInt32)
        return result
    }

    /**
     * A LPGROUP_CALLBACK_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPGROUP_CALLBACK_EX {
        /**
         * Creates a LPGROUP_CALLBACK_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HGROUP, HGROUP, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HGROUP, HGROUP, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
