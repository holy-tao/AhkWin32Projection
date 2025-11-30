#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the aspect ratio for EN 300 294.
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ne-dxva9typ-copp_imageaspectratio_en300294
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_ImageAspectRatio_EN300294 extends Win32Enum{

    /**
     * Full format 4:3.
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_FullFormat4by3 => 0

    /**
     * Box 14:9 center.
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_Box14by9Center => 1

    /**
     * Box 14:9 top.
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_Box14by9Top => 2

    /**
     * Box 16:9 center.
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_Box16by9Center => 3

    /**
     * Box 16:9 top.
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_Box16by9Top => 4

    /**
     * Box &gt; 16:9 center.
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_BoxGT16by9Center => 5

    /**
     * Full format 4:3 (shoot and protect 14:9 center).
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_FullFormat4by3ProtectedCenter => 6

    /**
     * Full format 16:9 (anamorphic)
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_EN300294_FullFormat16by9Anamorphic => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COPP_AspectRatio_ForceDWORD => 2147483647
}
