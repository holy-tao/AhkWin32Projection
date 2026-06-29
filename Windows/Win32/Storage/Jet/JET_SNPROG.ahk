#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_SNPROG class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-snprog-class
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_SNPROG {
    #StructPack 4

    cbStruct : UInt32

    cunitDone : UInt32

    cunitTotal : UInt32

}
