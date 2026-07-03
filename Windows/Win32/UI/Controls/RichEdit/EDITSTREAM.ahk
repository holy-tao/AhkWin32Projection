#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that an application passes to a rich edit control in a EM_STREAMIN or EM_STREAMOUT message. The rich edit control uses the information to transfer a stream of data into or out of the control.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct EDITSTREAM {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Specifies an application-defined value that the rich edit control passes to the <a href="https://docs.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback">EditStreamCallback</a> callback function specified by the <b>pfnCallback</b> member.
     */
    dwCookie : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Indicates the results of the stream-in (read) or stream-out (write) operation. A value of zero indicates no error. A nonzero value can be the return value of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback">EditStreamCallback</a> function or a code indicating that the control encountered an error.
     */
    dwError : UInt32

    /**
     * Type: <b>EDITSTREAMCALLBACK</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback">EditStreamCallback</a> function, which is an application-defined function that the control calls to transfer data. The control calls the callback function repeatedly, transferring a portion of the data with each call.
     */
    pfnCallback : IntPtr

}
