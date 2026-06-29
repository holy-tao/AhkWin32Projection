#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct METADATA_GETALL_RECORD {
    #StructPack 4

    dwMDIdentifier : UInt32

    dwMDAttributes : UInt32

    dwMDUserType : UInt32

    dwMDDataType : UInt32

    dwMDDataLen : UInt32

    dwMDDataOffset : UInt32

    dwMDDataTag : UInt32

}
