#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFAX_RECIPIENT_CALLBACKW.ahk" { PFAX_RECIPIENT_CALLBACKW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSENDDOCUMENTFORBROADCASTW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSENDDOCUMENTFORBROADCASTW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {PWSTR} FileName 
     * @param {Pointer<Integer>} FaxJobId 
     * @param {Pointer<PFAX_RECIPIENT_CALLBACKW>} FaxRecipientCallback 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOL} 
     */
    Call(FaxHandle, FileName, FaxJobId, FaxRecipientCallback, _Context) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, "ptr", FileName, FaxJobIdMarshal, FaxJobId, PFAX_RECIPIENT_CALLBACKW, FaxRecipientCallback, _ContextMarshal, _Context, BOOL)
        return result
    }

    /**
     * A PFAXSENDDOCUMENTFORBROADCASTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSENDDOCUMENTFORBROADCASTW {
        /**
         * Creates a PFAXSENDDOCUMENTFORBROADCASTW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, "uint*", PFAX_RECIPIENT_CALLBACKW, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, "uint*", PFAX_RECIPIENT_CALLBACKW, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
