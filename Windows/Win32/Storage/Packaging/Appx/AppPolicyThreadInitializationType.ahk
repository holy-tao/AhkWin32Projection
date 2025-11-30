#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyThreadInitializationType enumeration indicates the kind of initialization that should be automatically performed for a process when beginthread[ex] creates a thread.
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ne-appmodel-apppolicythreadinitializationtype
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyThreadInitializationType extends Win32Enum{

    /**
     * Indicates that no initialization should be performed.
     * @type {Integer (Int32)}
     */
    static AppPolicyThreadInitializationType_None => 0

    /**
     * Indicates that Windows Runtime initialization should be performed.
     * @type {Integer (Int32)}
     */
    static AppPolicyThreadInitializationType_InitializeWinRT => 1
}
