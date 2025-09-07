#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SAFER_IDENTIFICATION_HEADER.ahk

/**
 * Represents a path identification rule.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_pathname_identification
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_PATHNAME_IDENTIFICATION extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure containing the structure header. The <b>dwIdentificationType</b> member of the header must be <b>SaferIdentityTypeImageName</b>, and the  <b>cbStructSize</b> member of the header must be sizeof(SAFER_PATHNAME_IDENTIFICATION).
     * @type {SAFER_IDENTIFICATION_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := SAFER_IDENTIFICATION_HEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * A description of the path identification rule provided by the user.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * A pointer to a <b>null</b>-terminated wide character string that specifies the fully qualified path and file name to be used for path-based discrimination checks. The image name is also used to open and read the file to identify any other discrimination criteria not supplied in this structure. This member can be set to <b>NULL</b>. If the <b>dwCheckFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure specified by the <b>header</b> member includes SAFER_CRITERIA_AUTHENTICODE, either the <b>hImageFileHandle</b> member or the <b>ImagePath</b> member of the <b>SAFER_IDENTIFICATION_HEADER</b> structure must be set.
     * @type {Pointer<Ptr>}
     */
    ImageName {
        get => NumGet(this, 536, "ptr")
        set => NumPut("ptr", value, this, 536)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwSaferFlags {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }
}
