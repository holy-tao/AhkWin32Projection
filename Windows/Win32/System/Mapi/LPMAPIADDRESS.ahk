#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MapiRecipDesc.ahk" { MapiRecipDesc }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIADDRESS {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIADDRESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} lhSession 
     * @param {Pointer} ulUIParam 
     * @param {PSTR} lpszCaption 
     * @param {Integer} nEditFields 
     * @param {PSTR} lpszLabels 
     * @param {Integer} nRecips 
     * @param {Pointer<MapiRecipDesc>} lpRecips 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {Pointer<Integer>} lpnNewRecips 
     * @param {Pointer<Pointer<MapiRecipDesc>>} lppNewRecips 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpszCaption, nEditFields, lpszLabels, nRecips, lpRecips, flFlags, ulReserved, lpnNewRecips, lppNewRecips) {
        lpszCaption := lpszCaption is String ? StrPtr(lpszCaption) : lpszCaption
        lpszLabels := lpszLabels is String ? StrPtr(lpszLabels) : lpszLabels

        lpnNewRecipsMarshal := lpnNewRecips is VarRef ? "uint*" : "ptr"
        lppNewRecipsMarshal := lppNewRecips is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, "ptr", lpszCaption, UInt32, nEditFields, "ptr", lpszLabels, UInt32, nRecips, MapiRecipDesc.Ptr, lpRecips, UInt32, flFlags, UInt32, ulReserved, lpnNewRecipsMarshal, lpnNewRecips, lppNewRecipsMarshal, lppNewRecips, UInt32)
        return result
    }

    /**
     * A LPMAPIADDRESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIADDRESS {
        /**
         * Creates a LPMAPIADDRESS pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, PSTR, UInt32, PSTR, UInt32, MapiRecipDesc, UInt32, UInt32, "uint*", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, PSTR, UInt32, PSTR, UInt32, MapiRecipDesc.Ptr, UInt32, UInt32, "uint*", "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
