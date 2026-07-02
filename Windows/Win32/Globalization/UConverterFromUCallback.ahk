#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UConverterCallbackReason.ahk" { UConverterCallbackReason }
#Import ".\UErrorCode.ahk" { UErrorCode }
#Import ".\UConverterFromUnicodeArgs.ahk" { UConverterFromUnicodeArgs }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UConverterFromUCallback {
    value : IntPtr

    __value {
        set {
            if (value is UConverterFromUCallback) {
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
     * @param {Pointer<UConverterFromUnicodeArgs>} args 
     * @param {Pointer<Integer>} codeUnits 
     * @param {Integer} length 
     * @param {Integer} codePoint 
     * @param {UConverterCallbackReason} reason 
     * @param {Pointer<UErrorCode>} pErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, args, codeUnits, length, codePoint, reason, pErrorCode) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        codeUnitsMarshal := codeUnits is VarRef ? "ushort*" : "ptr"
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        DllCall(this.value, _contextMarshal, _context, UConverterFromUnicodeArgs.Ptr, args, codeUnitsMarshal, codeUnits, Int32, length, Int32, codePoint, UConverterCallbackReason, reason, pErrorCodeMarshal, pErrorCode)
    }

    /**
     * A UConverterFromUCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UConverterFromUCallback {
        /**
         * Creates a UConverterFromUCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UConverterFromUnicodeArgs, "ushort*", Int32, Int32, UConverterCallbackReason, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", UConverterFromUnicodeArgs.Ptr, "ushort*", Int32, Int32, UConverterCallbackReason, "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
