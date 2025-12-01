#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the callback mode for the CIM extensions for WriteError and PromptUser functions.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_callbackmode
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_CallbackMode extends Win32Enum{

    /**
     * Report the details to the client, but the provider will receive a preconfigured response.  The provider does not wait for the client to receive the request before continuing.
     * @type {Integer (Int32)}
     */
    static MI_CALLBACKMODE_REPORT => 0

    /**
     * Query the  client to determine whether  the provider should continue.
     * @type {Integer (Int32)}
     */
    static MI_CALLBACKMODE_INQUIRE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_CALLBACKMODE_IGNORE => 2
}
