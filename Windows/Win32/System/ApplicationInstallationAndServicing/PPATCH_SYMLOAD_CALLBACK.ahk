#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PPATCH_SYMLOAD_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PPATCH_SYMLOAD_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} WhichFile 
     * @param {PSTR} SymbolFileName 
     * @param {Integer} SymType 
     * @param {Integer} SymbolFileCheckSum 
     * @param {Integer} SymbolFileTimeDate 
     * @param {Integer} ImageFileCheckSum 
     * @param {Integer} ImageFileTimeDate 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {BOOL} 
     */
    Call(WhichFile, SymbolFileName, SymType, SymbolFileCheckSum, SymbolFileTimeDate, ImageFileCheckSum, ImageFileTimeDate, CallbackContext) {
        SymbolFileName := SymbolFileName is String ? StrPtr(SymbolFileName) : SymbolFileName

        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, WhichFile, "ptr", SymbolFileName, UInt32, SymType, UInt32, SymbolFileCheckSum, UInt32, SymbolFileTimeDate, UInt32, ImageFileCheckSum, UInt32, ImageFileTimeDate, CallbackContextMarshal, CallbackContext, BOOL)
        return result
    }

    /**
     * A PPATCH_SYMLOAD_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPATCH_SYMLOAD_CALLBACK {
        /**
         * Creates a PPATCH_SYMLOAD_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, UInt32, UInt32, UInt32, UInt32, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, UInt32, UInt32, UInt32, UInt32, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
