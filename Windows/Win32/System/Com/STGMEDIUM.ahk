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

    class _u_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HBITMAP}
         */
        hBitmap{
            get {
                if(!this.HasProp("__hBitmap"))
                    this.__hBitmap := HBITMAP(0, this)
                return this.__hBitmap
            }
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hMetaFilePict {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {HENHMETAFILE}
         */
        hEnhMetaFile{
            get {
                if(!this.HasProp("__hEnhMetaFile"))
                    this.__hEnhMetaFile := HENHMETAFILE(0, this)
                return this.__hEnhMetaFile
            }
        }
    
        /**
         * @type {HGLOBAL}
         */
        hGlobal{
            get {
                if(!this.HasProp("__hGlobal"))
                    this.__hGlobal := HGLOBAL(0, this)
                return this.__hGlobal
            }
        }
    
        /**
         * @type {PWSTR}
         */
        lpszFileName {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {IStream}
         */
        pstm {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {IStorage}
         */
        pstg {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    tymed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }

    /**
     * @type {IUnknown}
     */
    pUnkForRelease {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
