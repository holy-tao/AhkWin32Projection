#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the audio service contained in a Dolby Digital audio stream. This enumeration is used with the AVEncDDService property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddservice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDService extends Win32Enum {

    /**
     * Complete main audio service.
     * Native name: eAVEncDDService_CM
     * @type {Integer (Int32)}
     */
    static CM => 0

    /**
     * Main service: music and effects. (The main audio service minus the dialog channel.)
     * Native name: eAVEncDDService_ME
     * @type {Integer (Int32)}
     */
    static ME => 1

    /**
     * Associated service: visually impaired.
     * Native name: eAVEncDDService_VI
     * @type {Integer (Int32)}
     */
    static VI => 2

    /**
     * Associated service: hard of hearing.
     * Native name: eAVEncDDService_HI
     * @type {Integer (Int32)}
     */
    static HI => 3

    /**
     * Associated service: dialog.
     * Native name: eAVEncDDService_D
     * @type {Integer (Int32)}
     */
    static D => 4

    /**
     * Associated service: commentary.
     * Native name: eAVEncDDService_C
     * @type {Integer (Int32)}
     */
    static C => 5

    /**
     * Associated service: emergency.
     * Native name: eAVEncDDService_E
     * @type {Integer (Int32)}
     */
    static E => 6

    /**
     * Associated service: voice over.
     * Native name: eAVEncDDService_VO
     * @type {Integer (Int32)}
     */
    static VO => 7
}
