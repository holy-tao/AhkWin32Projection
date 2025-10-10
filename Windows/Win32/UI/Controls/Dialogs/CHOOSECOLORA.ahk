#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset ANSI
 */
class CHOOSECOLORA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    hwndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    hInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    rgbResult {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    lpCustColors {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<LPCCHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Byte>}
     */
    lpTemplateName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
