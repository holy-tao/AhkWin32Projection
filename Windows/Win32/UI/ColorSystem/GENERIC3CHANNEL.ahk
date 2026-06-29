#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * TBD (GENERIC3CHANNEL)
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-generic3channel
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct GENERIC3CHANNEL {
    #StructPack 2

    /**
     * TBD
     */
    ch1 : UInt16

    /**
     * TBD
     */
    ch2 : UInt16

    /**
     * TBD
     */
    ch3 : UInt16

}
