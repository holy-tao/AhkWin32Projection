#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BIND_OPTS.ahk
#Include .\BIND_OPTS2.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-bind_opts3~r1
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BIND_OPTS3 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {BIND_OPTS2}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := BIND_OPTS2(0, this)
            return this.__Base
        }
    }

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(40, this)
            return this.__hwnd
        }
    }
}
