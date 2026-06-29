#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @architecture X64, Arm64
 */
export default struct JET_THREADSTATS2 {
    #StructPack 8

    cbStruct : UInt32

    cPageReferenced : UInt32

    cPageRead : UInt32

    cPagePreread : UInt32

    cPageDirtied : UInt32

    cPageRedirtied : UInt32

    cLogRecord : UInt32

    cbLogRecord : UInt32

    cusecPageCacheMiss : Int64

    cPageCacheMiss : UInt32

}
