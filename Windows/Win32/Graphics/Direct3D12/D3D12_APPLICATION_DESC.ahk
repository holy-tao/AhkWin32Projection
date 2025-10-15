#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
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
    pExeFilename{
        get {
            if(!this.HasProp("__pExeFilename"))
                this.__pExeFilename := PWSTR(this.ptr + 0)
            return this.__pExeFilename
        }
    }

    /**
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
     * @type {D3D12_VERSION_NUMBER}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := D3D12_VERSION_NUMBER(this.ptr + 16)
            return this.__Version
        }
    }

    /**
     * @type {PWSTR}
     */
    pEngineName{
        get {
            if(!this.HasProp("__pEngineName"))
                this.__pEngineName := PWSTR(this.ptr + 32)
            return this.__pEngineName
        }
    }

    /**
     * @type {D3D12_VERSION_NUMBER}
     */
    EngineVersion{
        get {
            if(!this.HasProp("__EngineVersion"))
                this.__EngineVersion := D3D12_VERSION_NUMBER(this.ptr + 40)
            return this.__EngineVersion
        }
    }
}
