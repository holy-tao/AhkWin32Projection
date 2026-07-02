#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWABObject.ahk" { IWABObject }
#Import ".\LPALLOCATEBUFFER.ahk" { LPALLOCATEBUFFER }
#Import ".\LPFREEBUFFER.ahk" { LPFREEBUFFER }
#Import ".\LPALLOCATEMORE.ahk" { LPALLOCATEMORE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WAB_PARAM.ahk" { WAB_PARAM }
#Import ".\IAddrBook.ahk" { IAddrBook }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPWABOPENEX {
    value : IntPtr

    __value {
        set {
            if (value is LPWABOPENEX) {
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
     * @param {Integer} Reserved 
     * @param {Pointer<LPALLOCATEBUFFER>} fnAllocateBuffer 
     * @param {Pointer<LPALLOCATEMORE>} fnAllocateMore 
     * @param {Pointer<LPFREEBUFFER>} fnFreeBuffer 
     * @returns {HRESULT} 
     */
    Call(lppAdrBook, lppWABObject, lpWP, Reserved, fnAllocateBuffer, fnAllocateMore, fnFreeBuffer) {
        result := DllCall(this.value, IAddrBook.Ptr, lppAdrBook, IWABObject.Ptr, lppWABObject, WAB_PARAM.Ptr, lpWP, UInt32, Reserved, LPALLOCATEBUFFER, fnAllocateBuffer, LPALLOCATEMORE, fnAllocateMore, LPFREEBUFFER, fnFreeBuffer, "HRESULT")
        return result
    }

    /**
     * A LPWABOPENEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWABOPENEX {
        /**
         * Creates a LPWABOPENEX pointer that invokes the given AHK function when called.
         * @param {Func(IAddrBook, IWABObject, WAB_PARAM, UInt32, LPALLOCATEBUFFER, LPALLOCATEMORE, LPFREEBUFFER) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IAddrBook.Ptr, IWABObject.Ptr, WAB_PARAM.Ptr, UInt32, LPALLOCATEBUFFER, LPALLOCATEMORE, LPFREEBUFFER, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
