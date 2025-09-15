#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICEDUMP_STRUCTURE_VERSION.ahk
#Include .\DEVICEDUMP_SECTION_HEADER.ahk
#Include .\DEVICEDUMP_SUBSECTION_POINTER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_STORAGEDEVICE_DATA extends Win32Struct
{
    static sizeof => 312

    static packingSize => 8

    /**
     * @type {DEVICEDUMP_STRUCTURE_VERSION}
     */
    Descriptor{
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := DEVICEDUMP_STRUCTURE_VERSION(this.ptr + 0)
            return this.__Descriptor
        }
    }

    /**
     * @type {DEVICEDUMP_SECTION_HEADER}
     */
    SectionHeader{
        get {
            if(!this.HasProp("__SectionHeader"))
                this.__SectionHeader := DEVICEDUMP_SECTION_HEADER(this.ptr + 16)
            return this.__SectionHeader
        }
    }

    /**
     * @type {Integer}
     */
    dwBufferSize {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    dwReasonForCollection {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {DEVICEDUMP_SUBSECTION_POINTER}
     */
    PublicData{
        get {
            if(!this.HasProp("__PublicData"))
                this.__PublicData := DEVICEDUMP_SUBSECTION_POINTER(this.ptr + 264)
            return this.__PublicData
        }
    }

    /**
     * @type {DEVICEDUMP_SUBSECTION_POINTER}
     */
    RestrictedData{
        get {
            if(!this.HasProp("__RestrictedData"))
                this.__RestrictedData := DEVICEDUMP_SUBSECTION_POINTER(this.ptr + 280)
            return this.__RestrictedData
        }
    }

    /**
     * @type {DEVICEDUMP_SUBSECTION_POINTER}
     */
    PrivateData{
        get {
            if(!this.HasProp("__PrivateData"))
                this.__PrivateData := DEVICEDUMP_SUBSECTION_POINTER(this.ptr + 296)
            return this.__PrivateData
        }
    }
}
