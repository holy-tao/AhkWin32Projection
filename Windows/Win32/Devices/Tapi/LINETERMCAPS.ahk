#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINETERMCAPS structure describes the capabilities of a line's terminal device. The LINEDEVCAPS structure can contain an array of LINETERMCAPS structures.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linetermcaps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINETERMCAPS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Device type of the terminal. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermdev--constants">LINETERMDEV_ Constants</a>.
     * @type {Integer}
     */
    dwTermDev {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Terminal mode(s) the terminal device is able to deal with. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ Constants</a>.
     * @type {Integer}
     */
    dwTermModes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Sharing modes for the terminal device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermsharing--constants">LINETERMSHARING_ Constants</a>.
     * @type {Integer}
     */
    dwTermSharing {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
