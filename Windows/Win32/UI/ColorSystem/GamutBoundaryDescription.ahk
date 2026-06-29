#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PrimaryJabColors.ahk" { PrimaryJabColors }
#Import ".\GamutShell.ahk" { GamutShell }
#Import ".\JabColorF.ahk" { JabColorF }

/**
 * Defines a gamut boundary.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-gamutboundarydescription
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct GamutBoundaryDescription {
    #StructPack 8

    pPrimaries : PrimaryJabColors.Ptr

    /**
     * The number of neutral samples.
     */
    cNeutralSamples : UInt32

    pNeutralSamples : JabColorF.Ptr

    pReferenceShell : GamutShell.Ptr

    pPlausibleShell : GamutShell.Ptr

    pPossibleShell : GamutShell.Ptr

}
