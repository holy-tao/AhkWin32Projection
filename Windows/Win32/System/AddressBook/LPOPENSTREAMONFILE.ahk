#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPALLOCATEBUFFER.ahk" { LPALLOCATEBUFFER }
#Import ".\LPFREEBUFFER.ahk" { LPFREEBUFFER }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IStream.ahk" { IStream }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPOPENSTREAMONFILE {
    value : IntPtr

    __value {
        set {
            if (value is LPOPENSTREAMONFILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LPALLOCATEBUFFER>} _lpAllocateBuffer 
     * @param {Pointer<LPFREEBUFFER>} _lpFreeBuffer 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpszFileName 
     * @param {Pointer<Integer>} lpszPrefix 
     * @returns {IStream} 
     */
    Call(_lpAllocateBuffer, _lpFreeBuffer, ulFlags, lpszFileName, lpszPrefix) {
        lpszFileNameMarshal := lpszFileName is VarRef ? "char*" : "ptr"
        lpszPrefixMarshal := lpszPrefix is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, LPALLOCATEBUFFER, _lpAllocateBuffer, LPFREEBUFFER, _lpFreeBuffer, UInt32, ulFlags, lpszFileNameMarshal, lpszFileName, lpszPrefixMarshal, lpszPrefix, "ptr*", &lppStream := 0, "HRESULT")
        return IStream(lppStream)
    }

    /**
     * A LPOPENSTREAMONFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOPENSTREAMONFILE {
        /**
         * Creates a LPOPENSTREAMONFILE pointer that invokes the given AHK function when called.
         * @param {Func(LPALLOCATEBUFFER, LPFREEBUFFER, UInt32, "char*", "char*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPALLOCATEBUFFER, LPFREEBUFFER, UInt32, "char*", "char*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
