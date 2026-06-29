#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the registry key and value names associated with the installable driver.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/ns-mmiscapi-drvconfiginfo
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct DRVCONFIGINFO {
    #StructPack 8

    /**
     * Size of the structure, in bytes.
     */
    dwDCISize : UInt32

    /**
     * Address of a null-terminated, wide-character string specifying the name of the registry key associated with the driver.
     */
    lpszDCISectionName : PWSTR

    /**
     * Address of a null-terminated, wide-character string specifying the name of the registry value associated with the driver.
     */
    lpszDCIAliasName : PWSTR

}
