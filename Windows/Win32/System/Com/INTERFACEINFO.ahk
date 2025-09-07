#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about incoming calls.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-interfaceinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class INTERFACEINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object.
     * @type {Pointer<IUnknown>}
     */
    pUnk {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the requested interface.
     * @type {Pointer<Guid>}
     */
    iid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The interface method.
     * @type {Integer}
     */
    wMethod {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
