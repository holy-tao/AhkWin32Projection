#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include .\TBBUTTON.ahk

/**
 * Allows applications to extract the information that was placed in NMTBSAVE when the toolbar state was saved. This structure is passed to applications when they receive a TBN_RESTORE notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtbrestore
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTBRESTORE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to the data stream with the stored save information. It contains Shell-defined blocks of information for each button, alternating with application-defined blocks. Applications may also place a block of global data at the start of 
     * 					<b>pData</b>. The format and length of the application-defined blocks are determined by the application.
     * @type {Pointer<UInt32>}
     */
    pData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to the current block of application-defined data. After extracting the data, the application must advance 
     * 					<b>pCurrent</b> to the end of the block, so it is pointing to the next block of Shell-defined data.
     * @type {Pointer<UInt32>}
     */
    pCurrent {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of 
     * 					<b>pData</b>.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * Value of -1 indicates that the restore is starting, and 
     * 					<b>pCurrent</b> will point to the start of the data stream. Otherwise, it is the zero-based button index, and 
     * 					<b>pCurrent</b> will point to the current button's data.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b>int</b>
     * 
     * Estimate of the number of buttons. Because the estimate is based on the size of the data stream, it might be incorrect. The client should update it as appropriate.
     * @type {Integer}
     */
    cButtons {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b>int</b>
     * 
     * Number of bytes needed to hold the data for each button. When the restore starts, 
     * 					<b>cbBytesPerRecord</b> will be set to the size of the Shell-defined data structure. You need to increment it by the size of the structure that holds the application-defined data.
     * @type {Integer}
     */
    cbBytesPerRecord {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a></b>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structure that contains information about the button currently being restored. Applications must modify this structure as necessary before returning.
     * @type {TBBUTTON}
     */
    tbButton{
        get {
            if(!this.HasProp("__tbButton"))
                this.__tbButton := TBBUTTON(this.ptr + 56)
            return this.__tbButton
        }
    }
}
