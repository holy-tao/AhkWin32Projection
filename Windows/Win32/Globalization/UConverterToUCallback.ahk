#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UConverterCallbackReason.ahk" { UConverterCallbackReason }
#Import "..\Foundation\PSTR.ahk" { PSTR }
#Import ".\UConverterToUnicodeArgs.ahk" { UConverterToUnicodeArgs }
#Import ".\UErrorCode.ahk" { UErrorCode }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UConverterToUCallback {
    value : IntPtr

    __value {
        set {
            if (value is UConverterToUCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context 
     * @param {Pointer<UConverterToUnicodeArgs>} args 
     * @param {PSTR} codeUnits 
     * @param {Integer} length 
     * @param {UConverterCallbackReason} reason 
     * @param {Pointer<UErrorCode>} pErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, args, codeUnits, length, reason, pErrorCode) {
        codeUnits := codeUnits is String ? StrPtr(codeUnits) : codeUnits

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        DllCall(this.value, _contextMarshal, _context, UConverterToUnicodeArgs.Ptr, args, "ptr", codeUnits, Int32, length, UConverterCallbackReason, reason, pErrorCodeMarshal, pErrorCode)
    }

    /**
     * A UConverterToUCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UConverterToUCallback {
        /**
         * Creates a UConverterToUCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UConverterToUnicodeArgs, PSTR, Int32, UConverterCallbackReason, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", UConverterToUnicodeArgs.Ptr, PSTR, Int32, UConverterCallbackReason, "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
