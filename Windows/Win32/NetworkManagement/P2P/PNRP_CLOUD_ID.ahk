#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PNRP_SCOPE.ahk" { PNRP_SCOPE }

/**
 * The PNRP_CLOUD_ID structure contains the values that define a network cloud.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpdef/ns-pnrpdef-pnrp_cloud_id
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PNRP_CLOUD_ID {
    #StructPack 4

    /**
     * Must be AF_INET6.
     */
    AddressFamily : Int32

    Scope : PNRP_SCOPE

    /**
     * Specifies the ID for this scope.
     */
    ScopeId : UInt32

}
