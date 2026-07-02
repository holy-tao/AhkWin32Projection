#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWABObject.ahk" { IWABObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WAB_PARAM.ahk" { WAB_PARAM }
#Import ".\IAddrBook.ahk" { IAddrBook }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPWABOPEN {
    value : IntPtr

    __value {
        set {
            if (value is LPWABOPEN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lppAdrBook 
     * @param {Pointer<IWABObject>} lppWABObject 
     * @param {Pointer<WAB_PARAM>} lpWP 
     * @param {Integer} Reserved2 
     * @returns {HRESULT} 
     */
    Call(lppAdrBook, lppWABObject, lpWP, Reserved2) {
        result := DllCall(this.value, IAddrBook.Ptr, lppAdrBook, IWABObject.Ptr, lppWABObject, WAB_PARAM.Ptr, lpWP, UInt32, Reserved2, "HRESULT")
        return result
    }

    /**
     * A LPWABOPEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWABOPEN {
        /**
         * Creates a LPWABOPEN pointer that invokes the given AHK function when called.
         * @param {Func(IAddrBook, IWABObject, WAB_PARAM, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IAddrBook.Ptr, IWABObject.Ptr, WAB_PARAM.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
