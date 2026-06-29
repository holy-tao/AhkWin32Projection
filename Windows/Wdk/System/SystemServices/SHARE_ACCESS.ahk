#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SHARE_ACCESS {
    #StructPack 4

    OpenCount : UInt32

    Readers : UInt32

    Writers : UInt32

    Deleters : UInt32

    SharedRead : UInt32

    SharedWrite : UInt32

    SharedDelete : UInt32

}
