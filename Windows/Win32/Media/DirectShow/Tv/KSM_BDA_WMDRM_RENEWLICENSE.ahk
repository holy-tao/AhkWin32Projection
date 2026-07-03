#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\KernelStreaming\KSM_NODE.ahk" { KSM_NODE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_WMDRM_RENEWLICENSE {
    #StructPack 8

    NodeMethod : KSM_NODE

    ulXMRLicenseLength : UInt32

    ulEntitlementTokenLength : UInt32

    argbDataBuffer : Int8[1]

}
