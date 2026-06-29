#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_POLICY_ENTRY {
    #StructPack 8

    pwszHost : PWSTR

    pwszAppId : PWSTR

    cbAppSid : UInt32

    pbAppSid : IntPtr

    nConnections : UInt32

    ppwszConnections : PWSTR.Ptr

    dwPolicyEntryFlags : UInt32

}
