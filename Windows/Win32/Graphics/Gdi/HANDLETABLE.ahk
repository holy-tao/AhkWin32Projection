#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HANDLETABLE structure is an array of handles, each of which identifies a graphics device interface (GDI) object.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-handletable
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class HANDLETABLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * An array of handles.
     * @type {Array<HGDIOBJ>}
     */
    objectHandle{
        get {
            if(!this.HasProp("__objectHandleProxyArray"))
                this.__objectHandleProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "ptr")
            return this.__objectHandleProxyArray
        }
    }
}
