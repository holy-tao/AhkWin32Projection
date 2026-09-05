#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE_EXTRA_CCD_DATABASE_INFO
     * @type {Integer (Int32)}
     */
    static EXTRA_CCD_DATABASE_INFO => 0

    /**
     * Native name: D3DKMT_ACTIVATE_SPECIFIC_DIAG_TYPE_MODES_PRUNED
     * @type {Integer (Int32)}
     */
    static MODES_PRUNED => 15
}
