#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\METARECORD.ahk" { METARECORD }
#Import ".\HANDLETABLE.ahk" { HANDLETABLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\HDC.ahk" { HDC }

/**
 * The EnumMetaFileProc function is an application-defined callback function that processes Windows-format metafile records.
 * @remarks
 * An application must register the callback function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enummetafile">EnumMetaFile</a> function.
 * 
 * <b>EnumMetaFileProc</b> is a placeholder for the application-supplied function name.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/nc-wingdi-mfenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct MFENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is MFENUMPROC) {
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
     * @param {Pointer<METARECORD>} lpMR 
     * @param {Integer} nObj Specifies the number of objects with associated handles in the handle table.
     * @param {LPARAM} param4 
     * @returns {Integer} This function must return a nonzero value to continue enumeration; to stop enumeration, it must return zero.
     */
    Call(_hdc, lpht, lpMR, nObj, param4) {
        result := DllCall(this.value, HDC, _hdc, HANDLETABLE.Ptr, lpht, METARECORD.Ptr, lpMR, Int32, nObj, LPARAM, param4, Int32)
        return result
    }

    /**
     * A MFENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MFENUMPROC {
        /**
         * Creates a MFENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, HANDLETABLE, METARECORD, Int32, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, HANDLETABLE.Ptr, METARECORD.Ptr, Int32, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
