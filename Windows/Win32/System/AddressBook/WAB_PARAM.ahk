#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Contains the input information to pass to WABOpen.
 * @see https://learn.microsoft.com/windows/win32/api/wabapi/ns-wabapi-wab_param
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class WAB_PARAM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the size of the <b>WAB_PARAM</b> structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies the window handle of the calling client application. Can be <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    hwnd {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Value of type <b>LPTSTR</b> that specifies the WAB file name to open. If this parameter is <b>NULL</b>, the default Address Book file is opened.
     * @type {Pointer<Ptr>}
     */
    szFileName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags that control the behavior of WAB functionality. Available only on Internet Explorer 4.0 or later.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * Value of type <b>GUID</b> that specifies the GUID that identifies the calling application's property sheet extensions. The GUID can be used to determine whether the extension property sheets are displayed or not. Available only on Internet Explorer 5 or later.
     * @type {Pointer<Guid>}
     */
    guidPSExt {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
