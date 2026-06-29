#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_RETINFO Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-retinfo-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_RETINFO {
    #StructPack 4

    cbStruct : UInt32

    ibLongValue : UInt32

    itagSequence : UInt32

    columnidNextTagged : UInt32

}
