#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_ENUMCOLUMNID Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-enumcolumnid-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_ENUMCOLUMNID {
    #StructPack 8

    columnid : UInt32

    ctagSequence : UInt32

    rgtagSequence : IntPtr

}
