#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\BLENDFUNCTION.ahk" { BLENDFUNCTION }

/**
 * The BLENDOBJ structure controls blending by specifying the blending functions for source and destination bitmaps.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-blendobj
 * @namespace Windows.Win32.Devices.Display
 */
export default struct BLENDOBJ {
    #StructPack 1

    /**
     * Is a BLENDFUNCTION structure (described in the Microsoft Window SDK documentation) that specifies the blending operation to use, the alpha transparency for the source bitmap, and the way the source and destination bitmaps are interpreted.
     */
    BlendFunction : BLENDFUNCTION

}
