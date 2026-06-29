#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct LINK_SHARE_ACCESS {
    #StructPack 4

    OpenCount : UInt32

    Deleters : UInt32

    SharedDelete : UInt32

}
