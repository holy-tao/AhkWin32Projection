#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCHANNEL_INIT_EVENT_FN.ahk" { PCHANNEL_INIT_EVENT_FN }
#Import ".\CHANNEL_DEF.ahk" { CHANNEL_DEF }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PVIRTUALCHANNELINIT {
    value : IntPtr

    __value {
        set {
            if (value is PVIRTUALCHANNELINIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppInitHandle 
     * @param {Pointer<CHANNEL_DEF>} pChannel 
     * @param {Integer} channelCount 
     * @param {Integer} versionRequested 
     * @param {Pointer<PCHANNEL_INIT_EVENT_FN>} pChannelInitEventProc 
     * @returns {Integer} 
     */
    Call(ppInitHandle, pChannel, channelCount, versionRequested, pChannelInitEventProc) {
        ppInitHandleMarshal := ppInitHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ppInitHandleMarshal, ppInitHandle, CHANNEL_DEF.Ptr, pChannel, Int32, channelCount, UInt32, versionRequested, PCHANNEL_INIT_EVENT_FN, pChannelInitEventProc, UInt32)
        return result
    }

    /**
     * A PVIRTUALCHANNELINIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVIRTUALCHANNELINIT {
        /**
         * Creates a PVIRTUALCHANNELINIT pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", CHANNEL_DEF, Int32, UInt32, PCHANNEL_INIT_EVENT_FN) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", CHANNEL_DEF.Ptr, Int32, UInt32, PCHANNEL_INIT_EVENT_FN, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
