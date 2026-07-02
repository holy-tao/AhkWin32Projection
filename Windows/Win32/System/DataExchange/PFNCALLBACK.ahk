#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCONV.ahk" { HCONV }
#Import ".\HDDEDATA.ahk" { HDDEDATA }
#Import ".\HSZ.ahk" { HSZ }

/**
 * An application-defined callback function used with the Dynamic Data Exchange Management Library (DDEML) functions.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/nc-ddeml-pfncallback
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct PFNCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} wType Type: <b>UINT</b>
     * 
     * The type of the current transaction. This parameter consists of a combination of transaction class flags and transaction type flags. The following table describes each of the transaction classes and provides a list of the transaction types in each class. For information about a specific transaction type, see the individual description of that type in **Remarks**.
     * @param {Integer} wFmt Type: <b>UINT</b>
     * 
     * The format in which data is sent or received.
     * @param {HCONV} _hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation associated with the current transaction.
     * @param {HSZ} hsz1 Type: <b>HSZ</b>
     * 
     * A handle to a string. The meaning of this parameter depends on the type of the current transaction. For the meaning of this parameter, see the description of the transaction type in **Remarks**.
     * @param {HSZ} hsz2 Type: <b>HSZ</b>
     * 
     * A handle to a string. The meaning of this parameter depends on the type of the current transaction. For the meaning of this parameter, see the description of the transaction type in **Remarks**.
     * @param {HDDEDATA} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to DDE data. The meaning of this parameter depends on the type of the current transaction. For the meaning of this parameter, see the description of the transaction type in **Remarks**.
     * @param {Pointer} dwData1 Type: <b>ULONG_PTR</b>
     * 
     * Transaction-specific data. For the meaning of this parameter, see the description of the transaction type in **Remarks**.
     * @param {Pointer} dwData2 Type: <b>ULONG_PTR</b>
     * 
     * Transaction-specific data. For the meaning of this parameter, see the description of the transaction type in **Remarks**.
     * @returns {HDDEDATA} Type: <b>HDDEDATA</b>
     * 
     * The return value depends on the transaction class. For more information about the return values, see descriptions of the individual transaction types.
     */
    Call(wType, wFmt, _hConv, hsz1, hsz2, hData, dwData1, dwData2) {
        result := DllCall(this.value, UInt32, wType, UInt32, wFmt, HCONV, _hConv, HSZ, hsz1, HSZ, hsz2, HDDEDATA, hData, IntPtr, dwData1, IntPtr, dwData2, HDDEDATA.Owned)
        return result
    }

    /**
     * A PFNCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCALLBACK {
        /**
         * Creates a PFNCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, HCONV, HSZ, HSZ, HDDEDATA, IntPtr, IntPtr) => HDDEDATA} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, HCONV, HSZ, HSZ, HDDEDATA, IntPtr, IntPtr, HDDEDATA])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
