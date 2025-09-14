#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PM_INVOCATIONINFO.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_STARTTILEBLOB extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ProductID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    TileID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TemplateType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Array<UInt32>}
     */
    HubPosition{
        get {
            if(!this.HasProp("__HubPositionProxyArray"))
                this.__HubPositionProxyArray := Win32FixedArray(this.ptr + 28, 32, Primitive, "uint")
            return this.__HubPositionProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HubVisibilityBitmask {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    IsDefault {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    TileType {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPropBlob {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    cbPropBlob {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    IsRestoring {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    IsModern {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {PM_INVOCATIONINFO}
     */
    InvocationInfo{
        get {
            if(!this.HasProp("__InvocationInfo"))
                this.__InvocationInfo := PM_INVOCATIONINFO(this.ptr + 192)
            return this.__InvocationInfo
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 208
    }
}
