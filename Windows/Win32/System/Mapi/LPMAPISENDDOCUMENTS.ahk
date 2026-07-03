#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPISENDDOCUMENTS {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPISENDDOCUMENTS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {PSTR} lpszDelimChar 
     * @param {PSTR} lpszFilePaths 
     * @param {PSTR} lpszFileNames 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     */
    Call(ulUIParam, lpszDelimChar, lpszFilePaths, lpszFileNames, ulReserved) {
        lpszDelimChar := lpszDelimChar is String ? StrPtr(lpszDelimChar) : lpszDelimChar
        lpszFilePaths := lpszFilePaths is String ? StrPtr(lpszFilePaths) : lpszFilePaths
        lpszFileNames := lpszFileNames is String ? StrPtr(lpszFileNames) : lpszFileNames

        result := DllCall(this.value, IntPtr, ulUIParam, "ptr", lpszDelimChar, "ptr", lpszFilePaths, "ptr", lpszFileNames, UInt32, ulReserved, UInt32)
        return result
    }

    /**
     * A LPMAPISENDDOCUMENTS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPISENDDOCUMENTS {
        /**
         * Creates a LPMAPISENDDOCUMENTS pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, PSTR, PSTR, PSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, PSTR, PSTR, PSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
