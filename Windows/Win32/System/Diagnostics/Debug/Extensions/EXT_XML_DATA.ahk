#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXT_CAB_XML_DATA.ahk" { EXT_CAB_XML_DATA }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_XML_DATA {
    value : IntPtr

    __value {
        set {
            if (value is EXT_XML_DATA) {
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
     * @param {Pointer<EXT_CAB_XML_DATA>} pXmpData 
     * @returns {HRESULT} 
     */
    Call(Client, pXmpData) {
        result := DllCall(this.value, "ptr", Client, EXT_CAB_XML_DATA.Ptr, pXmpData, "HRESULT")
        return result
    }

    /**
     * A EXT_XML_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_XML_DATA {
        /**
         * Creates a EXT_XML_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", EXT_CAB_XML_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", EXT_CAB_XML_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
