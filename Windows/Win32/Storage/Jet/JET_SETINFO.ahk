#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_SETINFO class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-setinfo-class
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_SETINFO {
    #StructPack 4

    cbStruct : UInt32

    ibLongValue : UInt32

    itagSequence : UInt32

}
