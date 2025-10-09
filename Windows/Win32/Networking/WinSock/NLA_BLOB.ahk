#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NLA_BLOB extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    class _header extends Win32Struct {
        static sizeof => 1056
        static packingSize => 8

        /**
         * @type {Integer}
         */
        type {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwSize {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        nextOffset {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {_header}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := %this.__Class%._header(this.ptr + 0)
            return this.__header
        }
    }

    class _interfaceData extends Win32Struct {
        static sizeof => 1040
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwType {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwSpeed {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {String}
         */
        adapterName {
            get => StrGet(this.ptr + 8, 0, "UTF-16")
            set => StrPut(value, this.ptr + 8, 0, "UTF-16")
        }
    
    }

    class _locationData extends Win32Struct {
        static sizeof => 1040
        static packingSize => 8

        /**
         * @type {String}
         */
        information {
            get => StrGet(this.ptr + 0, 0, "UTF-16")
            set => StrPut(value, this.ptr + 0, 0, "UTF-16")
        }
    
    }

    class _connectivity extends Win32Struct {
        static sizeof => 1040
        static packingSize => 8

        /**
         * @type {Integer}
         */
        type {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        internet {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    class _ICS extends Win32Struct {
        static sizeof => 1040
        static packingSize => 8

        class _remote extends Win32Struct {
            static sizeof => 1040
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            speed {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            type {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            state {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {String}
             */
            machineName {
                get => StrGet(this.ptr + 12, 255, "UTF-16")
                set => StrPut(value, this.ptr + 12, 255, "UTF-16")
            }
        
            /**
             * @type {String}
             */
            sharedAdapterName {
                get => StrGet(this.ptr + 524, 255, "UTF-16")
                set => StrPut(value, this.ptr + 524, 255, "UTF-16")
            }
        
        }
    
        /**
         * @type {_remote}
         */
        remote{
            get {
                if(!this.HasProp("__remote"))
                    this.__remote := %this.__Class%._remote(this.ptr + 0)
                return this.__remote
            }
        }
    
    }

    /**
     * @type {String}
     */
    rawData {
        get => StrGet(this.ptr + 16, 0, "UTF-16")
        set => StrPut(value, this.ptr + 16, 0, "UTF-16")
    }

    /**
     * @type {_interfaceData}
     */
    interfaceData{
        get {
            if(!this.HasProp("__interfaceData"))
                this.__interfaceData := %this.__Class%._interfaceData(this.ptr + 16)
            return this.__interfaceData
        }
    }

    /**
     * @type {_locationData}
     */
    locationData{
        get {
            if(!this.HasProp("__locationData"))
                this.__locationData := %this.__Class%._locationData(this.ptr + 16)
            return this.__locationData
        }
    }

    /**
     * @type {_connectivity}
     */
    connectivity{
        get {
            if(!this.HasProp("__connectivity"))
                this.__connectivity := %this.__Class%._connectivity(this.ptr + 16)
            return this.__connectivity
        }
    }

    /**
     * @type {_ICS}
     */
    ICS{
        get {
            if(!this.HasProp("__ICS"))
                this.__ICS := %this.__Class%._ICS(this.ptr + 16)
            return this.__ICS
        }
    }
}
