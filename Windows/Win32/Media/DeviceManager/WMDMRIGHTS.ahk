#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WMDMDATETIME.ahk" { WMDMDATETIME }

/**
 * The WMDMRIGHTS structure describes content-use rights.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmrights
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDMRIGHTS {
    #StructPack 4

    /**
     * Size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    dwContentType : UInt32

    /**
     * Bit field specifying the rights options in use for the content.
     * 
     * 
     * 
     * | Value                        | Description                                  |
     * |------------------------------|----------------------------------------------|
     * | WMDM\_RIGHTS\_PLAYBACKCOUNT  | Number of times that the file can be played. |
     * | WMDM\_RIGHTS\_EXPIRATIONDATE | Expiration date of the file.                 |
     * | WMDM\_RIGHTS\_FREESERIALIDS  | Free serial identifier of the file.          |
     * | WMDM\_RIGHTS\_GROUPID Group  | Identifier of the file.                      |
     * | WMDM\_RIGHTS\_NAMEDSERIALIDS | Named serial identifier of the file.         |
     */
    fuFlags : UInt32

    /**
     * Bit field containing the rights bits for the content.
     * 
     * 
     * 
     * | Value                                     | Description                                   |
     * |-------------------------------------------|-----------------------------------------------|
     * | WMDM\_RIGHTS\_PLAY\_ON\_PC                | Content can be played on a personal computer. |
     * | WMDM\_RIGHTS\_COPY\_TO\_NON\_SDMI\_DEVICE | Content can be copied to a non-SDMI device.   |
     * | WMDM\_RIGHTS\_COPY\_TO\_CD                | Content can be copied to a CD.                |
     * | WMDM\_RIGHTS\_COPY\_TO\_SDMI\_DEVICE      | Content can be copied to an SDMI device.      |
     */
    fuRights : UInt32

    /**
     * Byte array that specifies the minimum level of application security.
     */
    dwAppSec : UInt32

    dwPlaybackCount : UInt32

    /**
     * [**WMDMDATETIME**](wmdmdatetime.md) structure containing the expiration date and time for the content. If the license has no expiration date, the **wYear** member is set to 0xFFFF, and all other members of **WMDMDATETIME** are ignored.
     */
    ExpirationDate : WMDMDATETIME

}
