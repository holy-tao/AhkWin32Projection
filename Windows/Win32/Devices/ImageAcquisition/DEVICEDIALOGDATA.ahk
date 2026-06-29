#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWiaItem.ahk" { IWiaItem }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * DEVICEDIALOGDATA structure - Defines the data needed to call a device dialog.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-devicedialogdata
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct DEVICEDIALOGDATA {
    #StructPack 8

    /**
     * Type: **DWORD**
     * 
     * 
     * Specifies the size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: **HWND**
     * 
     * 
     * Specifies the handle to the parent window of the dialog.
     */
    hwndParent : HWND

    /**
     * Type: **[**IWiaItem**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem)\***
     * 
     * 
     * Points to an [**IWiaItem**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem) interface that represents the valid root item in the application item tree.
     */
    pIWiaItemRoot : IWiaItem

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
     */
    dwFlags : UInt32

    /**
     * Type: **LONG**
     * 
     * 
     * Specifies what type of data the image is intended to represent. For a list of image intent values, see [**Image Intent Constants**](-wia-imageintentconstants.md).
     */
    lIntent : Int32

    /**
     * Type: **LONG**
     * 
     * 
     * Receives the number of items in the array indicated by the **ppWiaItem** parameter.
     */
    lItemCount : Int32

    ppWiaItems : IWiaItem.Ptr

}
