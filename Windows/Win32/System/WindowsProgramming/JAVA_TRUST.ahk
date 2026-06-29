#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Contains trust information.
 * @see https://learn.microsoft.com/windows/win32/api/capi/ns-capi-java_trust
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class JAVA_TRUST extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    flag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates whether all ActiveX permissions were requested.
     * @type {BOOL}
     */
    fAllActiveXPermissions {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Indicates whether all Java permissions were requested.
     * @type {BOOL}
     */
    fAllPermissions {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The encoding type. This member can be <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
     * @type {Integer}
     */
    dwEncodingType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The encoded permission blob.
     * @type {Pointer<Integer>}
     */
    pbJavaPermissions {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of the <b>pbJavaPermissions</b> buffer, in bytes.
     * @type {Integer}
     */
    cbJavaPermissions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The encoded signer.
     * @type {Pointer<Integer>}
     */
    pbSigner {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The size of the <b>pbSigner</b> buffer, in bytes.
     * @type {Integer}
     */
    cbSigner {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The zone index.
     * @type {PWSTR}
     */
    pwszZone {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved.
     * @type {Guid}
     */
    guidZone {
        get {
            if(!this.HasProp("__guidZone"))
                this.__guidZone := Guid(64, this)
            return this.__guidZone
        }
    }

    /**
     * The authenticode policy return code.
     * @type {HRESULT}
     */
    hVerify {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 88
    }
}
