#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class BEHAVIOR_RENDER_INFO{

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_BEFOREBACKGROUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_AFTERBACKGROUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_BEFORECONTENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_AFTERCONTENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_AFTERFOREGROUND => 32

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_ABOVECONTENT => 40

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_ALLLAYERS => 255

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_DISABLEBACKGROUND => 256

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_DISABLENEGATIVEZ => 512

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_DISABLECONTENT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_DISABLEPOSITIVEZ => 2048

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_DISABLEALLLAYERS => 3840

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_HITTESTING => 4096

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_SURFACE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORRENDERINFO_3DSURFACE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_RENDER_INFO_Max => 2147483647
}
