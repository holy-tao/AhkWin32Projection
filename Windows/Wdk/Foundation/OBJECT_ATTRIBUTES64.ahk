#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\OBJECT_ATTRIBUTE_FLAGS.ahk
#Include ..\..\Win32\Security\SECURITY_DESCRIPTOR.ahk
#Include ..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class OBJECT_ATTRIBUTES64 extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RootDirectory {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ObjectName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {OBJECT_ATTRIBUTE_FLAGS}
     */
    Attributes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<SECURITY_DESCRIPTOR>}
     */
    SecurityDescriptor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<SECURITY_QUALITY_OF_SERVICE>}
     */
    SecurityQualityOfService {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
