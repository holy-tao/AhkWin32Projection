#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HTASK.ahk
#Include .\HMMIO.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MMIOINFO extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fccIOProc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<LPMMIOPROC>}
     */
    pIOProc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wErrorRet {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HTASK}
     */
    htask{
        get {
            if(!this.HasProp("__htask"))
                this.__htask := HTASK(24, this)
            return this.__htask
        }
    }

    /**
     * @type {Integer}
     */
    cchBuffer {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pchBuffer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pchNext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pchEndRead {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pchEndWrite {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    lBufOffset {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    lDiskOffset {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Array<UInt32>}
     */
    adwInfo{
        get {
            if(!this.HasProp("__adwInfoProxyArray"))
                this.__adwInfoProxyArray := Win32FixedArray(this.ptr + 80, 3, Primitive, "uint")
            return this.__adwInfoProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {HMMIO}
     */
    hmmio{
        get {
            if(!this.HasProp("__hmmio"))
                this.__hmmio := HMMIO(104, this)
            return this.__hmmio
        }
    }
}
