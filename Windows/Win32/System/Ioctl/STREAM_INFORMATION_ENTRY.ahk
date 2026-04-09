#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_STORAGE_TIER_CLASS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STREAM_INFORMATION_ENTRY extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    class _StreamInformation extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        class _DesiredStorageClass extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {FILE_STORAGE_TIER_CLASS}
             */
            Class {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Flags {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        }

        class _DataStream extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Flags {
                get => NumGet(this, 2, "ushort")
                set => NumPut("ushort", value, this, 2)
            }

            /**
             * @type {Integer}
             */
            Reserved {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            Vdl {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        }

        class _Reparse extends Win32Struct {
            static sizeof => 12
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Flags {
                get => NumGet(this, 2, "ushort")
                set => NumPut("ushort", value, this, 2)
            }

            /**
             * @type {Integer}
             */
            ReparseDataSize {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            ReparseDataOffset {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        }

        class _Ea extends Win32Struct {
            static sizeof => 12
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Flags {
                get => NumGet(this, 2, "ushort")
                set => NumPut("ushort", value, this, 2)
            }

            /**
             * @type {Integer}
             */
            EaSize {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            EaInformationOffset {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        }

        /**
         * @type {_DesiredStorageClass}
         */
        DesiredStorageClass {
            get {
                if(!this.HasProp("__DesiredStorageClass"))
                    this.__DesiredStorageClass := STREAM_INFORMATION_ENTRY._StreamInformation._DesiredStorageClass(0, this)
                return this.__DesiredStorageClass
            }
        }

        /**
         * @type {_DataStream}
         */
        DataStream {
            get {
                if(!this.HasProp("__DataStream"))
                    this.__DataStream := STREAM_INFORMATION_ENTRY._StreamInformation._DataStream(0, this)
                return this.__DataStream
            }
        }

        /**
         * @type {_Reparse}
         */
        Reparse {
            get {
                if(!this.HasProp("__Reparse"))
                    this.__Reparse := STREAM_INFORMATION_ENTRY._StreamInformation._Reparse(0, this)
                return this.__Reparse
            }
        }

        /**
         * @type {_Ea}
         */
        Ea {
            get {
                if(!this.HasProp("__Ea"))
                    this.__Ea := STREAM_INFORMATION_ENTRY._StreamInformation._Ea(0, this)
                return this.__Ea
            }
        }
    }

    /**
     * @type {Integer}
     */
    Version {
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
     * @type {_StreamInformation}
     */
    StreamInformation {
        get {
            if(!this.HasProp("__StreamInformation"))
                this.__StreamInformation := STREAM_INFORMATION_ENTRY._StreamInformation(8, this)
            return this.__StreamInformation
        }
    }
}
