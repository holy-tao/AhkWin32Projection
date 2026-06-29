#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_OBJECTINFO constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-objectinfo-constructor
 * @namespace Windows.Win32.Storage.Jet
 * @architecture X64, Arm64
 */
export default struct JET_OBJECTINFO {
    #StructPack 8

    cbStruct : UInt32

    objtyp : UInt32

    dtCreate : Float64

    dtUpdate : Float64

    grbit : UInt32

    flags : UInt32

    cRecord : UInt32

    cPage : UInt32

}
