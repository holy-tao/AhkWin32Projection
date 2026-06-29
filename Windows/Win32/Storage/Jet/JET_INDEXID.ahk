#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_INDEXID Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-indexid-structure
 * @namespace Windows.Win32.Storage.Jet
 * @architecture X64, Arm64
 */
export default struct JET_INDEXID {
    #StructPack 4

    cbStruct : UInt32

    rgbIndexId : Int8[16]

}
