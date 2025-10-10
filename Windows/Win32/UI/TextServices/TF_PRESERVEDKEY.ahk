#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_PRESERVEDKEY structure represents a preserved key.
 * @remarks
 * 
  * Preserved keys are registered by TSF text services and provide keyboard shortcuts to common commands implemented by the TSF text service.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ns-msctf-tf_preservedkey
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_PRESERVEDKEY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Virtual key code of the keyboard shortcut.
     * @type {Integer}
     */
    uVKey {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Modifies the preserved key. This can be zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-mod--constants">TF_MOD_* constants</a>.
     * @type {Integer}
     */
    uModifiers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
