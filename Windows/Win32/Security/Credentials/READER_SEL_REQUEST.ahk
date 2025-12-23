#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class READER_SEL_REQUEST extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwShareMode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwPreferredProtocols {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MatchType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    class _ReaderAndContainerParameter extends Win32Struct {
        static sizeof => 24
        static packingSize => 4

        /**
         * @type {Integer}
         */
        cbReaderNameOffset {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cchReaderNameLength {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        cbContainerNameOffset {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        cchContainerNameLength {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        dwDesiredCardModuleVersion {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        dwCspFlags {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _SerialNumberParameter extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        cbSerialNumberOffset {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cbSerialNumberLength {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwDesiredCardModuleVersion {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {_ReaderAndContainerParameter}
     */
    ReaderAndContainerParameter{
        get {
            if(!this.HasProp("__ReaderAndContainerParameter"))
                this.__ReaderAndContainerParameter := %this.__Class%._ReaderAndContainerParameter(12, this)
            return this.__ReaderAndContainerParameter
        }
    }

    /**
     * @type {_SerialNumberParameter}
     */
    SerialNumberParameter{
        get {
            if(!this.HasProp("__SerialNumberParameter"))
                this.__SerialNumberParameter := %this.__Class%._SerialNumberParameter(12, this)
            return this.__SerialNumberParameter
        }
    }
}
