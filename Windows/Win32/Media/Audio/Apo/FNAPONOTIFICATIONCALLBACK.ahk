#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\APO_REG_PROPERTIES.ahk" { APO_REG_PROPERTIES }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct FNAPONOTIFICATIONCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is FNAPONOTIFICATIONCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<APO_REG_PROPERTIES>} pProperties 
     * @param {Pointer<Void>} pvRefData 
     * @returns {HRESULT} 
     */
    Call(pProperties, pvRefData) {
        pvRefDataMarshal := pvRefData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, APO_REG_PROPERTIES.Ptr, pProperties, pvRefDataMarshal, pvRefData, "HRESULT")
        return result
    }

    /**
     * A FNAPONOTIFICATIONCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNAPONOTIFICATIONCALLBACK {
        /**
         * Creates a FNAPONOTIFICATIONCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(APO_REG_PROPERTIES, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [APO_REG_PROPERTIES.Ptr, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
