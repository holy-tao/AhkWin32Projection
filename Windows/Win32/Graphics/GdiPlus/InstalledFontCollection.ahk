#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The InstalledFontCollection class defines a class that represents the fonts installed on the system.
 * @remarks
 * 
  * Windows GDI+ clients should not use the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-installedfontcollection-installedfontcollection(constinstalledfontcollection_)">InstalledFontCollection</a> class to install a font to Windows. Instead, use the Windows Graphics Device Interface (GDI)Â <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-addfontresourcea">AddFontResource</a> function. An <b>InstalledFontCollection</b> object can find only those fonts that were installed in Windows before the object was created.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-installedfontcollection
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class InstalledFontCollection extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
