#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_IMAGE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<SPC_LINK>}
     */
    pImageLink {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    Bitmap{
        get {
            if(!this.HasProp("__Bitmap"))
                this.__Bitmap := CRYPT_INTEGER_BLOB(8, this)
            return this.__Bitmap
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    Metafile{
        get {
            if(!this.HasProp("__Metafile"))
                this.__Metafile := CRYPT_INTEGER_BLOB(24, this)
            return this.__Metafile
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    EnhancedMetafile{
        get {
            if(!this.HasProp("__EnhancedMetafile"))
                this.__EnhancedMetafile := CRYPT_INTEGER_BLOB(40, this)
            return this.__EnhancedMetafile
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    GifFile{
        get {
            if(!this.HasProp("__GifFile"))
                this.__GifFile := CRYPT_INTEGER_BLOB(56, this)
            return this.__GifFile
        }
    }
}
