#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ACMDRVSTREAMHEADER extends Win32Struct
{
    static sizeof => 124

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fdwStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    dwUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbSrc {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbSrcLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cbSrcLengthUsed {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer}
     */
    dwSrcUser {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbDst {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    cbDstLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cbDstLengthUsed {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer}
     */
    dwDstUser {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    fdwConvert {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<ACMDRVSTREAMHEADER>}
     */
    padshNext {
        get => NumGet(this, 68, "ptr")
        set => NumPut("ptr", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    fdwDriver {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Pointer}
     */
    dwDriver {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    fdwPrepared {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    dwPrepared {
        get => NumGet(this, 92, "ptr")
        set => NumPut("ptr", value, this, 92)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPreparedSrc {
        get => NumGet(this, 100, "ptr")
        set => NumPut("ptr", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    cbPreparedSrcLength {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPreparedDst {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    cbPreparedDstLength {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }
}
