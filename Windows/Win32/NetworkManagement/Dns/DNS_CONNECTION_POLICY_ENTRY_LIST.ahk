#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_CONNECTION_POLICY_ENTRY.ahk" { DNS_CONNECTION_POLICY_ENTRY }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_POLICY_ENTRY_LIST {
    #StructPack 8

    pPolicyEntries : DNS_CONNECTION_POLICY_ENTRY.Ptr

    nEntries : UInt32

}
