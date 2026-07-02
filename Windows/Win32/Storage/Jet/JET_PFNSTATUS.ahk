#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_SESID.ahk" { JET_SESID }

/**
 * Learn more about: JET_PFNSTATUS delegate
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-pfnstatus-delegate
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_PFNSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is JET_PFNSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} snp 
     * @param {Integer} snt 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(sesid, snp, snt, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, JET_SESID, sesid, UInt32, snp, UInt32, snt, pvMarshal, pv, Int32)
        return result
    }

    /**
     * A JET_PFNSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JET_PFNSTATUS {
        /**
         * Creates a JET_PFNSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(JET_SESID, UInt32, UInt32, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [JET_SESID, UInt32, UInt32, "ptr", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
