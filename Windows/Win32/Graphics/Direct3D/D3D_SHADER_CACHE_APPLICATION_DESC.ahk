#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_VERSION_NUMBER.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_CACHE_APPLICATION_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<Char>}
     */
    pExeFilename {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3D_VERSION_NUMBER}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := D3D_VERSION_NUMBER(this.ptr + 16)
            return this.__Version
        }
    }

    /**
     * @type {Pointer<Char>}
     */
    pEngineName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {D3D_VERSION_NUMBER}
     */
    EngineVersion{
        get {
            if(!this.HasProp("__EngineVersion"))
                this.__EngineVersion := D3D_VERSION_NUMBER(this.ptr + 40)
            return this.__EngineVersion
        }
    }
}
