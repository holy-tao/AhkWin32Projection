#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct ENCLAVE_VBS_BASIC_KEY_REQUEST {
    #StructPack 4

    RequestSize : UInt32

    Flags : UInt32

    EnclaveSVN : UInt32

    SystemKeyID : UInt32

    CurrentSystemKeyID : UInt32

}
