#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HYPOTHESIS structure contains data used to submit a hypothesis to NDF for another helper class.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-hypothesis
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class HYPOTHESIS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * A pointer to a null-terminated string that contains the name of the helper class.
     * @type {Pointer<Char>}
     */
    pwszClassName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * A  pointer to a null-terminated string that contains a user-friendly description of the data being passed to the helper class..
     * @type {Pointer<Char>}
     */
    pwszDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The count of attributes in this hypothesis.
     * @type {Integer}
     */
    celt {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>[size_is(celt)]PHELPER_ATTRIBUTE[ ]</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> structures that contains key attributes for this hypothesis.
     * @type {Pointer<HELPER_ATTRIBUTE>}
     */
    rgAttributes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
