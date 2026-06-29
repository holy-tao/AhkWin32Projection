#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_RECSIZE2 Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-recsize2-structure
 * @namespace Windows.Win32.Storage.Jet
 * @architecture X64, Arm64
 */
export default struct JET_RECSIZE2 {
    #StructPack 8

    cbData : Int64

    cbLongValueData : Int64

    cbOverhead : Int64

    cbLongValueOverhead : Int64

    cNonTaggedColumns : Int64

    cTaggedColumns : Int64

    cLongValues : Int64

    cMultiValues : Int64

    cCompressedColumns : Int64

    cbDataCompressed : Int64

    cbLongValueDataCompressed : Int64

}
