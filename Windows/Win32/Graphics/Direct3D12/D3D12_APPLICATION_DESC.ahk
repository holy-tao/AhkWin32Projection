#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VERSION_NUMBER.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_APPLICATION_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pExeFilename {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3D12_VERSION_NUMBER}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := D3D12_VERSION_NUMBER(16, this)
            return this.__Version
        }
    }

    /**
     * @type {PWSTR}
     */
    pEngineName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {D3D12_VERSION_NUMBER}
     */
    EngineVersion{
        get {
            if(!this.HasProp("__EngineVersion"))
                this.__EngineVersion := D3D12_VERSION_NUMBER(40, this)
            return this.__EngineVersion
        }
    }
}
