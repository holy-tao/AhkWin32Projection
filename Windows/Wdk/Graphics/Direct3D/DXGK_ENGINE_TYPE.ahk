#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_ENGINE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_3D => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_VIDEO_DECODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_VIDEO_ENCODE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_VIDEO_PROCESSING => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_SCENE_ASSEMBLY => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_COPY => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_OVERLAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_CRYPTO => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_ENGINE_TYPE_MAX => 9
}
