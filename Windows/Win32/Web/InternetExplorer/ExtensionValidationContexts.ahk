#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class ExtensionValidationContexts extends Win32Enum {

    /**
     * Native name: ExtensionValidationContextNone
     * @type {Integer (Int32)}
     */
    static ContextNone => 0

    /**
     * Native name: ExtensionValidationContextDynamic
     * @type {Integer (Int32)}
     */
    static ContextDynamic => 1

    /**
     * Native name: ExtensionValidationContextParsed
     * @type {Integer (Int32)}
     */
    static ContextParsed => 2
}
