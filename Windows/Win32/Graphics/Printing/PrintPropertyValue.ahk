#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintPropertyValue extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ePropertyType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _propertyBlob extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        cbBuf {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        pBuf {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    /**
     * @type {Integer}
     */
    propertyByte {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    propertyString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    propertyInt32 {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    propertyInt64 {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {_propertyBlob}
     */
    propertyBlob{
        get {
            if(!this.HasProp("__propertyBlob"))
                this.__propertyBlob := %this.__Class%._propertyBlob(this.ptr + 8)
            return this.__propertyBlob
        }
    }
}
