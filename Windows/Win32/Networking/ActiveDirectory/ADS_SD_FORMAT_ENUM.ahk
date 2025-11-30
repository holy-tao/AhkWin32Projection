#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADS_SD_FORMAT_ENUM enumeration specifies the format that the security descriptor of an object will be converted to by the IADsSecurityUtility interface.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_sd_format_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SD_FORMAT_ENUM extends Win32Enum{

    /**
     * Indicates that the security descriptor is to be converted to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> interface format. If <b>ADS_SD_FORMAT_IID</b> is used as the input format when setting the security descriptor, the variant passed in is expected to be a VT_DISPATCH, where the dispatch pointer supports the <b>IADsSecurityDescriptor</b> interface.
     * @type {Integer (Int32)}
     */
    static ADS_SD_FORMAT_IID => 1

    /**
     * Indicates that the security descriptor is to be converted to the binary format.
     * @type {Integer (Int32)}
     */
    static ADS_SD_FORMAT_RAW => 2

    /**
     * Indicates that the security descriptor is to be converted to the hex encoded string format.
     * @type {Integer (Int32)}
     */
    static ADS_SD_FORMAT_HEXSTRING => 3
}
