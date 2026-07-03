#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\KernelStreaming\KSM_NODE.ahk" { KSM_NODE }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_WMDRMTUNER_PURCHASEENTITLEMENT {
    #StructPack 8

    NodeMethod : KSM_NODE

    ulDialogRequest : UInt32

    cLanguage : CHAR[12]

    ulPurchaseTokenLength : UInt32

    argbDataBuffer : Int8[1]

}
