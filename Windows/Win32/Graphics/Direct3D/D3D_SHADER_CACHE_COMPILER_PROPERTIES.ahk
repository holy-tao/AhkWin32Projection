#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_VERSION_NUMBER.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_SHADER_CACHE_COMPILER_PROPERTIES extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * @type {String}
     */
    szAdapterFamily {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    MinimumABISupportVersion {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    MaximumABISupportVersion {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {D3D_VERSION_NUMBER}
     */
    CompilerVersion{
        get {
            if(!this.HasProp("__CompilerVersion"))
                this.__CompilerVersion := D3D_VERSION_NUMBER(this.ptr + 272)
            return this.__CompilerVersion
        }
    }

    /**
     * @type {D3D_VERSION_NUMBER}
     */
    ApplicationProfileVersion{
        get {
            if(!this.HasProp("__ApplicationProfileVersion"))
                this.__ApplicationProfileVersion := D3D_VERSION_NUMBER(this.ptr + 288)
            return this.__ApplicationProfileVersion
        }
    }
}
