#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_THREADSTATS structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-threadstats-structure2
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_THREADSTATS {
    #StructPack 4

    cbStruct : UInt32

    cPageReferenced : UInt32

    cPageRead : UInt32

    cPagePreread : UInt32

    cPageDirtied : UInt32

    cPageRedirtied : UInt32

    cLogRecord : UInt32

    cbLogRecord : UInt32

}
