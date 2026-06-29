#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NETWORK_OPEN_INTEGRITY_QUALIFIER.ahk
#Include .\NETWORK_OPEN_LOCATION_QUALIFIER.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class NETWORK_OPEN_ECP_CONTEXT extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    class _in extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {NETWORK_OPEN_LOCATION_QUALIFIER}
         */
        Location {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {NETWORK_OPEN_INTEGRITY_QUALIFIER}
         */
        Integrity {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    }

    class _out extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {NETWORK_OPEN_LOCATION_QUALIFIER}
         */
        Location {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {NETWORK_OPEN_INTEGRITY_QUALIFIER}
         */
        Integrity {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    }

    /**
     * @type {_in}
     */
    in {
        get {
            if(!this.HasProp("__in"))
                this.__in := NETWORK_OPEN_ECP_CONTEXT._in(4, this)
            return this.__in
        }
    }

    /**
     * @type {_out}
     */
    out {
        get {
            if(!this.HasProp("__out"))
                this.__out := NETWORK_OPEN_ECP_CONTEXT._out(16, this)
            return this.__out
        }
    }
}
