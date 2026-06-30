#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The TF_LANGUAGEPROFILE structure contains information about a language profile.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_languageprofile
 * @namespace Windows.Win32.UI.TextServices
 */
class TF_LANGUAGEPROFILE extends Win32Struct {
    static sizeof => 56

    static packingSize => 4

    /**
     * Specifies the class identifier of the text service within the language profile.
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(0, this)
            return this.__clsid
        }
    }

    /**
     * Specifies the language identifier of the profile.
     * @type {Integer}
     */
    langid {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Specifies the identifier of the category that the text service belongs to.
     * @type {Guid}
     */
    catid {
        get {
            if(!this.HasProp("__catid"))
                this.__catid := Guid(20, this)
            return this.__catid
        }
    }

    /**
     * A Boolean value, when <b>TRUE</b>, indicates that the language is activated.
     * @type {BOOL}
     */
    fActive {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Specifies the identifier of the language profile.
     * @type {Guid}
     */
    guidProfile {
        get {
            if(!this.HasProp("__guidProfile"))
                this.__guidProfile := Guid(40, this)
            return this.__guidProfile
        }
    }
}
