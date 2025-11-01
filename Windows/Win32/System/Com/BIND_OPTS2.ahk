#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIND_OPTS.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-bind_opts2~r1
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BIND_OPTS2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {BIND_OPTS}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := BIND_OPTS(0, this)
            return this.__Base
        }
    }

    /**
     * @type {Integer}
     */
    dwTrackFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwClassContext {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    locale {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<COSERVERINFO>}
     */
    pServerInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
