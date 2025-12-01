#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies an IImePadApplet IID list.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-appletidlist
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class APPLETIDLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of the IID's implemented in this applet.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The IID list. This must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>.
     * @type {Pointer<Guid>}
     */
    pIIDList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
