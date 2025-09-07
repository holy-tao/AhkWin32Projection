#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the aspect ratio for ETSI EN 300 294.
 * @remarks
 * This enumeration is numerically equivalent to the <b>COPP_ImageAspectRatio_EN300294</b> enumeration used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_image_aspect_ratio_en300294
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_IMAGE_ASPECT_RATIO_EN300294{

    /**
     * Full format 4:3.
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3 => 0

    /**
     * Box 14:9 center.
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_CENTER => 1

    /**
     * Box 14:9 top.
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_TOP => 2

    /**
     * Box 16:9 center.
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_CENTER => 3

    /**
     * Box 16:9 top.
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_TOP => 4

    /**
     * Box &gt; 16:9 center.
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_BOX_GT_16_BY_9_CENTER => 5

    /**
     * Full format 4:3 (shoot and protect 14:9 center).
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3_PROTECTED_CENTER => 6

    /**
     * Full format 16:9 (anamorphic).
     * @type {Integer (Int32)}
     */
    static OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_16_BY_9_ANAMORPHIC => 7
}
