#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VAD_ESCAPE_COMMAND extends Win32Enum {

    /**
     * Native name: D3DKMT_VAD_ESCAPE_GETNUMVADS
     * @type {Integer (Int32)}
     */
    static GETNUMVADS => 0

    /**
     * Native name: D3DKMT_VAD_ESCAPE_GETVAD
     * @type {Integer (Int32)}
     */
    static GETVAD => 1

    /**
     * Native name: D3DKMT_VAD_ESCAPE_GETVADRANGE
     * @type {Integer (Int32)}
     */
    static GETVADRANGE => 2

    /**
     * Native name: D3DKMT_VAD_ESCAPE_GET_PTE
     * @type {Integer (Int32)}
     */
    static GET_PTE => 3

    /**
     * Native name: D3DKMT_VAD_ESCAPE_GET_GPUMMU_CAPS
     * @type {Integer (Int32)}
     */
    static GET_GPUMMU_CAPS => 4

    /**
     * Native name: D3DKMT_VAD_ESCAPE_GET_SEGMENT_CAPS
     * @type {Integer (Int32)}
     */
    static GET_SEGMENT_CAPS => 5
}
