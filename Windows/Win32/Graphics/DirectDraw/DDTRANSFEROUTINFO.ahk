#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDTRANSFEROUTINFO structure returns the polarity of the field being captured.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddtransferoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDTRANSFEROUTINFO {
    #StructPack 4

    /**
     * Specifies the polarity of the field being captured. This value is set to true if the current video field is the even field of an interlaced video signal and false otherwise.
     */
    dwBufferPolarity : UInt32

}
