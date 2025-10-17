#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDIDECRYPT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    fdidt {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    class _cabinet extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        pHeaderReserve {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cbHeaderReserve {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        setID {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
        /**
         * @type {Integer}
         */
        iCabinet {
            get => NumGet(this, 12, "int")
            set => NumPut("int", value, this, 12)
        }
    
    }

    class _folder extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        pFolderReserve {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cbFolderReserve {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        iFolder {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
    }

    class _decrypt extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        pDataReserve {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        cbDataReserve {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        pbData {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        cbData {
            get => NumGet(this, 24, "ushort")
            set => NumPut("ushort", value, this, 24)
        }
    
        /**
         * @type {BOOL}
         */
        fSplit {
            get => NumGet(this, 28, "int")
            set => NumPut("int", value, this, 28)
        }
    
        /**
         * @type {Integer}
         */
        cbPartial {
            get => NumGet(this, 32, "ushort")
            set => NumPut("ushort", value, this, 32)
        }
    
    }

    /**
     * @type {_cabinet}
     */
    cabinet{
        get {
            if(!this.HasProp("__cabinet"))
                this.__cabinet := %this.__Class%._cabinet(16, this)
            return this.__cabinet
        }
    }

    /**
     * @type {_folder}
     */
    folder{
        get {
            if(!this.HasProp("__folder"))
                this.__folder := %this.__Class%._folder(16, this)
            return this.__folder
        }
    }

    /**
     * @type {_decrypt}
     */
    decrypt{
        get {
            if(!this.HasProp("__decrypt"))
                this.__decrypt := %this.__Class%._decrypt(16, this)
            return this.__decrypt
        }
    }
}
