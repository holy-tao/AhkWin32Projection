#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KBUGCHECK_CALLBACK_REASON.ahk" { KBUGCHECK_CALLBACK_REASON }
#Import ".\KBUGCHECK_REASON_CALLBACK_RECORD.ahk" { KBUGCHECK_REASON_CALLBACK_RECORD }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_REASON_CALLBACK_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KBUGCHECK_REASON_CALLBACK_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {KBUGCHECK_CALLBACK_REASON} Reason 
     * @param {Pointer<KBUGCHECK_REASON_CALLBACK_RECORD>} Record 
     * @param {Pointer<Void>} ReasonSpecificData 
     * @param {Integer} ReasonSpecificDataLength 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Reason, Record, ReasonSpecificData, ReasonSpecificDataLength) {
        ReasonSpecificDataMarshal := ReasonSpecificData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, KBUGCHECK_CALLBACK_REASON, Reason, KBUGCHECK_REASON_CALLBACK_RECORD.Ptr, Record, ReasonSpecificDataMarshal, ReasonSpecificData, UInt32, ReasonSpecificDataLength)
    }

    /**
     * A KBUGCHECK_REASON_CALLBACK_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KBUGCHECK_REASON_CALLBACK_ROUTINE {
        /**
         * Creates a KBUGCHECK_REASON_CALLBACK_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(KBUGCHECK_CALLBACK_REASON, KBUGCHECK_REASON_CALLBACK_RECORD, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KBUGCHECK_CALLBACK_REASON, KBUGCHECK_REASON_CALLBACK_RECORD.Ptr, "ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
