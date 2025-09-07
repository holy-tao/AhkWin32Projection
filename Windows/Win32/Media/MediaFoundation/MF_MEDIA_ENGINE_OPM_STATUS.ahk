#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the status of the Output Protection Manager (OPM).
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_opm_status
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_OPM_STATUS{

    /**
     * Default status. Used to return the correct status when the content is unprotected.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_OPM_NOT_REQUESTED => 0

    /**
     * OPM successfully established.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_OPM_ESTABLISHED => 1

    /**
     * OPM failed because running in a virtual machined (VM).
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_OPM_FAILED_VM => 2

    /**
     * OPM failed because there is no graphics driver and the system is using Basic Display Adapter (BDA).
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_OPM_FAILED_BDA => 3

    /**
     * OPM failed because the graphics 
 * driver is not PE signed, falling back to WARP.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_OPM_FAILED_UNSIGNED_DRIVER => 4

    /**
     * OPM failed for other reasons.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_OPM_FAILED => 5
}
