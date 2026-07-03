#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ITnef.ahk" { ITnef }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\AddressBook\IAddrBook.ahk" { IAddrBook }
#Import "..\..\System\AddressBook\IMessage.ahk" { IMessage }
#Import "..\..\System\Com\IStream.ahk" { IStream }

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LPOPENTNEFSTREAMEX {
    value : IntPtr

    __value {
        set {
            if (value is LPOPENTNEFSTREAMEX) {
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
     * @param {IAddrBook} lpAdressBook 
     * @returns {ITnef} 
     */
    Call(lpvSupport, lpStream, lpszStreamName, ulFlags, lpMessage, wKeyVal, lpAdressBook) {
        lpvSupportMarshal := lpvSupport is VarRef ? "ptr" : "ptr"
        lpszStreamNameMarshal := lpszStreamName is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, lpvSupportMarshal, lpvSupport, "ptr", lpStream, lpszStreamNameMarshal, lpszStreamName, UInt32, ulFlags, "ptr", lpMessage, UInt16, wKeyVal, "ptr", lpAdressBook, "ptr*", &lppTNEF := 0, "HRESULT")
        return ITnef(lppTNEF)
    }

    /**
     * A LPOPENTNEFSTREAMEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOPENTNEFSTREAMEX {
        /**
         * Creates a LPOPENTNEFSTREAMEX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "char*", UInt32, "ptr", UInt16, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "char*", UInt32, "ptr", UInt16, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
