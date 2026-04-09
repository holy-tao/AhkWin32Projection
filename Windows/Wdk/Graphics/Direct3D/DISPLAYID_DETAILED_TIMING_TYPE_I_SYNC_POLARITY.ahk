#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DISPLAYID_DETAILED_TIMING_TYPE_I_SYNC_POLARITY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_Sync_Positive => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_Sync_Negative => 1
}
