#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EmfPlusRecordType.ahk" { EmfPlusRecordType }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct EnumerateMetafileProc {
    value : IntPtr

    __value {
        set {
            if (value is EnumerateMetafileProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {EmfPlusRecordType} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Void>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param3Marshal := param3 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EmfPlusRecordType, param0, UInt32, param1, UInt32, param2, param3Marshal, param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A EnumerateMetafileProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EnumerateMetafileProc {
        /**
         * Creates a EnumerateMetafileProc pointer that invokes the given AHK function when called.
         * @param {Func(EmfPlusRecordType, UInt32, UInt32, "char*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EmfPlusRecordType, UInt32, UInt32, "char*", "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
