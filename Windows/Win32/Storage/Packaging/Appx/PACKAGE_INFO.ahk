#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PACKAGE_VERSION.ahk
#Include .\PACKAGE_ID.ahk

/**
 * Represents package identification information that includes the package identifier, full name, and install location.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ns-appmodel-package_info
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PACKAGE_INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * Reserved; do not use.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * Properties of the package.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The location of the package.
     * @type {PWSTR}
     */
    path {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The package full name.
     * @type {PWSTR}
     */
    packageFullName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The package family name.
     * @type {PWSTR}
     */
    packageFamilyName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a></b>
     * 
     * The package identifier (ID).
     * @type {PACKAGE_ID}
     */
    packageId{
        get {
            if(!this.HasProp("__packageId"))
                this.__packageId := PACKAGE_ID(32, this)
            return this.__packageId
        }
    }
}
