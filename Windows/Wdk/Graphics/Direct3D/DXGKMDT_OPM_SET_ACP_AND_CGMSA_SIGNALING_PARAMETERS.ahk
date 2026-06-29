#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS {
    #StructPack 4

    ulNewTVProtectionStandard : UInt32

    ulAspectRatioChangeMask1 : UInt32

    ulAspectRatioData1 : UInt32

    ulAspectRatioChangeMask2 : UInt32

    ulAspectRatioData2 : UInt32

    ulAspectRatioChangeMask3 : UInt32

    ulAspectRatioData3 : UInt32

    ulReserved : UInt32[4]

    ulReserved2 : UInt32[4]

    ulReserved3 : UInt32

}
