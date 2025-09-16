#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FUSION_INSTALL_REFERENCE structure contains information about the application which references the side-by-side assembly.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ns-winsxs-fusion_install_reference
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class FUSION_INSTALL_REFERENCE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved, this member must be zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The application  that uses the side-by-side assembly.
     * @type {Pointer<Guid>}
     */
    guidScheme {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a string value that identifies the application that references assembly. The meaning of this identifier depends on the <b>guidScheme</b> parameter.
     * @type {Pointer<PWSTR>}
     */
    szIdentifier {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A string that is used only by the application that reference the assembly.
     * @type {Pointer<PWSTR>}
     */
    szNonCannonicalData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
