#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_ConfigPictureDecode {
    #StructPack 4

    dwFunction : UInt32

    dwReservedBits : UInt32[3]

    guidConfigBitstreamEncryption : Guid

    guidConfigMBcontrolEncryption : Guid

    guidConfigResidDiffEncryption : Guid

    bConfigBitstreamRaw : Int8

    bConfigMBcontrolRasterOrder : Int8

    bConfigResidDiffHost : Int8

    bConfigSpatialResid8 : Int8

    bConfigResid8Subtraction : Int8

    bConfigSpatialHost8or9Clipping : Int8

    bConfigSpatialResidInterleaved : Int8

    bConfigIntraResidUnsigned : Int8

    bConfigResidDiffAccelerator : Int8

    bConfigHostInverseScan : Int8

    bConfigSpecificIDCT : Int8

    bConfig4GroupedCoefs : Int8

}
