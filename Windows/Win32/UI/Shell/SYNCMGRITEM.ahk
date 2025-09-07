#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Provides information about items being enumerated by the ISyncMgrEnumItems interface.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgritem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRITEM extends Win32Struct
{
    static sizeof => 296

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgritemflags">SYNCMGRITEMFLAGS</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The identifier for this item.
     * @type {Pointer<Guid>}
     */
    ItemID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwItemState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * The icon for this item.
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(this.ptr + 24)
            return this.__hIcon
        }
    }

    /**
     * Type: <b>WCHAR[MAX_SYNCMGRITEMNAME]</b>
     * 
     * The name of this item.
     * @type {String}
     */
    wszItemName {
        get => StrGet(this.ptr + 32, 127, "UTF-16")
        set => StrPut(value, this.ptr + 32, 127, "UTF-16")
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time of the last synchronization for this item.
     * @type {FILETIME}
     */
    ftLastUpdate{
        get {
            if(!this.HasProp("__ftLastUpdate"))
                this.__ftLastUpdate := FILETIME(this.ptr + 288)
            return this.__ftLastUpdate
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 296
    }
}
