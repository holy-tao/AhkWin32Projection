#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 */
export default struct TPM_WNF_PROVISIONING {
    #StructPack 4

    status : UInt32

    message : Int8[28]

}
