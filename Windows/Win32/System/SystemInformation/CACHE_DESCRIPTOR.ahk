#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the cache attributes.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-cache_descriptor
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class CACHE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The cache associativity. If this member is CACHE_FULLY_ASSOCIATIVE (0xFF), the cache is fully associative.
     * @type {Integer}
     */
    Associativity {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The cache line size, in bytes.
     * @type {Integer}
     */
    LineSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The cache size, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The cache type. This member is a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-processor_cache_type">PROCESSOR_CACHE_TYPE</a> value.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
