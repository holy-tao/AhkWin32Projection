#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class OBJECT_ATTRIBUTES extends Win32Struct
{
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
     * @type {HANDLE}
     */
    RootDirectory{
        get {
            if(!this.HasProp("__RootDirectory"))
                this.__RootDirectory := HANDLE(8, this)
            return this.__RootDirectory
        }
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    ObjectName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
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
