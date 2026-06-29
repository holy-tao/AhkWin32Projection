#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PS_TRUSTLET_TKSESSION_ID.ahk" { PS_TRUSTLET_TKSESSION_ID }

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct TRUSTLET_BINDING_DATA {
    #StructPack 8

    TrustletIdentity : Int64

    TrustletSessionId : PS_TRUSTLET_TKSESSION_ID

    TrustletSvn : UInt32

    Reserved1 : UInt32

    Reserved2 : Int64

}
