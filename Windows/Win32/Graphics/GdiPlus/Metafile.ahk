#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Metafile class defines a graphic metafile. A metafile contains records that describe a sequence of graphics API calls. Metafiles can be recorded (constructed) and played back (displayed).
 * @remarks
 * 
 * Some <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-metafile-metafile(constmetafile_)">Metafile</a> constructors (those that receive a device context handle) create <b>Metafile</b> objects that are used to record metafiles. Other Metafile constructors (those that do not receive a device context handle) create <b>Metafile</b> objects that are used to display (play back) metafiles.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-metafile
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Metafile extends Win32Struct
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
