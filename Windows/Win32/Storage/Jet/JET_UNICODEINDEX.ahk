#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_UNICODEINDEX Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-unicodeindex-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_UNICODEINDEX {
    #StructPack 4

    lcid : UInt32

    dwMapFlags : UInt32

}
