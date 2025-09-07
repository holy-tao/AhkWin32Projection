#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk

/**
 * Contains information for a specific module.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_module
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MODULE extends Win32Struct
{
    static sizeof => 108

    static packingSize => 4

    /**
     * The base address of the module executable image in memory.
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the module executable image in memory, in bytes.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The checksum value of the module executable image.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The timestamp value of the module executable image, in <b>time_t</b> format.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the name of the module.
     * @type {Integer}
     */
    ModuleNameRva {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/verrsrc/ns-verrsrc-vs_fixedfileinfo">VS_FIXEDFILEINFO</a> structure that specifies the version of the module.
     * @type {VS_FIXEDFILEINFO}
     */
    VersionInfo{
        get {
            if(!this.HasProp("__VersionInfo"))
                this.__VersionInfo := VS_FIXEDFILEINFO(this.ptr + 24)
            return this.__VersionInfo
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure that specifies the CodeView record of the module.
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    CvRecord{
        get {
            if(!this.HasProp("__CvRecord"))
                this.__CvRecord := MINIDUMP_LOCATION_DESCRIPTOR(this.ptr + 76)
            return this.__CvRecord
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure that specifies the miscellaneous record of the module.
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    MiscRecord{
        get {
            if(!this.HasProp("__MiscRecord"))
                this.__MiscRecord := MINIDUMP_LOCATION_DESCRIPTOR(this.ptr + 84)
            return this.__MiscRecord
        }
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
