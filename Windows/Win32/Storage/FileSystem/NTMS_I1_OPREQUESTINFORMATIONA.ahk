#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_I1_OPREQUESTINFORMATIONA extends Win32Struct
{
    static sizeof => 376

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Request {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(this.ptr + 8)
            return this.__Submitted
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<SByte>}
     */
    szMessage{
        get {
            if(!this.HasProp("__szMessageProxyArray"))
                this.__szMessageProxyArray := Win32FixedArray(this.ptr + 28, 127, Primitive, "char")
            return this.__szMessageProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Arg1Type {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Arg1 {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    Arg2Type {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Arg2 {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Array<SByte>}
     */
    szApplication{
        get {
            if(!this.HasProp("__szApplicationProxyArray"))
                this.__szApplicationProxyArray := Win32FixedArray(this.ptr + 184, 64, Primitive, "char")
            return this.__szApplicationProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szUser{
        get {
            if(!this.HasProp("__szUserProxyArray"))
                this.__szUserProxyArray := Win32FixedArray(this.ptr + 248, 64, Primitive, "char")
            return this.__szUserProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szComputer{
        get {
            if(!this.HasProp("__szComputerProxyArray"))
                this.__szComputerProxyArray := Win32FixedArray(this.ptr + 312, 64, Primitive, "char")
            return this.__szComputerProxyArray
        }
    }
}
