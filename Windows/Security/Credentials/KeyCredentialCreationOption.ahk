#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the options for creating key credentials.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialcreationoption
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialCreationOption extends Win32Enum{

    /**
     * Replace any existing key credentials.
     * @type {Integer (Int32)}
     */
    static ReplaceExisting => 0

    /**
     * Fail if a key credential already exists.
     * @type {Integer (Int32)}
     */
    static FailIfExists => 1
}
