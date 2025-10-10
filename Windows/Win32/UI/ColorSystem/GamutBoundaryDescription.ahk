#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a gamut boundary.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/ns-wcsplugin-gamutboundarydescription
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class GamutBoundaryDescription extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Pointer<PrimaryJabColors>}
     */
    pPrimaries {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of neutral samples.
     * @type {Integer}
     */
    cNeutralSamples {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<JabColorF>}
     */
    pNeutralSamples {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<GamutShell>}
     */
    pReferenceShell {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<GamutShell>}
     */
    pPlausibleShell {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Pointer<GamutShell>}
     */
    pPossibleShell {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
