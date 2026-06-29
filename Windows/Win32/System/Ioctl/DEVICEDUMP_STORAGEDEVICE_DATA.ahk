#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICEDUMP_SECTION_HEADER.ahk" { DEVICEDUMP_SECTION_HEADER }
#Import ".\DEVICEDUMP_STRUCTURE_VERSION.ahk" { DEVICEDUMP_STRUCTURE_VERSION }
#Import ".\DEVICEDUMP_SUBSECTION_POINTER.ahk" { DEVICEDUMP_SUBSECTION_POINTER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_STORAGEDEVICE_DATA {
    #StructPack 4

    Descriptor : DEVICEDUMP_STRUCTURE_VERSION

    SectionHeader : DEVICEDUMP_SECTION_HEADER

    dwBufferSize : UInt32

    dwReasonForCollection : UInt32

    PublicData : DEVICEDUMP_SUBSECTION_POINTER

    RestrictedData : DEVICEDUMP_SUBSECTION_POINTER

    PrivateData : DEVICEDUMP_SUBSECTION_POINTER

}
