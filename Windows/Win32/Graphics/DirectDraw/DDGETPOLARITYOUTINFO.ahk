#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDGETPOLARITYOUTINFO structure contains the polarity information of the video port extensions (VPE) object.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddgetpolarityoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDGETPOLARITYOUTINFO {
    #StructPack 4

    /**
     * Indicates the polarity (even or odd) of the current field being written by the VPE object. A value of 0x00000001 indicates even, 0x00000000 indicates odd.
     */
    bPolarity : UInt32

}
