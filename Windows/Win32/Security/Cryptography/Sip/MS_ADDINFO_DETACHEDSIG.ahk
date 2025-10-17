#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class MS_ADDINFO_DETACHEDSIG extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hSignatureFile{
        get {
            if(!this.HasProp("__hSignatureFile"))
                this.__hSignatureFile := HANDLE(8, this)
            return this.__hSignatureFile
        }
    }

    /**
     * @type {Integer}
     */
    cbSignatureObject {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbSignatureObject {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
