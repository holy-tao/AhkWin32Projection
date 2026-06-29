#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TfSapiObject enumeration are used with the ITfFnGetSAPIObject::Get method to specify a specific type of Speech API (SAPI) object.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tfsapiobject
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TfSapiObject {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
