#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class INSTANCE_AGGREGATE_STANDARD_INFORMATION extends Win32Struct
{
    static sizeof => 48

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
        static sizeof => 36
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
        VolumeFileSystemType {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        InstanceNameLength {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        InstanceNameBufferOffset {
            get => NumGet(this, 14, "ushort")
            set => NumPut("ushort", value, this, 14)
        }
    
        /**
         * @type {Integer}
         */
        AltitudeLength {
            get => NumGet(this, 16, "ushort")
            set => NumPut("ushort", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        AltitudeBufferOffset {
            get => NumGet(this, 18, "ushort")
            set => NumPut("ushort", value, this, 18)
        }
    
        /**
         * @type {Integer}
         */
        VolumeNameLength {
            get => NumGet(this, 20, "ushort")
            set => NumPut("ushort", value, this, 20)
        }
    
        /**
         * @type {Integer}
         */
        VolumeNameBufferOffset {
            get => NumGet(this, 22, "ushort")
            set => NumPut("ushort", value, this, 22)
        }
    
        /**
         * @type {Integer}
         */
        FilterNameLength {
            get => NumGet(this, 24, "ushort")
            set => NumPut("ushort", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        FilterNameBufferOffset {
            get => NumGet(this, 26, "ushort")
            set => NumPut("ushort", value, this, 26)
        }
    
        /**
         * @type {Integer}
         */
        SupportedFeatures {
            get => NumGet(this, 28, "uint")
            set => NumPut("uint", value, this, 28)
        }
    
    }

    class _LegacyFilter extends Win32Struct {
        static sizeof => 36
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
        AltitudeLength {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        AltitudeBufferOffset {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        VolumeNameLength {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        VolumeNameBufferOffset {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
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
        SupportedFeatures {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    /**
     * @type {_MiniFilter}
     */
    MiniFilter{
        get {
            if(!this.HasProp("__MiniFilter"))
                this.__MiniFilter := %this.__Class%._MiniFilter(8, this)
            return this.__MiniFilter
        }
    }

    /**
     * @type {_LegacyFilter}
     */
    LegacyFilter{
        get {
            if(!this.HasProp("__LegacyFilter"))
                this.__LegacyFilter := %this.__Class%._LegacyFilter(8, this)
            return this.__LegacyFilter
        }
    }
}
