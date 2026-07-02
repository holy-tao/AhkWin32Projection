#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import "..\StructuredStorage\JET_API_PTR.ahk" { JET_API_PTR }
#Import ".\JET_SESID.ahk" { JET_SESID }

/**
 * Learn more about: JET_CALLBACK Callback Function
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-callback-callback-function
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is JET_CALLBACK) {
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
     * @param {Integer} _dbid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} cbtyp 
     * @param {Pointer<Void>} pvArg1 
     * @param {Pointer<Void>} pvArg2 
     * @param {Pointer<Void>} pvContext 
     * @param {JET_API_PTR} ulUnused 
     * @returns {Integer} 
     */
    Call(sesid, _dbid, tableid, cbtyp, pvArg1, pvArg2, pvContext, ulUnused) {
        pvArg1Marshal := pvArg1 is VarRef ? "ptr" : "ptr"
        pvArg2Marshal := pvArg2 is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, JET_SESID, sesid, UInt32, _dbid, JET_TABLEID, tableid, UInt32, cbtyp, pvArg1Marshal, pvArg1, pvArg2Marshal, pvArg2, pvContextMarshal, pvContext, JET_API_PTR, ulUnused, Int32)
        return result
    }

    /**
     * A JET_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JET_CALLBACK {
        /**
         * Creates a JET_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(JET_SESID, UInt32, JET_TABLEID, UInt32, "ptr", "ptr", "ptr", JET_API_PTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [JET_SESID, UInt32, JET_TABLEID, UInt32, "ptr", "ptr", "ptr", JET_API_PTR, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
