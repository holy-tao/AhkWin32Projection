#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_OFFLOAD_TOKEN.ahk

/**
 * Specifies parameters for the offload write operation.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_dsm_offload_write_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DSM_OFFLOAD_WRITE_PARAMETERS extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * Set to 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The starting offset to copy from the range bound to the token
     * @type {Integer}
     */
    TokenOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_offload_token">STORAGE_OFFLOAD_TOKEN</a> structure containing 
     *       the token returned from the offload read operation.
     * @type {STORAGE_OFFLOAD_TOKEN}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := STORAGE_OFFLOAD_TOKEN(16, this)
            return this.__Token
        }
    }
}
