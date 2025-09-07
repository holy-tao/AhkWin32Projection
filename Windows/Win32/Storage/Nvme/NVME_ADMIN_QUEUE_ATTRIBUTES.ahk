#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the Admin Queue Attributes (AQA) for the Admin Submission Queue and Admin Completion Queue.
 * @remarks
 * > [!NOTE]
  * > A Unified Extensible Firmware Interface (UEFI) should be used during boot operations. In low memory environments (like Option ROMs in legacy BIOS environments) there may
  * > not be sufficient available memory to allocate the necessary Submission and Completion Queues. In these types of conditions, low memory operation of the controller is
  * > vendor specific.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_admin_queue_attributes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ADMIN_QUEUE_ATTRIBUTES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
