#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Advises the secure processor of the Multimedia Class Scheduler service (MMCSS) parameters so that real-time tasks can be scheduled at the expected priority.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mfcontentprotectiondevice_realtimeclient_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCONTENTPROTECTIONDEVICE_REALTIMECLIENT_DATA extends Win32Struct
{
    static sizeof => 528

    static packingSize => 4

    /**
     * The identifier for the MMCSS task.
     * @type {Integer}
     */
    TaskIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the MMCSS task.
     * @type {String}
     */
    ClassName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * The base priority of the thread that runs the MMCSS task.
     * @type {Integer}
     */
    BasePriority {
        get => NumGet(this, 524, "int")
        set => NumPut("int", value, this, 524)
    }
}
