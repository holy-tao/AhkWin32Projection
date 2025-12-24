#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class FILTER_AGGREGATE_STANDARD_INFORMATION extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    class _Type_e__Union extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

        class _MiniFilter extends Win32Struct {
            static sizeof => 20
            static packingSize => 4
    
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
            static sizeof => 12
            static packingSize => 4
    
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
                    this.__MiniFilter := %this.__Class%._MiniFilter(0, this)
                return this.__MiniFilter
            }
        }
    
        /**
         * @type {_LegacyFilter}
         */
        LegacyFilter{
            get {
                if(!this.HasProp("__LegacyFilter"))
                    this.__LegacyFilter := %this.__Class%._LegacyFilter(0, this)
                return this.__LegacyFilter
            }
        }
    
    }

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

    /**
     * @type {_Type_e__Union}
     */
    Type{
        get {
            if(!this.HasProp("__Type"))
                this.__Type := %this.__Class%._Type_e__Union(8, this)
            return this.__Type
        }
    }
}
