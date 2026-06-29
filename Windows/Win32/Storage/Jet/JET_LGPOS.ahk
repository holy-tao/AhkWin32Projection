#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_LGPOS structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-lgpos-structure2
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_LGPOS {
    #StructPack 4

    ib : UInt16

    isec : UInt16

    lGeneration : Int32

}
