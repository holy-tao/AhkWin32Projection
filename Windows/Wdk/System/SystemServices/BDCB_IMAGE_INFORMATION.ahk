#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class BDCB_IMAGE_INFORMATION extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Classification {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ImageFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {UNICODE_STRING}
     */
    ImageName{
        get {
            if(!this.HasProp("__ImageName"))
                this.__ImageName := UNICODE_STRING(8, this)
            return this.__ImageName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    RegistryPath{
        get {
            if(!this.HasProp("__RegistryPath"))
                this.__RegistryPath := UNICODE_STRING(24, this)
            return this.__RegistryPath
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    CertificatePublisher{
        get {
            if(!this.HasProp("__CertificatePublisher"))
                this.__CertificatePublisher := UNICODE_STRING(40, this)
            return this.__CertificatePublisher
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    CertificateIssuer{
        get {
            if(!this.HasProp("__CertificateIssuer"))
                this.__CertificateIssuer := UNICODE_STRING(56, this)
            return this.__CertificateIssuer
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    ImageHash {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Void>}
     */
    CertificateThumbprint {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ImageHashAlgorithm {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ThumbprintHashAlgorithm {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    ImageHashLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    CertificateThumbprintLength {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
