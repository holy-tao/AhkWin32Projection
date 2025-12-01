#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * DEVICEDIALOGDATA structure - Defines the data needed to call a device dialog.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-devicedialogdata
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class DEVICEDIALOGDATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: **DWORD**
     * 
     * 
     * Specifies the size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **HWND**
     * 
     * 
     * Specifies the handle to the parent window of the dialog.
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(8, this)
            return this.__hwndParent
        }
    }

    /**
     * Type: **[**IWiaItem**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem)\***
     * 
     * 
     * Points to an [**IWiaItem**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem) interface that represents the valid root item in the application item tree.
     * @type {IWiaItem}
     */
    pIWiaItemRoot {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * Specifies a set of flags that control the dialog box's operation. Can be set to any of the following values:
     * 
     * 
     * 
     * | Flag                                 | Meaning                                                                                                                                                                                     |
     * |--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | 0                                    | Default behavior.                                                                                                                                                                           |
     * | WIA\_DEVICE\_DIALOG\_SINGLE\_IMAGE   | Restrict image selection to a single image in the device image acquisition dialog box.                                                                                                      |
     * | WIA\_DEVICE\_DIALOG\_USE\_COMMON\_UI | Use the system UI, if available, rather than the vendor-supplied UI. If the system UI is not available, the vendor UI is used. If neither UI is available, the function returns E\_NOTIMPL. |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **LONG**
     * 
     * 
     * Specifies what type of data the image is intended to represent. For a list of image intent values, see [**Image Intent Constants**](-wia-imageintentconstants.md).
     * @type {Integer}
     */
    lIntent {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: **LONG**
     * 
     * 
     * Receives the number of items in the array indicated by the **ppWiaItem** parameter.
     * @type {Integer}
     */
    lItemCount {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Pointer<IWiaItem>}
     */
    ppWiaItems {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
