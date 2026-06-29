#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LANA_ENUM structure contains the numbers for the current LAN adapters.
 * @remarks
 * The <b>LANA_ENUM</b> structure is pointed to by the ncb_buffer member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure when an application issues the <b>NCBENUM</b> command. The <b>NCBENUM</b> command is not part of the IBM NetBIOS 3.0 specification.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-lana_enum
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct LANA_ENUM {
    #StructPack 1

    /**
     * Specifies the number of valid entries in the array of LAN adapter numbers.
     */
    length : Int8

    /**
     * Specifies an array of LAN adapter numbers.
     */
    lana : Int8[255]

}
