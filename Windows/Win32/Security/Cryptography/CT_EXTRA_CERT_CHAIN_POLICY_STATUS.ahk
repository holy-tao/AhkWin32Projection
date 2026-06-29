#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CT_EXTRA_CERT_CHAIN_POLICY_STATUS {
    #StructPack 4

    cbSize : UInt32 := this.Size

    lErrorStatus : Int32

    lErrorSubStatus : Int32

    cEntries : UInt32

    cValidated : UInt32

}
