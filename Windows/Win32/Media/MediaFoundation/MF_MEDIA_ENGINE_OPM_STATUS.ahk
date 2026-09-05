#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the status of the Output Protection Manager (OPM).
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_opm_status
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_OPM_STATUS extends Win32Enum {

    /**
     * Default status. Used to return the correct status when the content is unprotected.
     * Native name: MF_MEDIA_ENGINE_OPM_NOT_REQUESTED
     * @type {Integer (Int32)}
     */
    static NOT_REQUESTED => 0

    /**
     * OPM successfully established.
     * Native name: MF_MEDIA_ENGINE_OPM_ESTABLISHED
     * @type {Integer (Int32)}
     */
    static ESTABLISHED => 1

    /**
     * OPM failed because running in a virtual machined (VM).
     * Native name: MF_MEDIA_ENGINE_OPM_FAILED_VM
     * @type {Integer (Int32)}
     */
    static FAILED_VM => 2

    /**
     * OPM failed because there is no graphics driver and the system is using Basic Display Adapter (BDA).
     * Native name: MF_MEDIA_ENGINE_OPM_FAILED_BDA
     * @type {Integer (Int32)}
     */
    static FAILED_BDA => 3

    /**
     * OPM failed because the graphics 
     * driver is not PE signed, falling back to WARP.
     * Native name: MF_MEDIA_ENGINE_OPM_FAILED_UNSIGNED_DRIVER
     * @type {Integer (Int32)}
     */
    static FAILED_UNSIGNED_DRIVER => 4

    /**
     * OPM failed for other reasons.
     * Native name: MF_MEDIA_ENGINE_OPM_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 5
}
