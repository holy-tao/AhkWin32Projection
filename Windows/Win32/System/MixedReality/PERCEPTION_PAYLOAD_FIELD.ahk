#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.MixedReality
 */
export default struct PERCEPTION_PAYLOAD_FIELD {
    #StructPack 4

    FieldId : Guid

    OffsetInBytes : UInt32

    SizeInBytes : UInt32

}
