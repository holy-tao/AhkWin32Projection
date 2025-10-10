#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the TB_REPLACEBITMAP message to replace one toolbar bitmap with another.
 * @remarks
 * 
  * If 
  * 				<b>nIDNew</b> holds a bitmap handle, rather than a resource ID, do not destroy the bitmap until it has been replaced with <a href="https://docs.microsoft.com/windows/desktop/Controls/tb-replacebitmap">TB_REPLACEBITMAP</a>, or the toolbar is destroyed.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tbreplacebitmap
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TBREPLACEBITMAP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Module instance handle to the bitmap resource being replaced. Set this member to <b>NULL</b> to instead use a bitmap handle.
     * @type {Pointer<Void>}
     */
    hInstOld {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * If 
     * 					<b>hInstOld</b> is <b>NULL</b>, set this member to the bitmap handle of the bitmap that is being replaced. Otherwise, set it to the resource identifier of the bitmap being replaced.
     * @type {Pointer}
     */
    nIDOld {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Module instance handle that contains the new bitmap resource. Set this member to <b>NULL</b> to instead use a bitmap handle.
     * @type {Pointer<Void>}
     */
    hInstNew {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
     * 
     * If 
     * 					<b>hInstNew</b> is <b>NULL</b>, set this member to the bitmap handle of the bitmap with the new button images. Otherwise, set it to the resource identifier of the bitmap with the new button images.
     * @type {Pointer}
     */
    nIDNew {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Number of button images contained in the new bitmap. The number of new images should be the same as the number of replaced images.
     * @type {Integer}
     */
    nButtons {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
