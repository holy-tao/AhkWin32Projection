#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The CERT_VIEWPROPERTIES_STRUCT structure defines information used when the CertViewProperties function is called to display a certificate's properties. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The cryptdlg.h header defines CERT_VIEWPROPERTIES_STRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/ns-cryptdlg-cert_viewproperties_struct_a
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 * @charset ANSI
 */
class CERT_VIEWPROPERTIES_STRUCT_A extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the parent window.
     * @type {Pointer<Ptr>}
     */
    hwndParent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A handle to the module instance.
     * @type {Pointer<Ptr>}
     */
    hInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string for the title of the user interface.
     * @type {Pointer<Ptr>}
     */
    szTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Certificate context for the certificate to be shown.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to an array of null-terminated strings that specify the certificate purposes.
     * @type {Pointer<Ptr>}
     */
    arrayPurposes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Number of elements in the <b>arrayPurposes</b> array. If this value is zero, then no trust status is displayed.
     * @type {Integer}
     */
    cArrayPurposes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of elements in the <b>rghstoreRoots</b> array.
     * @type {Integer}
     */
    cRootStores {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Array of Root certificate store handles.
     * @type {Pointer<Ptr>}
     */
    rghstoreRoots {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Number of elements in the <b>rghstoreCAs</b> array.
     * @type {Integer}
     */
    cStores {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Array of other certificate store handles.
     * @type {Pointer<Ptr>}
     */
    rghstoreCAs {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Number of elements in the <b>rghstoreTrust</b> array.
     * @type {Integer}
     */
    cTrustStores {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Array of trust certificate store handles.
     * @type {Pointer<Ptr>}
     */
    rghstoreTrust {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) to use for verification.
     * @type {Pointer}
     */
    hprov {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Value used for custom data.
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Padding location.
     * @type {Integer}
     */
    dwPad {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A pointer to a null-terminated string for the Help file name.
     * @type {Pointer<Ptr>}
     */
    szHelpFileName {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * ID for the Help file topic.
     * @type {Integer}
     */
    dwHelpId {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Number of the first property page.
     * @type {Integer}
     */
    nStartPage {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Number of elements in the <b>arrayPropSheetPages</b> array.
     * @type {Integer}
     */
    cArrayPropSheetPages {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * A pointer to an array of <b>PROPSHEETPAGE</b> structures that specify the property pages.
     * @type {Pointer<PROPSHEETPAGEA>}
     */
    arrayPropSheetPages {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
