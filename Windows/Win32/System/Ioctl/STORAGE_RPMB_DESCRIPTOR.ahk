#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_RPMB_FRAME_TYPE.ahk" { STORAGE_RPMB_FRAME_TYPE }

/**
 * The STORAGE_RPMB_DESCRIPTOR structure (winioctl.h) describes whether the device contains an RPMB and the max payload size the RPMB supports.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_rpmb_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_RPMB_DESCRIPTOR {
    #StructPack 4

    /**
     * Shall be set to STORAGE_RPMB_DESCRIPTOR_VERSION_1
     */
    Version : UInt32

    /**
     * Shall be set to sizeof(STORAGE_RPMB_DESCRIPTOR)
     */
    Size : UInt32

    /**
     * The size of the RPMB, in bytes. 0 if not supported, RPMB size in bytes otherwise.
     */
    SizeInBytes : UInt32

    /**
     * The maximum amount of data supported in one transaction in bytes. 0 if not supported, minimum 512 bytes.
     */
    MaxReliableWriteSizeInBytes : UInt32

    /**
     * To support different RPMB frame formats, specifies which frame format the payload will be in so the port driver can take the appropriate action.
     */
    FrameFormat : STORAGE_RPMB_FRAME_TYPE

}
