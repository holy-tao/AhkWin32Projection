#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The TF_PERSISTENT_PROPERTY_HEADER_ACP structure is used to provide property header data.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_persistent_property_header_acp
 * @namespace Windows.Win32.UI.TextServices
 */
class TF_PERSISTENT_PROPERTY_HEADER_ACP extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * Contains a GUID that identifies the property.
     * @type {Guid}
     */
    guidType {
        get {
            if(!this.HasProp("__guidType"))
                this.__guidType := Guid(0, this)
            return this.__guidType
        }
    }

    /**
     * Contains the starting character position of the property.
     * @type {Integer}
     */
    ichStart {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Contains the number of characters that the property spans.
     * @type {Integer}
     */
    cch {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Contains the size, in bytes, of the property value.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains a <b>DWORD</b> value defined by the property owner.
     * @type {Integer}
     */
    dwPrivate {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Contains the CLSID of the property owner.
     * @type {Guid}
     */
    clsidTIP {
        get {
            if(!this.HasProp("__clsidTIP"))
                this.__clsidTIP := Guid(32, this)
            return this.__clsidTIP
        }
    }
}
