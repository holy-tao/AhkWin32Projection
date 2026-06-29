#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_OBJECTID_INFORMATION {
    #StructPack 1

    ObjectId : Int8[16]

    ExtendedInfo : Int8[48]

}
