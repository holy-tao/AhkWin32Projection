#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct fpCreateIFELanguageInstanceType {
    value : IntPtr

    __value {
        set {
            if (value is fpCreateIFELanguageInstanceType) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @returns {HRESULT} 
     */
    Call(clsid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, clsid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }

    /**
     * A fpCreateIFELanguageInstanceType that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends fpCreateIFELanguageInstanceType {
        /**
         * Creates a fpCreateIFELanguageInstanceType pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
