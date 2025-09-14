#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class MODULEENTRY extends Win32Struct
{
    static sizeof => 284

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    szModule{
        get {
            if(!this.HasProp("__szModuleProxyArray"))
                this.__szModuleProxyArray := Win32FixedArray(this.ptr + 4, 10, Primitive, "char")
            return this.__szModuleProxyArray
        }
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    hModule {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    wcUsage {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Array<SByte>}
     */
    szExePath{
        get {
            if(!this.HasProp("__szExePathProxyArray"))
                this.__szExePathProxyArray := Win32FixedArray(this.ptr + 26, 256, Primitive, "char")
            return this.__szExePathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    wNext {
        get => NumGet(this, 282, "ushort")
        set => NumPut("ushort", value, this, 282)
    }
}
