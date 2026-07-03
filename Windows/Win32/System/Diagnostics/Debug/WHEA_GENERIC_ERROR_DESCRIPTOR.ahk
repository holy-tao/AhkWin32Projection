#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_NOTIFICATION_DESCRIPTOR.ahk" { WHEA_NOTIFICATION_DESCRIPTOR }
#Import ".\WHEA_NOTIFICATION_FLAGS.ahk" { WHEA_NOTIFICATION_FLAGS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_GENERIC_ERROR_DESCRIPTOR {
    #StructPack 8

    Type : UInt16

    Reserved : Int8

    Enabled : Int8

    ErrStatusBlockLength : UInt32

    RelatedErrorSourceId : UInt32

    ErrStatusAddressSpaceID : Int8

    ErrStatusAddressBitWidth : Int8

    ErrStatusAddressBitOffset : Int8

    ErrStatusAddressAccessSize : Int8

    ErrStatusAddress : Int64

    Notify : WHEA_NOTIFICATION_DESCRIPTOR

}
