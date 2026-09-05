#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class ExtensionValidationResults extends Win32Enum {

    /**
     * Native name: ExtensionValidationResultNone
     * @type {Integer (Int32)}
     */
    static ResultNone => 0

    /**
     * Native name: ExtensionValidationResultDoNotInstantiate
     * @type {Integer (Int32)}
     */
    static ResultDoNotInstantiate => 1

    /**
     * Native name: ExtensionValidationResultArrestPageLoad
     * @type {Integer (Int32)}
     */
    static ResultArrestPageLoad => 2
}
