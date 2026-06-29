#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_ARCHIVE_MEMBER_HEADER {
    #StructPack 1

    Name : Int8[16]

    Date : Int8[12]

    UserID : Int8[6]

    GroupID : Int8[6]

    Mode : Int8[8]

    Size : Int8[10]

    EndHeader : Int8[2]

}
