#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Advises the secure processor of the Multimedia Class Scheduler service (MMCSS) parameters so that real-time tasks can be scheduled at the expected priority.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfcontentprotectiondevice_realtimeclient_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCONTENTPROTECTIONDEVICE_REALTIMECLIENT_DATA {
    #StructPack 4

    /**
     * The identifier for the MMCSS task.
     */
    TaskIndex : UInt32

    /**
     * The name of the MMCSS task.
     */
    ClassName : WCHAR[260]

    /**
     * The base priority of the thread that runs the MMCSS task.
     */
    BasePriority : Int32

}
