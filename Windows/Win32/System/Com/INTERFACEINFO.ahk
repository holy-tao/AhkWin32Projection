#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Contains information about incoming calls.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-interfaceinfo
 * @namespace Windows.Win32.System.Com
 */
class INTERFACEINFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object.
     * @type {IUnknown}
     */
    pUnk {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the requested interface.
     * @type {Guid}
     */
    iid {
        get {
            if(!this.HasProp("__iid"))
                this.__iid := Guid(8, this)
            return this.__iid
        }
    }

    /**
     * The interface method.
     * @type {Integer}
     */
    wMethod {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
