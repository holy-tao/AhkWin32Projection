#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EditStreamCallback function is an application defined callback function used with the EM_STREAMIN and EM_STREAMOUT messages.
 * @remarks
 * When you send the <a href="https://msdn.microsoft.com/b8d3a108-b415-4f5e-99e7-0e0e7a82a778">EM_STREAMIN</a> or <a href="https://msdn.microsoft.com/3f14aaac-4b17-47af-8f2b-503390631a88">EM_STREAMOUT</a> message to a rich edit control, the 
 * 				<i>pfnCallback</i> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream">EDITSTREAM</a> structure specifies a pointer to an <i>EditStreamCallback</i> function. The rich edit control repeatedly calls the function to transfer a stream of data into or out of the control. 
 * 
 * When you send the <a href="https://msdn.microsoft.com/b8d3a108-b415-4f5e-99e7-0e0e7a82a778">EM_STREAMIN</a> or <a href="https://msdn.microsoft.com/3f14aaac-4b17-47af-8f2b-503390631a88">EM_STREAMOUT</a> message, you specify a value for the 
 * 				<i>dwCookie</i> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream">EDITSTREAM</a> structure. The rich edit control uses the 
 * 				<i>dwCookie</i> parameter to pass this value to your <i>EditStreamCallback</i> function. For example, you might use 
 * 				<i>dwCookie</i> to pass a handle to an open file. The callback function can then use the 
 * 				<i>dwCookie</i> handle to read from or write to the file. 
 * 
 * The control calls the callback function repeatedly, transferring a portion of the data with each call. The control continues to call the callback function until one of the following conditions occurs: 
 * 
 * <ul>
 * <li>The callback function returns a nonzero value. </li>
 * <li>The callback function returns zero in the *
 * 						<i>pcb</i> parameter. </li>
 * <li>An error occurs that prevents the rich edit control from transferring data into or out of itself. Examples are out-of-memory situations, failure of a system function, or an invalid character in the read buffer. </li>
 * <li>For a stream-in operation, the RTF code contains data specifying the end of an RTF block. </li>
 * <li>For a stream-in operation on a single-line edit control, the callback reads in an end-of-paragraph character (CR, LF, VT, LS, or PS). </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct EDITSTREAMCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is EDITSTREAMCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} dwCookie Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Value of the 
     * 					<i>dwCookie</i> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream">EDITSTREAM</a> structure. The application specifies this value when it sends the <a href="https://msdn.microsoft.com/b8d3a108-b415-4f5e-99e7-0e0e7a82a778">EM_STREAMIN</a> or <a href="https://msdn.microsoft.com/3f14aaac-4b17-47af-8f2b-503390631a88">EM_STREAMOUT</a> message.
     * @param {Pointer<Integer>} pbBuff Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBYTE</a></b>
     * 
     * Pointer to a buffer to read from or write to. For a stream-in (read) operation, the callback function fills this buffer with data to transfer into the rich edit control. For a stream-out (write) operation, the buffer contains data from the control that the callback function writes to some storage.
     * @param {Integer} cb Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Number of bytes to read or write.
     * @param {Pointer<Integer>} pcb Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * Pointer to a variable that the callback function sets to the number of bytes actually read or written.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The callback function returns zero to indicate success.
     * 
     * The callback function returns a nonzero value to indicate an error. If an error occurs, the read or write operation ends and the rich edit control discards any data in the 
     * 						<i>pbBuff</i> buffer. If the callback function returns a nonzero value, the rich edit control uses the 
     * 						<i>dwError</i> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream">EDITSTREAM</a> structure to pass the value back to the application.
     */
    Call(dwCookie, pbBuff, cb, pcb) {
        pbBuffMarshal := pbBuff is VarRef ? "char*" : "ptr"
        pcbMarshal := pcb is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, IntPtr, dwCookie, pbBuffMarshal, pbBuff, Int32, cb, pcbMarshal, pcb, UInt32)
        return result
    }

    /**
     * A EDITSTREAMCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EDITSTREAMCALLBACK {
        /**
         * Creates a EDITSTREAMCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "char*", Int32, "int*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "char*", Int32, "int*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
