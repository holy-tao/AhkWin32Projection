#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
class FILTER_AGGREGATE_BASIC_INFORMATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    class _Type extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        class _MiniFilter extends Win32Struct {
            static sizeof => 16
            static packingSize => 4

            /**
             * @type {Integer}
             */
            FrameID {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            NumberOfInstances {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            FilterNameLength {
                get => NumGet(this, 8, "ushort")
                set => NumPut("ushort", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            FilterNameBufferOffset {
                get => NumGet(this, 10, "ushort")
                set => NumPut("ushort", value, this, 10)
            }

            /**
             * @type {Integer}
             */
            FilterAltitudeLength {
                get => NumGet(this, 12, "ushort")
                set => NumPut("ushort", value, this, 12)
            }

            /**
             * @type {Integer}
             */
            FilterAltitudeBufferOffset {
                get => NumGet(this, 14, "ushort")
                set => NumPut("ushort", value, this, 14)
            }
        }

        class _LegacyFilter extends Win32Struct {
            static sizeof => 4
            static packingSize => 2

            /**
             * @type {Integer}
             */
            FilterNameLength {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            FilterNameBufferOffset {
                get => NumGet(this, 2, "ushort")
                set => NumPut("ushort", value, this, 2)
            }
        }

        /**
         * @type {_MiniFilter}
         */
        MiniFilter {
            get {
                if(!this.HasProp("__MiniFilter"))
                    this.__MiniFilter := FILTER_AGGREGATE_BASIC_INFORMATION._Type._MiniFilter(0, this)
                return this.__MiniFilter
            }
        }

        /**
         * @type {_LegacyFilter}
         */
        LegacyFilter {
            get {
                if(!this.HasProp("__LegacyFilter"))
                    this.__LegacyFilter := FILTER_AGGREGATE_BASIC_INFORMATION._Type._LegacyFilter(0, this)
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
     * @type {_Type}
     */
    Type {
        get {
            if(!this.HasProp("__Type"))
                this.__Type := FILTER_AGGREGATE_BASIC_INFORMATION._Type(8, this)
            return this.__Type
        }
    }
}
