#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import "..\Cryptography\CMSG_SIGNER_INFO.ahk" { CMSG_SIGNER_INFO }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO {
    #StructPack 8

    cbStruct : UInt32

    pChainContext : CERT_CHAIN_CONTEXT.Ptr

    dwSignerType : UInt32

    pMsgSignerInfo : CMSG_SIGNER_INFO.Ptr

    dwError : UInt32

    cCounterSigner : UInt32

    rgpCounterSigner : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'cbSize', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
