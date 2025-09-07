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
    static sizeof => 292

    static packingSize => 1

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
                this.__SectionHeader := DEVICEDUMP_SECTION_HEADER(this.ptr + 12)
            return this.__SectionHeader
        }
    }

    /**
     * @type {Integer}
     */
    dwBufferSize {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    dwReasonForCollection {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * @type {DEVICEDUMP_SUBSECTION_POINTER}
     */
    PublicData{
        get {
            if(!this.HasProp("__PublicData"))
                this.__PublicData := DEVICEDUMP_SUBSECTION_POINTER(this.ptr + 256)
            return this.__PublicData
        }
    }

    /**
     * @type {DEVICEDUMP_SUBSECTION_POINTER}
     */
    RestrictedData{
        get {
            if(!this.HasProp("__RestrictedData"))
                this.__RestrictedData := DEVICEDUMP_SUBSECTION_POINTER(this.ptr + 268)
            return this.__RestrictedData
        }
    }

    /**
     * @type {DEVICEDUMP_SUBSECTION_POINTER}
     */
    PrivateData{
        get {
            if(!this.HasProp("__PrivateData"))
                this.__PrivateData := DEVICEDUMP_SUBSECTION_POINTER(this.ptr + 280)
            return this.__PrivateData
        }
    }
}
