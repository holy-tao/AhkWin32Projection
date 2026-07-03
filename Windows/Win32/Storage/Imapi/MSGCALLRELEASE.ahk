#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\AddressBook\IMessage.ahk" { IMessage }

/**
 * MSGCALLRELEASE defines a callback function that can free an IStorage interface after the final release of an IMessage object.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/msgcallrelease
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct MSGCALLRELEASE {
    value : IntPtr

    __value {
        set {
            if (value is MSGCALLRELEASE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ulCallerData > [in] Contains calling application information about the **IMessage** interface.
     * @param {IMessage} lpMessage > [in] Pointer to the top-level message and attachments that have been released.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ulCallerData, lpMessage) {
        DllCall(this.value, UInt32, ulCallerData, "ptr", lpMessage)
    }

    /**
     * A MSGCALLRELEASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MSGCALLRELEASE {
        /**
         * Creates a MSGCALLRELEASE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
