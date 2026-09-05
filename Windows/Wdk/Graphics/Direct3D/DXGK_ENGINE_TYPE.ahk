#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_ENGINE_TYPE extends Win32Enum {

    /**
     * Native name: DXGK_ENGINE_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * Native name: DXGK_ENGINE_TYPE_3D
     * @type {Integer (Int32)}
     */
    static 3D => 1

    /**
     * Native name: DXGK_ENGINE_TYPE_VIDEO_DECODE
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODE => 2

    /**
     * Native name: DXGK_ENGINE_TYPE_VIDEO_ENCODE
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODE => 3

    /**
     * Native name: DXGK_ENGINE_TYPE_VIDEO_PROCESSING
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESSING => 4

    /**
     * Native name: DXGK_ENGINE_TYPE_SCENE_ASSEMBLY
     * @type {Integer (Int32)}
     */
    static SCENE_ASSEMBLY => 5

    /**
     * Native name: DXGK_ENGINE_TYPE_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 6

    /**
     * Native name: DXGK_ENGINE_TYPE_OVERLAY
     * @type {Integer (Int32)}
     */
    static OVERLAY => 7

    /**
     * Native name: DXGK_ENGINE_TYPE_CRYPTO
     * @type {Integer (Int32)}
     */
    static CRYPTO => 8

    /**
     * Native name: DXGK_ENGINE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 9
}
