#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information used when loading or unloading a user profile. (Unicode)
 * @remarks
 * Do not use environment variables when specifying a path. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-loaduserprofilea">LoadUserProfile</a> function does not expand environment variables, such as %username%, in a path.
 * 
 * When the <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-loaduserprofilea">LoadUserProfile</a> call returns successfully, the <b>hProfile</b> member receives a registry key handle opened to the root of the user's subtree, opened with full access (KEY_ALL_ACCESS). For more information see the Remarks sections in <b>LoadUserProfile</b>, 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-hives">Registry Hives</a>.
 * 
 * Services and applications that call <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-loaduserprofilea">LoadUserProfile</a> should check to see if the user has a roaming profile. If the user has a roaming profile, specify its path as the <b>lpProfilePath</b> member of this structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The profinfo.h header defines PROFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/profinfo/ns-profinfo-profileinfow
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 */
export default struct PROFILEINFOW {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * This member can be one of the following flags:
     */
    dwFlags : UInt32

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to the name of the user. This member is used as the base name of the directory in which to store a new profile.
     */
    lpUserName : PWSTR

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776897(v=vs.85)">roaming user profile</a> path. If the user does not have a roaming profile, this member can be <b>NULL</b>. To retrieve the user's roaming profile path, call the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> function, specifying information level 3 or 4. For more information, see Remarks.
     */
    lpProfilePath : PWSTR

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to the default user profile path. This member can be <b>NULL</b>.
     */
    lpDefaultPath : PWSTR

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to the name of the validating domain controller, in NetBIOS format.
     */
    lpServerName : PWSTR

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Not used, set to <b>NULL</b>.
     */
    lpPolicyPath : PWSTR

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the <b>HKEY_CURRENT_USER</b> registry subtree. For more information, see Remarks.
     */
    hProfile : HANDLE

}
