#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class KBDTABLES extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<MODIFIERS>}
     */
    pCharModifiers {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<VK_TO_WCHAR_TABLE>}
     */
    pVkToWcharTable {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DEADKEY>}
     */
    pDeadKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<VSC_LPWSTR>}
     */
    pKeyNames {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<VSC_LPWSTR>}
     */
    pKeyNamesExt {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pKeyNamesDead {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    pusVSCtoVK {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    bMaxVSCtoVK {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {Pointer<VSC_VK>}
     */
    pVSCtoVK_E0 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<VSC_VK>}
     */
    pVSCtoVK_E1 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    fLocaleFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    nLgMax {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    cbLgEntry {
        get => NumGet(this, 85, "char")
        set => NumPut("char", value, this, 85)
    }

    /**
     * @type {Pointer<LIGATURE1>}
     */
    pLigature {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwSubType {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
