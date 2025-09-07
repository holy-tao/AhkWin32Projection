#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk
#Include ..\..\Graphics\Gdi\HMETAFILE.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include ..\..\Graphics\Gdi\HENHMETAFILE.ahk

/**
 * Contains parameters to create a picture object through the OleCreatePictureIndirect function.
 * @see https://learn.microsoft.com/windows/win32/api/olectl/ns-olectl-pictdesc
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PICTDESC extends Win32Struct
{
    static sizeof => 16

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

    /**
     * @type {HBITMAP}
     */
    hbitmap{
        get {
            if(!this.HasProp("__hbitmap"))
                this.__hbitmap := HBITMAP(this.ptr + 8)
            return this.__hbitmap
        }
    }

    /**
     * @type {HPALETTE}
     */
    hpal{
        get {
            if(!this.HasProp("__hpal"))
                this.__hpal := HPALETTE(this.ptr + 16)
            return this.__hpal
        }
    }

    /**
     * @type {HMETAFILE}
     */
    hmeta{
        get {
            if(!this.HasProp("__hmeta"))
                this.__hmeta := HMETAFILE(this.ptr + 8)
            return this.__hmeta
        }
    }

    /**
     * @type {Integer}
     */
    xExt {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    yExt {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {HICON}
     */
    hicon{
        get {
            if(!this.HasProp("__hicon"))
                this.__hicon := HICON(this.ptr + 8)
            return this.__hicon
        }
    }

    /**
     * @type {HENHMETAFILE}
     */
    hemf{
        get {
            if(!this.HasProp("__hemf"))
                this.__hemf := HENHMETAFILE(this.ptr + 8)
            return this.__hemf
        }
    }
}
