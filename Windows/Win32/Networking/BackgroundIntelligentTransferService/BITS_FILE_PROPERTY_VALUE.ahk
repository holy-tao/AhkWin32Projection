#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides the property value of a BITS file.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ns-bits5_0-bits_file_property_value
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BITS_FILE_PROPERTY_VALUE {
    #StructPack 8

    /**
     * This value is used when using the property ID 
     *       enum value <b>BITS_FILE_PROPERTY_ID_HTTP_RESPONSE_HEADERS</b>.
     */
    String : PWSTR

}
