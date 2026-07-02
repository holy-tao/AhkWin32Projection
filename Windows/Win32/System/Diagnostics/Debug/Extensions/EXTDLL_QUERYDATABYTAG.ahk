#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTDLL_QUERYDATABYTAG {
    value : IntPtr

    __value {
        set {
            if (value is EXTDLL_QUERYDATABYTAG) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient4} Client 
     * @param {Integer} dwDataTag 
     * @param {Pointer<Void>} pQueryInfo 
     * @param {Integer} pData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    Call(Client, dwDataTag, pQueryInfo, pData, cbData) {
        pQueryInfoMarshal := pQueryInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", Client, UInt32, dwDataTag, pQueryInfoMarshal, pQueryInfo, IntPtr, pData, UInt32, cbData, "HRESULT")
        return result
    }

    /**
     * A EXTDLL_QUERYDATABYTAG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXTDLL_QUERYDATABYTAG {
        /**
         * Creates a EXTDLL_QUERYDATABYTAG pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", IntPtr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
