#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DSPROPERTYPAGEINFO structure is used by an Active Directory property sheet extension to obtain static registration data for the extension. This structure is supplied by the CFSTR_DSPROPERTYPAGEINFO clipboard format.
 * @remarks
 * 
 * The  <b>DSPROPETYPAGEINFO</b> structure contains the optional string that the extension added to the <b>adminPropertySheet</b> and/or <b>shellPropertySheet</b> attributes when the extension was registered. For more information about how this string is set, see <a href="https://docs.microsoft.com/windows/desktop/AD/registering-the-property-page-com-object-in-a-display-specifier">Registering the Property Page COM Object in a Display Specifier</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dsclient/ns-dsclient-dspropertypageinfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSPROPERTYPAGEINFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Contains the offset, in bytes, from the start of the <b>DSPROPERTYPAGEINFO</b> structure to a NULL-terminated, Unicode string that contains the optional data stored for the extension.
     * @type {Integer}
     */
    offsetString {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
