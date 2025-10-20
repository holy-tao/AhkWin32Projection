#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents package settings used to create a package.
 * @remarks
 * 
  * Set <b>forceZip32</b> to <b>TRUE</b> to maintain compatibility with older ZIP tools.
  * 
  * The possible values for <b>hashMethod</b> are: <ul>
  * <li>http://www.w3.org/2001/04/xmlenc#sha256</li>
  * <li>http://www.w3.org/2001/04/xmldsig-more#sha384</li>
  * <li>http://www.w3.org/2001/04/xmlenc#sha512</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ns-appxpackaging-appx_package_settings
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGE_SETTINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the package is created as Zip32; <b>FALSE</b> if the package is created as Zip64. The default is Zip64.
     * @type {BOOL}
     */
    forceZip32 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><b>IUri</b>*</b>
     * 
     * The hash algorithm URI to use for the block map of the package.
     * @type {IUri}
     */
    hashMethod {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
