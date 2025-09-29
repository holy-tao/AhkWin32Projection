#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class uCLSSPEC extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    class _tagged_union extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        class _ByName extends Win32Struct {
            static sizeof => 72
            static packingSize => 8
    
            /**
             * @type {Pointer<Char>}
             */
            pPackageName {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<Guid>}
             */
            PolicyId {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        
        }
    
        class _ByObjectId extends Win32Struct {
            static sizeof => 72
            static packingSize => 8
    
            /**
             * @type {Pointer<Guid>}
             */
            ObjectId {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<Guid>}
             */
            PolicyId {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        clsid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pFileExt {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pMimeType {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pProgId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pFileName {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {_ByName}
         */
        ByName{
            get {
                if(!this.HasProp("__ByName"))
                    this.__ByName := %this.__Class%._ByName(this.ptr + 0)
                return this.__ByName
            }
        }
    
        /**
         * @type {_ByObjectId}
         */
        ByObjectId{
            get {
                if(!this.HasProp("__ByObjectId"))
                    this.__ByObjectId := %this.__Class%._ByObjectId(this.ptr + 0)
                return this.__ByObjectId
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    tyspec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_tagged_union}
     */
    tagged_union{
        get {
            if(!this.HasProp("__tagged_union"))
                this.__tagged_union := %this.__Class%._tagged_union(this.ptr + 8)
            return this.__tagged_union
        }
    }
}
