#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\HCERTCHAINENGINE.ahk" { HCERTCHAINENGINE }
#Import "..\Cryptography\CERT_CHAIN_PARA.ahk" { CERT_CHAIN_PARA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WTD_GENERIC_CHAIN_POLICY_CREATE_INFO {
    #StructPack 8

    cbStruct : UInt32

    hChainEngine : HCERTCHAINENGINE

    pChainPara : CERT_CHAIN_PARA.Ptr

    dwFlags : UInt32

    pvReserved : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'cbSize', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
