#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include .\TBBUTTON.ahk

/**
 * This structure is passed to applications when they receive a TBN_SAVE notification code. It contains information about the button currently being saved. Applications can modify the values of the members to save additional information.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtbsave
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTBSAVE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
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
     * A pointer to the data stream used to store the save information. When complete, it will contain blocks of Shell-defined information for each button, alternating with blocks defined by the application. Applications may also choose to place a block of global data at the start of 
     * 					<b>pData</b>. The format and length of the application-defined blocks are determined by the application. When the save starts, the Shell will pass the amount of memory it needs in 
     * 					<b>cbData</b>, but no memory will be allocated. You must allocate enough memory for 
     * 					<b>pData</b> to hold your data, plus the Shell's.
     * @type {Pointer<UInt32>}
     */
    pData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * A pointer to the start of the unused portion of the data stream. You should load your data here, and then advance 
     * 					<b>pCurrent</b> to the start of the remaining unused portion. The Shell will then load the information for the next button, advance 
     * 					<b>pCurrent</b>, and so on.
     * @type {Pointer<UInt32>}
     */
    pCurrent {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the data stream. When the save starts, 
     * 					<b>cbData</b> will be set to the amount of data needed by the Shell. You should change it to the total amount allocated.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * This parameter is usually the zero-based index of the button currently being saved. It is set to -1 to indicate that a save is starting.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b>int</b>
     * 
     * An estimate of the number of buttons. Because it is based on the size of the data stream, it may be incorrect. The client should update it as appropriate.
     * @type {Integer}
     */
    cButtons {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structure that contains information about the button currently being saved.
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
