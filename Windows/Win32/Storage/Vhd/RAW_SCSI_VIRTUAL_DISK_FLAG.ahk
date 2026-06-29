#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags affecting the behavior of the RawSCSIVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-raw_scsi_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct RAW_SCSI_VIRTUAL_DISK_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static RAW_SCSI_VIRTUAL_DISK_FLAG_NONE => 0
}
