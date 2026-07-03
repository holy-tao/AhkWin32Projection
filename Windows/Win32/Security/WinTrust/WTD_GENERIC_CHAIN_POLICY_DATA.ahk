#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK.ahk" { PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK }
#Import ".\WTD_GENERIC_CHAIN_POLICY_CREATE_INFO.ahk" { WTD_GENERIC_CHAIN_POLICY_CREATE_INFO }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WTD_GENERIC_CHAIN_POLICY_DATA {
    #StructPack 8

    cbStruct : UInt32

    pSignerChainInfo : WTD_GENERIC_CHAIN_POLICY_CREATE_INFO.Ptr

    pCounterSignerChainInfo : WTD_GENERIC_CHAIN_POLICY_CREATE_INFO.Ptr

    pfnPolicyCallback : PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK

    pvPolicyArg : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'cbSize', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
