#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DISPLAYCONFIG_2DREGION structure represents a point or an offset in a two-dimensional space.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_2dregion
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_2DREGION {
    #StructPack 4

    /**
     * The horizontal component of the point or offset.
     */
    cx : UInt32

    /**
     * The vertical component of the point or offset.
     */
    cy : UInt32

}
