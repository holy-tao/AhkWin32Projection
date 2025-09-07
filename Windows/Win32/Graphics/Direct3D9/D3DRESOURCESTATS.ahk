#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Resource statistics gathered by the D3DDEVINFO\_ResourceManager when using the asynchronous query mechanism.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dresourcestats
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRESOURCESTATS extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Type: **[**BOOL**](../winprog/windows-data-types.md)**
     * 
     * 
     * Indicates if thrashing is occurring.
     * @type {Integer}
     */
    bThrashing {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Approximate number of bytes downloaded by the resource manager.
     * @type {Integer}
     */
    ApproxBytesDownloaded {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects evicted.
     * @type {Integer}
     */
    NumEvicts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects created in video memory.
     * @type {Integer}
     */
    NumVidCreates {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Priority of last object evicted.
     * @type {Integer}
     */
    LastPri {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects set to the device.
     * @type {Integer}
     */
    NumUsed {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects set to the device, which are already in video memory.
     * @type {Integer}
     */
    NumUsedInVidMem {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of objects in video memory.
     * @type {Integer}
     */
    WorkingSet {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of bytes in video memory.
     * @type {Integer}
     */
    WorkingSetBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Total number of managed objects.
     * @type {Integer}
     */
    TotalManaged {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Total number of bytes of managed objects.
     * @type {Integer}
     */
    TotalBytes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
