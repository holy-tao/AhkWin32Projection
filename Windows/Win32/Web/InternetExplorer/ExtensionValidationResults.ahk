#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ExtensionValidationResults extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationResultNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationResultDoNotInstantiate => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationResultArrestPageLoad => 2
}
