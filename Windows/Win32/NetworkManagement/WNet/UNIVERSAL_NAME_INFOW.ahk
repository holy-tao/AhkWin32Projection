#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The UNIVERSAL_NAME_INFO structure contains information about the UNC form of a universal name. It is used by the NPGetUniversalName function. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The winnetwk.h header defines UNIVERSAL_NAME_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-universal_name_infow
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 * @charset Unicode
 */
class UNIVERSAL_NAME_INFOW extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * If the provider supports a universal name, it will return that here.
     * @type {PWSTR}
     */
    lpUniversalName{
        get {
            if(!this.HasProp("__lpUniversalName"))
                this.__lpUniversalName := PWSTR(this.ptr + 0)
            return this.__lpUniversalName
        }
    }
}
