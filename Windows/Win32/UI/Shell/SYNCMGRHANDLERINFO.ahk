#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WindowsAndMessaging\HICON.ahk

/**
 * Provides information about the handler for use in the ISyncMgrSynchronize::GetHandlerInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrhandlerinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRHANDLERINFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * The icon for the handler.
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(this.ptr + 8)
            return this.__hIcon
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The value of the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrhandlerflags">SYNCMGRHANDLERFLAGS</a> enumeration.
     * @type {Integer}
     */
    SyncMgrHandlerFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>WCHAR[MAX_SYNCMGRHANDLERNAME]</b>
     * 
     * The name to use for the handler.
     * @type {String}
     */
    wszHandlerName {
        get => StrGet(this.ptr + 20, 31, "UTF-16")
        set => StrPut(value, this.ptr + 20, 31, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
