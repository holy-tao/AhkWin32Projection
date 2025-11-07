#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PrivateFontCollection is a collection class for fonts. This class keeps a collection of fonts specifically for an application. The fonts in the collection can include installed fonts as well as fonts that have not been installed on the system.
 * @remarks
 * 
 * <b>PrivateFontCollection</b> allows applications to install a private version of an existing font without the need to replace the system version of the font. For example, GDI+ can create a private version of the Arial font in addition to the Arial font that the system uses. <b>PrivateFontCollection</b> can also be used to install fonts that don't exist in the operating system. This is a temporary font install that doesn't affect the system-installed collection. To see the installed collection use the 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nl-gdiplusheaders-installedfontcollection">InstalledFontCollection</a> class.
 * 
 * <div class="alert"><b>Note</b>  When you use the GDI+ API, you must never allow your application to download arbitrary fonts from untrusted sources. 
 * The operating system requires elevated privileges to assure that all installed fonts are trusted.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-privatefontcollection
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PrivateFontCollection extends Win32Struct
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
