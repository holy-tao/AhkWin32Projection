#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CHANNEL_ENTRY_POINTS.ahk" { CHANNEL_ENTRY_POINTS }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PVIRTUALCHANNELENTRY {
    value : IntPtr

    __value {
        set {
            if (value is PVIRTUALCHANNELENTRY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CHANNEL_ENTRY_POINTS>} pEntryPoints 
     * @returns {BOOL} 
     */
    Call(pEntryPoints) {
        result := DllCall(this.value, CHANNEL_ENTRY_POINTS.Ptr, pEntryPoints, BOOL)
        return result
    }

    /**
     * A PVIRTUALCHANNELENTRY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVIRTUALCHANNELENTRY {
        /**
         * Creates a PVIRTUALCHANNELENTRY pointer that invokes the given AHK function when called.
         * @param {Func(CHANNEL_ENTRY_POINTS) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CHANNEL_ENTRY_POINTS.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
