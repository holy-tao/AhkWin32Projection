#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_DESCRIPTION {
    #StructPack 8

    AccessFlags : UInt32

    DescriptionSize : UInt32

    PropTypeSet : KSIDENTIFIER

    MembersListCount : UInt32

    Reserved : UInt32

}
