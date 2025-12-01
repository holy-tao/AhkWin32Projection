#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk

/**
 * Contains module information for the MiniDumpCallback function when the callback type is ModuleCallback.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_module_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MODULE_CALLBACK extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * The fully qualified path of the module executable.
     * @type {PWSTR}
     */
    FullPath {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The base address of the module executable image in memory.
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the module executable image in memory, in bytes.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The checksum value of the module executable image.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The timestamp value of the module executable image, in <b>time_t</b> format.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/verrsrc/ns-verrsrc-vs_fixedfileinfo">VS_FIXEDFILEINFO</a> structure that specifies the version of the module.
     * @type {VS_FIXEDFILEINFO}
     */
    VersionInfo{
        get {
            if(!this.HasProp("__VersionInfo"))
                this.__VersionInfo := VS_FIXEDFILEINFO(32, this)
            return this.__VersionInfo
        }
    }

    /**
     * A pointer to a string containing the CodeView record of the module.
     * @type {Pointer<Void>}
     */
    CvRecord {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The size of the Codeview record of the module in the <b>CvRecord</b> member, in bytes.
     * @type {Integer}
     */
    SizeOfCvRecord {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A pointer to a string that specifies the miscellaneous record of the module.
     * @type {Pointer<Void>}
     */
    MiscRecord {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * The size of the miscellaneous record of the module in the <b>MiscRecord</b> member, in bytes.
     * @type {Integer}
     */
    SizeOfMiscRecord {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}
