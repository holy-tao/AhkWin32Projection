#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PSFEATURE_CUSTPAPER structure contains information about a custom paper size for a PostScript driver. This structure is used with the GET_PS_FEATURESETTING printer escape function.
 * @remarks
 * For the semantics of the <b>lOrientation</b>, <b>lWidth</b>, <b>lHeight</b>, <b>lWidthOffset</b>, and <b>lHeightOffset</b> members, please refer to "Custom Page Size Parameters" in "PostScript Printer Description File Format Specification" v.4.3.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-psfeature_custpaper
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct PSFEATURE_CUSTPAPER {
    #StructPack 4

    /**
     * Indicates the custom paper orientation. This member can be 0 to 3 if custom page size is selected. Otherwise, it is 1 and all other structure members are zero
     */
    lOrientation : Int32

    /**
     * Custom page width, in points.
     */
    lWidth : Int32

    /**
     * Custom page height, in points.
     */
    lHeight : Int32

    /**
     * Custom page width offset, in points.
     */
    lWidthOffset : Int32

    /**
     * Custom page height offset, in points.
     */
    lHeightOffset : Int32

}
