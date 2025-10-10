#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_LANGUAGEPROFILE structure contains information about a language profile.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ns-msctf-tf_languageprofile
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_LANGUAGEPROFILE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the class identifier of the text service within the language profile.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the language identifier of the profile.
     * @type {Integer}
     */
    langid {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Specifies the identifier of the category that the text service belongs to.
     * @type {Pointer<Guid>}
     */
    catid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A Boolean value, when <b>TRUE</b>, indicates that the language is activated.
     * @type {Integer}
     */
    fActive {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies the identifier of the language profile.
     * @type {Pointer<Guid>}
     */
    guidProfile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
