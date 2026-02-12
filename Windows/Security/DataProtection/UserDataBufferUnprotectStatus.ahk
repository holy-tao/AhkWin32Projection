#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the unprotect state of the provided buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatabufferunprotectstatus
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataBufferUnprotectStatus extends Win32Enum{

    /**
     * Unprotecting the provided buffer succeeded and the result buffer is available in 'UnprotectedBuffer' member.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * Unprotecting the provided buffer is not possible as the protected data is currently unavailable.
     * @type {Integer (Int32)}
     */
    static Unavailable => 1
}
