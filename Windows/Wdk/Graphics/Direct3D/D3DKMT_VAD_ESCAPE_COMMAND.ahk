#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_VAD_ESCAPE_COMMAND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GETNUMVADS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GETVAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GETVADRANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GET_PTE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GET_GPUMMU_CAPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VAD_ESCAPE_GET_SEGMENT_CAPS => 5
}
