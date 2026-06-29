#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_ENUMCOLUMNVALUE constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-enumcolumnvalue-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_ENUMCOLUMNVALUE {
    #StructPack 8

    itagSequence : UInt32

    err : Int32

    cbData : UInt32

    pvData : IntPtr

}
