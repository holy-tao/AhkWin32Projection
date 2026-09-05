#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ALLOCATIONRESIDENCYSTATUS extends Win32Enum {

    /**
     * Native name: D3DKMT_ALLOCATIONRESIDENCYSTATUS_RESIDENTINGPUMEMORY
     * @type {Integer (Int32)}
     */
    static RESIDENTINGPUMEMORY => 1

    /**
     * Native name: D3DKMT_ALLOCATIONRESIDENCYSTATUS_RESIDENTINSHAREDMEMORY
     * @type {Integer (Int32)}
     */
    static RESIDENTINSHAREDMEMORY => 2

    /**
     * Native name: D3DKMT_ALLOCATIONRESIDENCYSTATUS_NOTRESIDENT
     * @type {Integer (Int32)}
     */
    static NOTRESIDENT => 3
}
