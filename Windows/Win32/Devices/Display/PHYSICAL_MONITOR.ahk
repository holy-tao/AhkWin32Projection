#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains a handle and text description corresponding to a physical monitor.
 * @remarks
 * A physical monitor description is always an array of 128 characters.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/ns-physicalmonitorenumerationapi-physical_monitor
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PHYSICAL_MONITOR {
    #StructPack 8

    /**
     * Handle to the physical monitor.
     */
    hPhysicalMonitor : HANDLE

    /**
     * Text description of the physical monitor.
     */
    szPhysicalMonitorDescription : WCHAR[128]

}
