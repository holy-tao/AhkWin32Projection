#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_CONNECTION_PROXY_INFO_SWITCH.ahk" { DNS_CONNECTION_PROXY_INFO_SWITCH }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_PROXY_INFO {
    #StructPack 8


    struct _DNS_CONNECTION_PROXY_INFO_CONFIG {
        pwszServer : PWSTR

        pwszUsername : PWSTR

        pwszPassword : PWSTR

        pwszException : PWSTR

        pwszExtraInfo : PWSTR

        Port : UInt16

    }

    struct _DNS_CONNECTION_PROXY_INFO_SCRIPT {
        pwszScript : PWSTR

        pwszUsername : PWSTR

        pwszPassword : PWSTR

    }

    Version : UInt32

    pwszFriendlyName : PWSTR

    Flags : UInt32

    Switch : DNS_CONNECTION_PROXY_INFO_SWITCH

    Config : DNS_CONNECTION_PROXY_INFO._DNS_CONNECTION_PROXY_INFO_CONFIG

    static __New() {
        DefineProp(this.Prototype, 'Script', { type: DNS_CONNECTION_PROXY_INFO._DNS_CONNECTION_PROXY_INFO_SCRIPT, offset: 24 })
        this.DeleteProp("__New")
    }
}
