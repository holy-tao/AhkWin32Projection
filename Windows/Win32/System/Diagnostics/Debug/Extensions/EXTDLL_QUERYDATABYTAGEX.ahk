#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTDLL_QUERYDATABYTAGEX {
    value : IntPtr

    __value {
        set {
            if (value is EXTDLL_QUERYDATABYTAGEX) {
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
     * @param {Integer} pDataEx 
     * @param {Integer} cbDataEx 
     * @returns {HRESULT} 
     */
    Call(Client, dwDataTag, pQueryInfo, pData, cbData, pDataEx, cbDataEx) {
        pQueryInfoMarshal := pQueryInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", Client, UInt32, dwDataTag, pQueryInfoMarshal, pQueryInfo, IntPtr, pData, UInt32, cbData, IntPtr, pDataEx, UInt32, cbDataEx, "HRESULT")
        return result
    }

    /**
     * A EXTDLL_QUERYDATABYTAGEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXTDLL_QUERYDATABYTAGEX {
        /**
         * Creates a EXTDLL_QUERYDATABYTAGEX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", IntPtr, UInt32, IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", IntPtr, UInt32, IntPtr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
