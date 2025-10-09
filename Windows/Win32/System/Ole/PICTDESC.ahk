#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters to create a picture object through the OleCreatePictureIndirect function.
 * @see https://learn.microsoft.com/windows/win32/api/olectl/ns-olectl-pictdesc
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PICTDESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSizeofstruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of picture described by this structure, which can be any value from the <a href="https://docs.microsoft.com/windows/desktop/com/pictype-constants">PICTYPE</a> enumeration. This selects the arm of the union that corresponds to one of the picture type structures below.
     * @type {Integer}
     */
    picType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _bmp extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        hbitmap {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hpal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _wmf extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        hmeta {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        xExt {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        yExt {
            get => NumGet(this, 12, "int")
            set => NumPut("int", value, this, 12)
        }
    
    }

    /**
     * @type {_bmp}
     */
    bmp{
        get {
            if(!this.HasProp("__bmp"))
                this.__bmp := %this.__Class%._bmp(this.ptr + 8)
            return this.__bmp
        }
    }

    /**
     * @type {_wmf}
     */
    wmf{
        get {
            if(!this.HasProp("__wmf"))
                this.__wmf := %this.__Class%._wmf(this.ptr + 8)
            return this.__wmf
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    icon {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    emf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
