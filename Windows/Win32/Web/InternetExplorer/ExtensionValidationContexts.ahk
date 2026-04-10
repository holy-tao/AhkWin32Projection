#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class ExtensionValidationContexts extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationContextNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationContextDynamic => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExtensionValidationContextParsed => 2
}
