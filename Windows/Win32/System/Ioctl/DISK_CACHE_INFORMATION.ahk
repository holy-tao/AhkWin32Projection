#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the disk cache.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_cache_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_CACHE_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Indicates whether the device is capable of saving any parameters in nonvolatile storage.
     * @type {BOOLEAN}
     */
    ParametersSavable {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Indicates whether the read cache is enabled.
     * @type {BOOLEAN}
     */
    ReadCacheEnabled {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Indicates whether the write cache is enabled.
     * @type {BOOLEAN}
     */
    WriteCacheEnabled {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Determines the likelihood of data cached from a read operation remaining in the cache. This data might be given a different priority than data cached under other circumstances, such as from a prefetch operation.
     * @type {Integer}
     */
    ReadRetentionPriority {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Determines the likelihood of data cached from a write operation remaining in the cache. This data might be given a different priority than data cached under other circumstances, such as from a prefetch operation.
     * @type {Integer}
     */
    WriteRetentionPriority {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Disables prefetching. Prefetching might be disabled whenever the number of blocks requested exceeds the value in <i>DisablePrefetchTransferLength</i>. When zero, prefetching is disabled no matter what the size of the block request.
     * @type {Integer}
     */
    DisablePrefetchTransferLength {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * If this member is  <b>TRUE</b>,  the union is a <b>ScalarPrefetch</b> structure. Otherwise, the union is a <b>BlockPrefetch</b> structure.
     * @type {BOOLEAN}
     */
    PrefetchScalar {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    class _ScalarPrefetch extends Win32Struct {
        static sizeof => 6
        static packingSize => 2

        /**
         * @type {Integer}
         */
        Minimum {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Maximum {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        MaximumBlocks {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
    }

    class _BlockPrefetch extends Win32Struct {
        static sizeof => 4
        static packingSize => 2

        /**
         * @type {Integer}
         */
        Minimum {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Maximum {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
    }

    /**
     * @type {_ScalarPrefetch}
     */
    ScalarPrefetch{
        get {
            if(!this.HasProp("__ScalarPrefetch"))
                this.__ScalarPrefetch := %this.__Class%._ScalarPrefetch(16, this)
            return this.__ScalarPrefetch
        }
    }

    /**
     * @type {_BlockPrefetch}
     */
    BlockPrefetch{
        get {
            if(!this.HasProp("__BlockPrefetch"))
                this.__BlockPrefetch := %this.__Class%._BlockPrefetch(16, this)
            return this.__BlockPrefetch
        }
    }
}
