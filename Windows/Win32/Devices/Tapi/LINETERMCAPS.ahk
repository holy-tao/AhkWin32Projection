#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINETERMCAPS structure describes the capabilities of a line's terminal device. The LINEDEVCAPS structure can contain an array of LINETERMCAPS structures.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linetermcaps
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINETERMCAPS {
    #StructPack 4

    /**
     * Device type of the terminal. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermdev--constants">LINETERMDEV_ Constants</a>.
     */
    dwTermDev : UInt32

    /**
     * Terminal mode(s) the terminal device is able to deal with. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ Constants</a>.
     */
    dwTermModes : UInt32

    /**
     * Sharing modes for the terminal device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermsharing--constants">LINETERMSHARING_ Constants</a>.
     */
    dwTermSharing : UInt32

}
