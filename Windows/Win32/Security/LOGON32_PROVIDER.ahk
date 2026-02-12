#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonusera">LogonUser</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserw">LogonUser</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonusera">LogonUserA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserw">LogonUserA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserexa">LogonUserEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserexw">LogonUserEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserexa">LogonUserExA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserexw">LogonUserExA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserexa">LogonUserExW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserexw">LogonUserExW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonusera">LogonUserW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-logonuserw">LogonUserW</see>.
 * @see 
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class LOGON32_PROVIDER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_WINNT50 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_WINNT40 => 2
}
