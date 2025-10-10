#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information that an application passes to a rich edit control in a EM_STREAMIN or EM_STREAMOUT message. The rich edit control uses the information to transfer a stream of data into or out of the control.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-editstream
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class EDITSTREAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Specifies an application-defined value that the rich edit control passes to the <a href="https://docs.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback">EditStreamCallback</a> callback function specified by the <b>pfnCallback</b> member.
     * @type {Pointer}
     */
    dwCookie {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Indicates the results of the stream-in (read) or stream-out (write) operation. A value of zero indicates no error. A nonzero value can be the return value of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback">EditStreamCallback</a> function or a code indicating that the control encountered an error.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>EDITSTREAMCALLBACK</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/richedit/nc-richedit-editstreamcallback">EditStreamCallback</a> function, which is an application-defined function that the control calls to transfer data. The control calls the callback function repeatedly, transferring a portion of the data with each call.
     * @type {Pointer<EDITSTREAMCALLBACK>}
     */
    pfnCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
