#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct BEHAVIOR_RENDER_INFO {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
