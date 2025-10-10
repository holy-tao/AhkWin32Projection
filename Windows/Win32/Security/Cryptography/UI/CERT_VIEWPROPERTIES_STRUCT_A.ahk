#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 * @charset ANSI
 */
class CERT_VIEWPROPERTIES_STRUCT_A extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    hwndParent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    hInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Byte>}
     */
    szTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Byte>}
     */
    arrayPurposes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cArrayPurposes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    cRootStores {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Pointer<Void>}
     */
    rghstoreRoots {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    cStores {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<Void>}
     */
    rghstoreCAs {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    cTrustStores {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer<Void>}
     */
    rghstoreTrust {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    hprov {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    dwPad {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Pointer<Byte>}
     */
    szHelpFileName {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    dwHelpId {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    nStartPage {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    cArrayPropSheetPages {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Pointer<PROPSHEETPAGEA>}
     */
    arrayPropSheetPages {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
