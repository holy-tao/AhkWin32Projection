#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_SPACEHINTS class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-spacehints-class
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_SPACEHINTS {
    #StructPack 4

    cbStruct : UInt32

    ulInitialDensity : UInt32

    cbInitial : UInt32

    grbit : UInt32

    ulMaintDensity : UInt32

    ulGrowth : UInt32

    cbMinExtent : UInt32

    cbMaxExtent : UInt32

}
