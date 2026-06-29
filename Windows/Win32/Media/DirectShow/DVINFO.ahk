#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DVINFO structure describes the format of a digital video (DV) stream.
 * @remarks
 * The AAUX and VAUX packs are defined in IEC 61834-4.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVINFO {
    #StructPack 4

    /**
     * Specifies the audio auxiliary (AAUX) source pack for the first audio block.
     */
    dwDVAAuxSrc : UInt32

    /**
     * Specifies the AAUX source control Pack for the first audio block.
     */
    dwDVAAuxCtl : UInt32

    /**
     * Specifies the AAUX source pack for the second audio block.
     */
    dwDVAAuxSrc1 : UInt32

    /**
     * Specifies the AAUX source control pack for the second audio block.
     */
    dwDVAAuxCtl1 : UInt32

    /**
     * Specifies the video auxiliary (VAUX) source pack.
     */
    dwDVVAuxSrc : UInt32

    /**
     * Specifies the VAUX source control pack.
     */
    dwDVVAuxCtl : UInt32

    /**
     * Reserved. Set this array to zero.
     */
    dwDVReserved : UInt32[2]

}
