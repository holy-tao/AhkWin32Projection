#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_NEGOTIATE {
    #StructPack 2

    AUTH_TYPE : Int8

    AUTH_ID : Int8

    Reserved0 : UInt16

    T_ID : UInt16

    SC_C : Int8

    NAPD : Int8

}
