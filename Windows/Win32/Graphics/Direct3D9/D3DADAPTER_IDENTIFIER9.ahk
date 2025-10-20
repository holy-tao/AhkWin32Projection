#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dadapter-identifier9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DADAPTER_IDENTIFIER9 extends Win32Struct
{
    static sizeof => 2152

    static packingSize => 8

    /**
     * @type {String}
     */
    Driver {
        get => StrGet(this.ptr + 0, 511, "UTF-16")
        set => StrPut(value, this.ptr + 0, 511, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 1024, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1024, 511, "UTF-16")
    }

    /**
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 2048, 31, "UTF-16")
        set => StrPut(value, this.ptr + 2048, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    DriverVersion {
        get => NumGet(this, 2112, "int64")
        set => NumPut("int64", value, this, 2112)
    }

    /**
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 2120, "uint")
        set => NumPut("uint", value, this, 2120)
    }

    /**
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 2124, "uint")
        set => NumPut("uint", value, this, 2124)
    }

    /**
     * @type {Integer}
     */
    SubSysId {
        get => NumGet(this, 2128, "uint")
        set => NumPut("uint", value, this, 2128)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 2132, "uint")
        set => NumPut("uint", value, this, 2132)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DeviceIdentifier {
        get => NumGet(this, 2136, "ptr")
        set => NumPut("ptr", value, this, 2136)
    }

    /**
     * @type {Integer}
     */
    WHQLLevel {
        get => NumGet(this, 2144, "uint")
        set => NumPut("uint", value, this, 2144)
    }
}
