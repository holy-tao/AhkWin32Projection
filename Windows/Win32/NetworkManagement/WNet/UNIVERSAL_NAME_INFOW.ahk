#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The UNIVERSAL_NAME_INFO structure contains information about the UNC form of a universal name. It is used by the NPGetUniversalName function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winnetwk.h header defines UNIVERSAL_NAME_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-universal_name_infow
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @charset Unicode
 */
export default struct UNIVERSAL_NAME_INFOW {
    #StructPack 8

    /**
     * If the provider supports a universal name, it will return that here.
     */
    lpUniversalName : PWSTR

}
