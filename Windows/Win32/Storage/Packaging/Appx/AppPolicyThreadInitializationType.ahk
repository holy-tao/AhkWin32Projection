#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyThreadInitializationType enumeration indicates the kind of initialization that should be automatically performed for a process when beginthread[ex] creates a thread.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicythreadinitializationtype
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AppPolicyThreadInitializationType extends Win32Enum {

    /**
     * Indicates that no initialization should be performed.
     * Native name: AppPolicyThreadInitializationType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates that Windows Runtime initialization should be performed.
     * Native name: AppPolicyThreadInitializationType_InitializeWinRT
     * @type {Integer (Int32)}
     */
    static InitializeWinRT => 1
}
