#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_VIDEO_OUTPUT_SEMANTICS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_VOS_COPP_SEMANTICS => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_VOS_OPM_SEMANTICS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_VOS_OPM_INDIRECT_DISPLAY => 2
}
