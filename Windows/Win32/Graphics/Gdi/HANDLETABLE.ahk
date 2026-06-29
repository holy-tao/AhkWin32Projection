#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGDIOBJ.ahk" { HGDIOBJ }

/**
 * The HANDLETABLE structure is an array of handles, each of which identifies a graphics device interface (GDI) object.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-handletable
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct HANDLETABLE {
    #StructPack 8

    /**
     * An array of handles.
     */
    objectHandle : HGDIOBJ[1]

}
