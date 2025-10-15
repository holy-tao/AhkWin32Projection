#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class DxcDefine extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PWSTR(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * @type {PWSTR}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := PWSTR(this.ptr + 8)
            return this.__Value
        }
    }
}
