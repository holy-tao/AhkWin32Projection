#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the state of an individual system handle at the time the minidump was written.
 * @remarks
 * The first descriptor in the handle data stream follows the header, 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_data_stream">MINIDUMP_HANDLE_DATA_STREAM</a>.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_HANDLE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The operating system handle value.
     * @type {Integer}
     */
    Handle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the object type of the handle. This member can be zero.
     * @type {Integer}
     */
    TypeNameRva {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the object name of the handle. This member can be zero.
     * @type {Integer}
     */
    ObjectNameRva {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The meaning of this member depends on the handle type and the operating system.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The meaning of this member depends on the handle type and the operating system.
     * @type {Integer}
     */
    GrantedAccess {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The meaning of this member depends on the handle type and the operating system.
     * @type {Integer}
     */
    HandleCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The meaning of this member depends on the handle type and the operating system.
     * @type {Integer}
     */
    PointerCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
