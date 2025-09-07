#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the audio service contained in a Dolby Digital audio stream. This enumeration is used with the AVEncDDService property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddservice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncDDService{

    /**
     * Complete main audio service.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_CM => 0

    /**
     * Main service: music and effects. (The main audio service minus the dialog channel.)
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_ME => 1

    /**
     * Associated service: visually impaired.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_VI => 2

    /**
     * Associated service: hard of hearing.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_HI => 3

    /**
     * Associated service: dialog.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_D => 4

    /**
     * Associated service: commentary.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_C => 5

    /**
     * Associated service: emergency.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_E => 6

    /**
     * Associated service: voice over.
     * @type {Integer (Int32)}
     */
    static eAVEncDDService_VO => 7
}
