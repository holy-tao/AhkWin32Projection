#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCENUMPROTOCOLS {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCENUMPROTOCOLS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} lpiProtocols 
     * @param {Integer} lpProtocolBuffer 
     * @param {Pointer<Integer>} lpdwBufferLength 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(lpiProtocols, lpProtocolBuffer, lpdwBufferLength, lpErrno) {
        lpiProtocolsMarshal := lpiProtocols is VarRef ? "int*" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, lpiProtocolsMarshal, lpiProtocols, IntPtr, lpProtocolBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSCENUMPROTOCOLS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCENUMPROTOCOLS {
        /**
         * Creates a LPWSCENUMPROTOCOLS pointer that invokes the given AHK function when called.
         * @param {Func("int*", IntPtr, "uint*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int*", IntPtr, "uint*", "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
