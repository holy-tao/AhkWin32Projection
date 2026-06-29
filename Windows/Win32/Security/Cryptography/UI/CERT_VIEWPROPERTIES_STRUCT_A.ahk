#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\UI\Controls\PROPSHEETPAGEA.ahk" { PROPSHEETPAGEA }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CERT_VIEWPROPERTIES_STRUCT_FLAGS.ahk" { CERT_VIEWPROPERTIES_STRUCT_FLAGS }

/**
 * The CERT_VIEWPROPERTIES_STRUCT structure defines information used when the CertViewProperties function is called to display a certificate's properties. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The cryptdlg.h header defines CERT_VIEWPROPERTIES_STRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/ns-cryptdlg-cert_viewproperties_struct_a
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @charset ANSI
 */
export default struct CERT_VIEWPROPERTIES_STRUCT_A {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * A handle to the parent window.
     */
    hwndParent : HWND

    /**
     * A handle to the module instance.
     */
    hInstance : HINSTANCE

    dwFlags : CERT_VIEWPROPERTIES_STRUCT_FLAGS

    /**
     * A pointer to a null-terminated string for the title of the user interface.
     */
    szTitle : PSTR

    /**
     * Certificate context for the certificate to be shown.
     */
    pCertContext : CERT_CONTEXT.Ptr

    /**
     * A pointer to an array of null-terminated strings that specify the certificate purposes.
     */
    arrayPurposes : PSTR.Ptr

    /**
     * Number of elements in the <b>arrayPurposes</b> array. If this value is zero, then no trust status is displayed.
     */
    cArrayPurposes : UInt32

    /**
     * Number of elements in the <b>rghstoreRoots</b> array.
     */
    cRootStores : UInt32

    /**
     * Array of Root certificate store handles.
     */
    rghstoreRoots : HCERTSTORE.Ptr

    /**
     * Number of elements in the <b>rghstoreCAs</b> array.
     */
    cStores : UInt32

    /**
     * Array of other certificate store handles.
     */
    rghstoreCAs : HCERTSTORE.Ptr

    /**
     * Number of elements in the <b>rghstoreTrust</b> array.
     */
    cTrustStores : UInt32

    /**
     * Array of trust certificate store handles.
     */
    rghstoreTrust : HCERTSTORE.Ptr

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) to use for verification.
     */
    hprov : IntPtr

    /**
     * Value used for custom data.
     */
    lCustData : LPARAM

    /**
     * Padding location.
     */
    dwPad : UInt32

    /**
     * A pointer to a null-terminated string for the Help file name.
     */
    szHelpFileName : PSTR

    /**
     * ID for the Help file topic.
     */
    dwHelpId : UInt32

    /**
     * Number of the first property page.
     */
    nStartPage : UInt32

    /**
     * Number of elements in the <b>arrayPropSheetPages</b> array.
     */
    cArrayPropSheetPages : UInt32

    /**
     * A pointer to an array of <b>PROPSHEETPAGE</b> structures that specify the property pages.
     */
    arrayPropSheetPages : PROPSHEETPAGEA.Ptr

}
