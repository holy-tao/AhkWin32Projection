#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_RECPOS constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-recpos-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_RECPOS {
    #StructPack 4

    cbStruct : UInt32

    centriesLT : UInt32

    centriesInRange : UInt32

    centriesTotal : UInt32

}
