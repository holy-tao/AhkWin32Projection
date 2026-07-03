#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct LPFNCREATESTDACCESSIBLEOBJECT {
    value : IntPtr

    __value {
        set {
            if (value is LPFNCREATESTDACCESSIBLEOBJECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {Integer} idObject 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    Call(_hwnd, idObject, riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HWND, _hwnd, Int32, idObject, Guid.Ptr, riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * A LPFNCREATESTDACCESSIBLEOBJECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNCREATESTDACCESSIBLEOBJECT {
        /**
         * Creates a LPFNCREATESTDACCESSIBLEOBJECT pointer that invokes the given AHK function when called.
         * @param {Func(HWND, Int32, Guid, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, Int32, Guid.Ptr, "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
