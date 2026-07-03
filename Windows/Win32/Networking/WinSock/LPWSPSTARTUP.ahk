#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSAPROTOCOL_INFOW.ahk" { WSAPROTOCOL_INFOW }
#Import ".\WSPDATA.ahk" { WSPDATA }
#Import ".\WSPPROC_TABLE.ahk" { WSPPROC_TABLE }
#Import ".\WSPUPCALLTABLE.ahk" { WSPUPCALLTABLE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPSTARTUP {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPSTARTUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} wVersionRequested 
     * @param {Pointer<WSPDATA>} lpWSPData 
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfo 
     * @param {WSPUPCALLTABLE} UpcallTable 
     * @param {Pointer<WSPPROC_TABLE>} lpProcTable 
     * @returns {Integer} 
     */
    Call(wVersionRequested, lpWSPData, lpProtocolInfo, UpcallTable, lpProcTable) {
        result := DllCall(this.value, UInt16, wVersionRequested, WSPDATA.Ptr, lpWSPData, WSAPROTOCOL_INFOW.Ptr, lpProtocolInfo, WSPUPCALLTABLE, UpcallTable, WSPPROC_TABLE.Ptr, lpProcTable, Int32)
        return result
    }

    /**
     * A LPWSPSTARTUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPSTARTUP {
        /**
         * Creates a LPWSPSTARTUP pointer that invokes the given AHK function when called.
         * @param {Func(UInt16, WSPDATA, WSAPROTOCOL_INFOW, WSPUPCALLTABLE, WSPPROC_TABLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt16, WSPDATA.Ptr, WSAPROTOCOL_INFOW.Ptr, WSPUPCALLTABLE, WSPPROC_TABLE.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
