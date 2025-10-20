#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Graphics\Gdi\HENHMETAFILE.ahk
#Include ..\..\Foundation\HGLOBAL.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STGMEDIUM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    tymed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HBITMAP}
     */
    hBitmap{
        get {
            if(!this.HasProp("__hBitmap"))
                this.__hBitmap := HBITMAP(8, this)
            return this.__hBitmap
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    hMetaFilePict {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HENHMETAFILE}
     */
    hEnhMetaFile{
        get {
            if(!this.HasProp("__hEnhMetaFile"))
                this.__hEnhMetaFile := HENHMETAFILE(8, this)
            return this.__hEnhMetaFile
        }
    }

    /**
     * @type {HGLOBAL}
     */
    hGlobal{
        get {
            if(!this.HasProp("__hGlobal"))
                this.__hGlobal := HGLOBAL(8, this)
            return this.__hGlobal
        }
    }

    /**
     * @type {PWSTR}
     */
    lpszFileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IStream}
     */
    pstm {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IStorage}
     */
    pstg {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IUnknown}
     */
    pUnkForRelease {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
