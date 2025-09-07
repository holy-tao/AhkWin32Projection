#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WMDMDATETIME.ahk

/**
 * The WMDMRIGHTS structure describes content-use rights.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmrights
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDMRIGHTS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwContentType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

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
     * @type {Integer}
     */
    fuFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    fuRights {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Byte array that specifies the minimum level of application security.
     * @type {Integer}
     */
    dwAppSec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwPlaybackCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * [**WMDMDATETIME**](wmdmdatetime.md) structure containing the expiration date and time for the content. If the license has no expiration date, the **wYear** member is set to 0xFFFF, and all other members of **WMDMDATETIME** are ignored.
     * @type {WMDMDATETIME}
     */
    ExpirationDate{
        get {
            if(!this.HasProp("__ExpirationDate"))
                this.__ExpirationDate := WMDMDATETIME(this.ptr + 24)
            return this.__ExpirationDate
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
