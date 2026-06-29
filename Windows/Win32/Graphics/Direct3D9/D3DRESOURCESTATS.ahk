#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Resource statistics gathered by the D3DDEVINFO\_ResourceManager when using the asynchronous query mechanism.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dresourcestats
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DRESOURCESTATS {
    #StructPack 4

    /**
     * Type: **[**BOOL**](../winprog/windows-data-types.md)**
     * 
     * 
     * Indicates if thrashing is occurring.
     */
    bThrashing : BOOL

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Approximate number of bytes downloaded by the resource manager.
     */
    ApproxBytesDownloaded : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects evicted.
     */
    NumEvicts : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects created in video memory.
     */
    NumVidCreates : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Priority of last object evicted.
     */
    LastPri : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects set to the device.
     */
    NumUsed : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects set to the device, which are already in video memory.
     */
    NumUsedInVidMem : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects in video memory.
     */
    WorkingSet : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of bytes in video memory.
     */
    WorkingSetBytes : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Total number of managed objects.
     */
    TotalManaged : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Total number of bytes of managed objects.
     */
    TotalBytes : UInt32

}
