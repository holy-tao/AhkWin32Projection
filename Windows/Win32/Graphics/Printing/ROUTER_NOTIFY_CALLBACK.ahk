#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PRINTER_NOTIFY_INFO.ahk" { PRINTER_NOTIFY_INFO }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct ROUTER_NOTIFY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is ROUTER_NOTIFY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwCommand 
     * @param {Pointer<Void>} pContext 
     * @param {Integer} dwColor 
     * @param {Pointer<PRINTER_NOTIFY_INFO>} pNofityInfo 
     * @param {Integer} fdwFlags 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {BOOL} 
     */
    Call(dwCommand, pContext, dwColor, pNofityInfo, fdwFlags, pdwResult) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, dwCommand, pContextMarshal, pContext, UInt32, dwColor, PRINTER_NOTIFY_INFO.Ptr, pNofityInfo, UInt32, fdwFlags, pdwResultMarshal, pdwResult, BOOL)
        return result
    }

    /**
     * A ROUTER_NOTIFY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ROUTER_NOTIFY_CALLBACK {
        /**
         * Creates a ROUTER_NOTIFY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", UInt32, PRINTER_NOTIFY_INFO, UInt32, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32, PRINTER_NOTIFY_INFO.Ptr, UInt32, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
