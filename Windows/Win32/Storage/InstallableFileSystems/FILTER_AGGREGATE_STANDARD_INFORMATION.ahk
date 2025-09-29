#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class FILTER_AGGREGATE_STANDARD_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _MiniFilter extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        FrameID {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        NumberOfInstances {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        FilterNameLength {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        FilterNameBufferOffset {
            get => NumGet(this, 14, "ushort")
            set => NumPut("ushort", value, this, 14)
        }
    
        /**
         * @type {Integer}
         */
        FilterAltitudeLength {
            get => NumGet(this, 16, "ushort")
            set => NumPut("ushort", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        FilterAltitudeBufferOffset {
            get => NumGet(this, 18, "ushort")
            set => NumPut("ushort", value, this, 18)
        }
    
    }

    class _LegacyFilter extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        FilterNameLength {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        FilterNameBufferOffset {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        FilterAltitudeLength {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        FilterAltitudeBufferOffset {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
    }

    /**
     * @type {_MiniFilter}
     */
    MiniFilter{
        get {
            if(!this.HasProp("__MiniFilter"))
                this.__MiniFilter := %this.__Class%._MiniFilter(this.ptr + 8)
            return this.__MiniFilter
        }
    }

    /**
     * @type {_LegacyFilter}
     */
    LegacyFilter{
        get {
            if(!this.HasProp("__LegacyFilter"))
                this.__LegacyFilter := %this.__Class%._LegacyFilter(this.ptr + 8)
            return this.__LegacyFilter
        }
    }
}
