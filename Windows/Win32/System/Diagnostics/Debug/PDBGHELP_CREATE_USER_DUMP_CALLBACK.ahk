#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PDBGHELP_CREATE_USER_DUMP_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDBGHELP_CREATE_USER_DUMP_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} DataType 
     * @param {Pointer<Pointer<Void>>} Data 
     * @param {Pointer<Integer>} DataLength 
     * @param {Pointer<Void>} _UserData 
     * @returns {BOOL} 
     */
    Call(DataType, Data, DataLength, _UserData) {
        DataMarshal := Data is VarRef ? "ptr*" : "ptr"
        DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"
        _UserDataMarshal := _UserData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, DataType, DataMarshal, Data, DataLengthMarshal, DataLength, _UserDataMarshal, _UserData, BOOL)
        return result
    }

    /**
     * A PDBGHELP_CREATE_USER_DUMP_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDBGHELP_CREATE_USER_DUMP_CALLBACK {
        /**
         * Creates a PDBGHELP_CREATE_USER_DUMP_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*", "uint*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", "uint*", "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
