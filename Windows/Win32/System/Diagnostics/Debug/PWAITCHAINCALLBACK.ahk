#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WAITCHAIN_NODE_INFO.ahk" { WAITCHAIN_NODE_INFO }

/**
 * An application-defined callback function that receives a wait chain. Specify this address when calling the OpenThreadWaitChainSession function.
 * @see https://learn.microsoft.com/windows/win32/api/wct/nc-wct-pwaitchaincallback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PWAITCHAINCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PWAITCHAINCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} WctHandle A handle to the WCT session created by the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nf-wct-openthreadwaitchainsession">OpenThreadWaitChainSession</a> function.
     * @param {Pointer} _Context A optional pointer to an application-defined context structure specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nf-wct-getthreadwaitchain">GetThreadWaitChain</a> function.
     * @param {Integer} CallbackStatus 
     * @param {Pointer<Integer>} NodeCount The number of nodes retrieved, up to WCT_MAX_NODE_COUNT. If the array cannot contain all the nodes of the wait chain, the function fails, <i>CallbackStatus</i> is ERROR_MORE_DATA, and this parameter receives the number of array elements required to contain all the nodes.
     * @param {Pointer<WAITCHAIN_NODE_INFO>} NodeInfoArray An array of <a href="https://docs.microsoft.com/windows/desktop/api/wct/ns-wct-waitchain_node_info">WAITCHAIN_NODE_INFO</a> structures that receives the wait chain.
     * @param {Pointer<BOOL>} IsCycle If the function detects a deadlock, this variable is set to <b>TRUE</b>; otherwise, it is set to <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(WctHandle, _Context, CallbackStatus, NodeCount, NodeInfoArray, IsCycle) {
        WctHandleMarshal := WctHandle is VarRef ? "ptr" : "ptr"
        NodeCountMarshal := NodeCount is VarRef ? "uint*" : "ptr"
        IsCycleMarshal := IsCycle is VarRef ? "int*" : "ptr"

        DllCall(this.value, WctHandleMarshal, WctHandle, IntPtr, _Context, UInt32, CallbackStatus, NodeCountMarshal, NodeCount, WAITCHAIN_NODE_INFO.Ptr, NodeInfoArray, IsCycleMarshal, IsCycle)
    }

    /**
     * A PWAITCHAINCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWAITCHAINCALLBACK {
        /**
         * Creates a PWAITCHAINCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, "uint*", WAITCHAIN_NODE_INFO, BOOL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "uint*", WAITCHAIN_NODE_INFO.Ptr, BOOL.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
