#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ATTRIBUTES_AND_SID {
    #StructPack 4

    Attributes : UInt32

    SidStart : UInt32

}
