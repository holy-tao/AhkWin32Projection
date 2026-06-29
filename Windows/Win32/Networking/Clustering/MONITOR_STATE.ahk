#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RESOURCE_MONITOR_STATE.ahk" { RESOURCE_MONITOR_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The MONITOR_STATE structure is part of the resapi.h header used by Windows Clustering.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-monitor_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct MONITOR_STATE {
    #StructPack 8

    LastUpdate : Int64

    State : RESOURCE_MONITOR_STATE

    ActiveResource : HANDLE

    ResmonStop : BOOL

}
