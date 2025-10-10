#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TfSapiObject enumeration are used with the ITfFnGetSAPIObject::Get method to specify a specific type of Speech API (SAPI) object.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/ne-ctffunc-tfsapiobject
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfSapiObject{

    /**
     * Specifies an ISpResourceManager object.
     * @type {Integer (Int32)}
     */
    static GETIF_RESMGR => 0

    /**
     * Specifies an ISpRecoContext object.
     * @type {Integer (Int32)}
     */
    static GETIF_RECOCONTEXT => 1

    /**
     * Specifies an ISpRecognizer object.
     * @type {Integer (Int32)}
     */
    static GETIF_RECOGNIZER => 2

    /**
     * Specifies an ISpVoice object.
     * @type {Integer (Int32)}
     */
    static GETIF_VOICE => 3

    /**
     * Specifies an ISpRecoGrammar object.
     * @type {Integer (Int32)}
     */
    static GETIF_DICTGRAM => 4

    /**
     * Specifies an ISpRecognizer object. SAPI will not be initialized if it is not already.
     * @type {Integer (Int32)}
     */
    static GETIF_RECOGNIZERNOINIT => 5
}
