#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_FAXNUMBER structure is an ADSI representation of the Facsimile Telephone Number attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_faxnumber
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_FAXNUMBER {
    #StructPack 8

    /**
     * The null-terminated Unicode string value that contains the telephone number of the facsimile (fax) machine.
     */
    TelephoneNumber : PWSTR

    /**
     * The number of data bits.
     */
    NumberOfBits : UInt32

    /**
     * Optional parameters for the fax machine.
     */
    Parameters : IntPtr

}
