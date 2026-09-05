#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class SE_IMAGE_VERIFICATION_CALLBACK_TYPE extends Win32Enum {

    /**
     * Native name: SeImageVerificationCallbackInformational
     * @type {Integer (Int32)}
     */
    static Informational => 0
}
