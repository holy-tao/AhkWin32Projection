#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSM_NODE.ahk" { KSM_NODE }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
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
