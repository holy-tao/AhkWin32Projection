#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\STRTABLEA.ahk" { STRTABLEA }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct REGINSTALLA {
    value : IntPtr

    __value {
        set {
            if (value is REGINSTALLA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HMODULE} hm 
     * @param {PSTR} pszSection 
     * @param {Pointer<STRTABLEA>} pstTable 
     * @returns {HRESULT} 
     */
    Call(hm, pszSection, pstTable) {
        pszSection := pszSection is String ? StrPtr(pszSection) : pszSection

        result := DllCall(this.value, HMODULE, hm, "ptr", pszSection, STRTABLEA.Ptr, pstTable, "HRESULT")
        return result
    }

    /**
     * A REGINSTALLA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends REGINSTALLA {
        /**
         * Creates a REGINSTALLA pointer that invokes the given AHK function when called.
         * @param {Func(HMODULE, PSTR, STRTABLEA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HMODULE, PSTR, STRTABLEA.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
