#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GROUP_AFFINITY.ahk

/**
 * Describes cache attributes. This structure is used with the GetLogicalProcessorInformationEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-cache_relationship
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class CACHE_RELATIONSHIP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
    CacheSize {
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

    /**
     * This member is reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * @type {GROUP_AFFINITY}
     */
    GroupMask{
        get {
            if(!this.HasProp("__GroupMask"))
                this.__GroupMask := GROUP_AFFINITY(this.ptr + 32)
            return this.__GroupMask
        }
    }

    /**
     * @type {Array<GROUP_AFFINITY>}
     */
    GroupMasks{
        get {
            if(!this.HasProp("__GroupMasksProxyArray"))
                this.__GroupMasksProxyArray := Win32FixedArray(this.ptr + 32, 8, GROUP_AFFINITY, "")
            return this.__GroupMasksProxyArray
        }
    }
}
