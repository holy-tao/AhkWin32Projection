#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\ENHMETARECORD.ahk" { ENHMETARECORD }
#Import ".\HANDLETABLE.ahk" { HANDLETABLE }
#Import ".\HDC.ahk" { HDC }

/**
 * The EnhMetaFileProc function is an application-defined callback function used with the EnumEnhMetaFile function.
 * @remarks
 * An application must register the callback function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumenhmetafile">EnumEnhMetaFile</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/nc-wingdi-enhmfenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ENHMFENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is ENHMFENUMPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDC} _hdc 
     * @param {Pointer<HANDLETABLE>} lpht 
     * @param {Pointer<ENHMETARECORD>} lpmr 
     * @param {Integer} nHandles 
     * @param {LPARAM} data 
     * @returns {Integer} This function must return a nonzero value to continue enumeration; to stop enumeration, it must return zero.
     */
    Call(_hdc, lpht, lpmr, nHandles, data) {
        result := DllCall(this.value, HDC, _hdc, HANDLETABLE.Ptr, lpht, ENHMETARECORD.Ptr, lpmr, Int32, nHandles, LPARAM, data, Int32)
        return result
    }

    /**
     * A ENHMFENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENHMFENUMPROC {
        /**
         * Creates a ENHMFENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, HANDLETABLE, ENHMETARECORD, Int32, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, HANDLETABLE.Ptr, ENHMETARECORD.Ptr, Int32, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
