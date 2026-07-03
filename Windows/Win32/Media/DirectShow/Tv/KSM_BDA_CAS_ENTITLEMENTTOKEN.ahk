#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\KernelStreaming\KSM_NODE.ahk" { KSM_NODE }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_CAS_ENTITLEMENTTOKEN {
    #StructPack 8

    NodeMethod : KSM_NODE

    ulDialogRequest : UInt32

    cLanguage : CHAR[12]

    ulRequestType : UInt32

    ulEntitlementTokenLen : UInt32

    argbEntitlementToken : Int8[1]

}
