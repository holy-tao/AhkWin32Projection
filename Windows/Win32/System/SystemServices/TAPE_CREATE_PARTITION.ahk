#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TAPE_CREATE_PARTITION {
    #StructPack 4

    Method : UInt32

    Count : UInt32

    Size : UInt32

}
