#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

/**
 * Adds a bitmap that contains button images to a toolbar.
 * @remarks
 * 
  * If 
  * 				<b>nID</b> holds a bitmap handle, rather than a resource ID, do not destroy the bitmap until it has been replaced with <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-replacebitmap">TB_REPLACEBITMAP</a>. Otherwise, the toolbar is destroyed.
  * 
  * Defined values can be used as indexes to the standard bitmaps. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-standard-button-image-index-values">Toolbar Standard Button Image Index Values</a>.
  * 
  * The <b>TBADDBITMAP</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-addbitmap">TB_ADDBITMAP</a> message.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tbaddbitmap
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TBADDBITMAP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Handle to the module instance with the executable file that contains a bitmap resource. To use bitmap handles instead of resource IDs, set this member to <b>NULL</b>.
     * @type {HINSTANCE}
     */
    hInst{
        get {
            if(!this.HasProp("__hInst"))
                this.__hInst := HINSTANCE(0, this)
            return this.__hInst
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * If 
     * 					<b>hInst</b> is <b>NULL</b>, set this member to the bitmap handle of the bitmap with the button images. Otherwise, set it to the resource identifier of the bitmap with the button images.
     * @type {Pointer}
     */
    nID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
