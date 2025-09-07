#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class DxcArgPair extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 0)
            return this.__pName
        }
    }

    /**
     * @type {PWSTR}
     */
    pValue{
        get {
            if(!this.HasProp("__pValue"))
                this.__pValue := PWSTR(this.ptr + 8)
            return this.__pValue
        }
    }
}
