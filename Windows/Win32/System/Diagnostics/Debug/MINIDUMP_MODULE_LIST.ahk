#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk
#Include .\MINIDUMP_MODULE.ahk

/**
 * Contains a list of modules.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_module_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MODULE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of structures in the <b>Modules</b> array.
     * @type {Integer}
     */
    NumberOfModules {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_module">MINIDUMP_MODULE</a> structures.
     * @type {Array<MINIDUMP_MODULE>}
     */
    Modules{
        get {
            if(!this.HasProp("__ModulesProxyArray"))
                this.__ModulesProxyArray := Win32FixedArray(this.ptr + 8, 1, MINIDUMP_MODULE, "")
            return this.__ModulesProxyArray
        }
    }
}
