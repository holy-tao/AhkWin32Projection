#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk
#Include ..\..\Graphics\Gdi\HMETAFILE.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include ..\..\Graphics\Gdi\HENHMETAFILE.ahk

/**
 * Contains parameters to create a picture object through the OleCreatePictureIndirect function.
 * @see https://docs.microsoft.com/windows/win32/api//olectl/ns-olectl-pictdesc
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
         * @type {HBITMAP}
         */
        hbitmap{
            get {
                if(!this.HasProp("__hbitmap"))
                    this.__hbitmap := HBITMAP(0, this)
                return this.__hbitmap
            }
        }
    
        /**
         * @type {HPALETTE}
         */
        hpal{
            get {
                if(!this.HasProp("__hpal"))
                    this.__hpal := HPALETTE(8, this)
                return this.__hpal
            }
        }
    
    }

    class _wmf extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {HMETAFILE}
         */
        hmeta{
            get {
                if(!this.HasProp("__hmeta"))
                    this.__hmeta := HMETAFILE(0, this)
                return this.__hmeta
            }
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

    class _icon extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HICON}
         */
        hicon{
            get {
                if(!this.HasProp("__hicon"))
                    this.__hicon := HICON(0, this)
                return this.__hicon
            }
        }
    
    }

    class _emf extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HENHMETAFILE}
         */
        hemf{
            get {
                if(!this.HasProp("__hemf"))
                    this.__hemf := HENHMETAFILE(0, this)
                return this.__hemf
            }
        }
    
    }

    /**
     * @type {_bmp}
     */
    bmp{
        get {
            if(!this.HasProp("__bmp"))
                this.__bmp := %this.__Class%._bmp(8, this)
            return this.__bmp
        }
    }

    /**
     * @type {_wmf}
     */
    wmf{
        get {
            if(!this.HasProp("__wmf"))
                this.__wmf := %this.__Class%._wmf(8, this)
            return this.__wmf
        }
    }

    /**
     * @type {_icon}
     */
    icon{
        get {
            if(!this.HasProp("__icon"))
                this.__icon := %this.__Class%._icon(8, this)
            return this.__icon
        }
    }

    /**
     * @type {_emf}
     */
    emf{
        get {
            if(!this.HasProp("__emf"))
                this.__emf := %this.__Class%._emf(8, this)
            return this.__emf
        }
    }
}
