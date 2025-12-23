#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The STORAGE_RPMB_DESCRIPTOR structure (winioctl.h) describes whether the device contains an RPMB and the max payload size the RPMB supports.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_rpmb_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_RPMB_DESCRIPTOR extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Shall be set to STORAGE_RPMB_DESCRIPTOR_VERSION_1
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Shall be set to sizeof(STORAGE_RPMB_DESCRIPTOR)
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the RPMB, in bytes. 0 if not supported, RPMB size in bytes otherwise.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum amount of data supported in one transaction in bytes. 0 if not supported, minimum 512 bytes.
     * @type {Integer}
     */
    MaxReliableWriteSizeInBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * To support different RPMB frame formats, specifies which frame format the payload will be in so the port driver can take the appropriate action.
     * @type {Integer}
     */
    FrameFormat {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
