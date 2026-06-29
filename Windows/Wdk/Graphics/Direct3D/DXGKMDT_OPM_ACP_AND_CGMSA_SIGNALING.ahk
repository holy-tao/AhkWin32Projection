#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_ACP_AND_CGMSA_SIGNALING {
    #StructPack 8

    rnRandomNumber : IntPtr

    ulStatusFlags : UInt32

    ulAvailableTVProtectionStandards : UInt32

    ulActiveTVProtectionStandard : UInt32

    ulReserved : UInt32

    ulAspectRatioValidMask1 : UInt32

    ulAspectRatioData1 : UInt32

    ulAspectRatioValidMask2 : UInt32

    ulAspectRatioData2 : UInt32

    ulAspectRatioValidMask3 : UInt32

    ulAspectRatioData3 : UInt32

    ulReserved2 : UInt32[4]

    ulReserved3 : UInt32[4]

}
