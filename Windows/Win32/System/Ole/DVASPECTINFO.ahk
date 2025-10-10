#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used by the IViewObject::Draw method to optimize rendering of an inactive object by making more efficient use of the GDI.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ns-ocidl-dvaspectinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class DVASPECTINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value taken from the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ne-ocidl-dvaspectinfoflag">DVASPECTINFOFLAG</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
