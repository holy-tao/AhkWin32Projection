#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS.ahk" { QOS }
#Import ".\WSABUF.ahk" { WSABUF }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPCONDITIONPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPCONDITIONPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WSABUF>} lpCallerId 
     * @param {Pointer<WSABUF>} lpCallerData 
     * @param {Pointer<QOS>} lpSQOS 
     * @param {Pointer<QOS>} lpGQOS 
     * @param {Pointer<WSABUF>} lpCalleeId 
     * @param {Pointer<WSABUF>} lpCalleeData 
     * @param {Pointer<Integer>} g 
     * @param {Pointer} dwCallbackData 
     * @returns {Integer} 
     */
    Call(lpCallerId, lpCallerData, lpSQOS, lpGQOS, lpCalleeId, lpCalleeData, g, dwCallbackData) {
        gMarshal := g is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, WSABUF.Ptr, lpCallerId, WSABUF.Ptr, lpCallerData, QOS.Ptr, lpSQOS, QOS.Ptr, lpGQOS, WSABUF.Ptr, lpCalleeId, WSABUF.Ptr, lpCalleeData, gMarshal, g, IntPtr, dwCallbackData, Int32)
        return result
    }

    /**
     * A LPCONDITIONPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPCONDITIONPROC {
        /**
         * Creates a LPCONDITIONPROC pointer that invokes the given AHK function when called.
         * @param {Func(WSABUF, WSABUF, QOS, QOS, WSABUF, WSABUF, "uint*", IntPtr) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSABUF.Ptr, WSABUF.Ptr, QOS.Ptr, QOS.Ptr, WSABUF.Ptr, WSABUF.Ptr, "uint*", IntPtr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
