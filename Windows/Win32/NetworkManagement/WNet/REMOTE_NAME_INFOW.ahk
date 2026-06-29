#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The REMOTE_NAME_INFO structure contains information about the remote form of a universal name. It is used by the NPGetUniversalName function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winnetwk.h header defines REMOTE_NAME_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-remote_name_infow
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @charset Unicode
 */
export default struct REMOTE_NAME_INFOW {
    #StructPack 8

    /**
     * Pointer to the universal name if the provider supports universal names. Otherwise, this points to <b>NULL</b>.
     */
    lpUniversalName : PWSTR

    /**
     * Pointer to a string containing the remote name used to make the connection. This string does not have a trailing backslash.
     */
    lpConnectionName : PWSTR

    /**
     * Pointer to the remaining path that must to be concatenated to a drive letter after a connection is established by means of <b>lpConnectionName</b>, to refer to the object specified during the call to <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npgetuniversalname">NPGetUniversalName</a>. This string has a backslash at the start of the path.
     */
    lpRemainingPath : PWSTR

}
