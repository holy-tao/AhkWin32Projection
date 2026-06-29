#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_SVCB_PARAM_IPV6.ahk" { DNS_SVCB_PARAM_IPV6 }
#Import ".\DNS_SVCB_PARAM_MANDATORY.ahk" { DNS_SVCB_PARAM_MANDATORY }
#Import ".\DNS_SVCB_PARAM_ALPN.ahk" { DNS_SVCB_PARAM_ALPN }
#Import ".\DNS_SVCB_PARAM_IPV4.ahk" { DNS_SVCB_PARAM_IPV4 }
#Import ".\DNS_SVCB_PARAM_UNKNOWN.ahk" { DNS_SVCB_PARAM_UNKNOWN }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_PARAM {
    #StructPack 8

    wSvcParamKey : UInt16

    pIpv4Hints : DNS_SVCB_PARAM_IPV4.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pIpv6Hints', { type: DNS_SVCB_PARAM_IPV6.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pMandatory', { type: DNS_SVCB_PARAM_MANDATORY.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pAlpn', { type: DNS_SVCB_PARAM_ALPN.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'wPort', { type: UInt16, offset: 8 })
        DefineProp(this.Prototype, 'pUnknown', { type: DNS_SVCB_PARAM_UNKNOWN.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pszDohPath', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'pReserved', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
