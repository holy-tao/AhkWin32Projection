#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_TUPLELIMITS Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-tuplelimits-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_TUPLELIMITS {
    #StructPack 4

    chLengthMin : UInt32

    chLengthMax : UInt32

    chToIndexMax : UInt32

    cchIncrement : UInt32

    ichStart : UInt32

}
