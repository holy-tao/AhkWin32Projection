#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The FUSION_INSTALL_REFERENCE structure contains information about the application which references the side-by-side assembly.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ns-winsxs-fusion_install_reference
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class FUSION_INSTALL_REFERENCE extends Win32Struct {
    static sizeof => 40

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
     * @type {Guid}
     */
    guidScheme {
        get {
            if(!this.HasProp("__guidScheme"))
                this.__guidScheme := Guid(8, this)
            return this.__guidScheme
        }
    }

    /**
     * A pointer to a string value that identifies the application that references assembly. The meaning of this identifier depends on the <b>guidScheme</b> parameter.
     * @type {PWSTR}
     */
    szIdentifier {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A string that is used only by the application that reference the assembly.
     * @type {PWSTR}
     */
    szNonCannonicalData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
