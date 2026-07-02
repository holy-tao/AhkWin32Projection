#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ITnef.ahk" { ITnef }
#Import "..\..\System\AddressBook\IMessage.ahk" { IMessage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IStream.ahk" { IStream }

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LPOPENTNEFSTREAM {
    value : IntPtr

    __value {
        set {
            if (value is LPOPENTNEFSTREAM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpvSupport 
     * @param {IStream} lpStream 
     * @param {Pointer<Integer>} lpszStreamName 
     * @param {Integer} ulFlags 
     * @param {IMessage} lpMessage 
     * @param {Integer} wKeyVal 
     * @returns {ITnef} 
     */
    Call(lpvSupport, lpStream, lpszStreamName, ulFlags, lpMessage, wKeyVal) {
        lpvSupportMarshal := lpvSupport is VarRef ? "ptr" : "ptr"
        lpszStreamNameMarshal := lpszStreamName is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, lpvSupportMarshal, lpvSupport, "ptr", lpStream, lpszStreamNameMarshal, lpszStreamName, UInt32, ulFlags, "ptr", lpMessage, UInt16, wKeyVal, "ptr*", &lppTNEF := 0, "HRESULT")
        return ITnef(lppTNEF)
    }

    /**
     * A LPOPENTNEFSTREAM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOPENTNEFSTREAM {
        /**
         * Creates a LPOPENTNEFSTREAM pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "char*", UInt32, "ptr", UInt16) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "char*", UInt32, "ptr", UInt16, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
