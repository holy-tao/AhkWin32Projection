#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PVIRTUALCHANNELOPEN {
    value : IntPtr

    __value {
        set {
            if (value is PVIRTUALCHANNELOPEN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pInitHandle 
     * @param {Pointer<Integer>} pOpenHandle 
     * @param {PSTR} pChannelName 
     * @param {Pointer<PCHANNEL_OPEN_EVENT_FN>} pChannelOpenEventProc 
     * @returns {Integer} 
     */
    Call(pInitHandle, pOpenHandle, pChannelName, pChannelOpenEventProc) {
        pChannelName := pChannelName is String ? StrPtr(pChannelName) : pChannelName

        pInitHandleMarshal := pInitHandle is VarRef ? "ptr" : "ptr"
        pOpenHandleMarshal := pOpenHandle is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pInitHandleMarshal, pInitHandle, pOpenHandleMarshal, pOpenHandle, "ptr", pChannelName, "ptr", pChannelOpenEventProc, UInt32)
        return result
    }

    /**
     * A PVIRTUALCHANNELOPEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVIRTUALCHANNELOPEN {
        /**
         * Creates a PVIRTUALCHANNELOPEN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", PSTR, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", PSTR, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
