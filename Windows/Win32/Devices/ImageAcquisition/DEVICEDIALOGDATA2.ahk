#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IWiaItem2.ahk" { IWiaItem2 }

/**
 * DEVICEDIALOGDATA2 structure - Defines the data needed to call a device dialog.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-devicedialogdata2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct DEVICEDIALOGDATA2 {
    #StructPack 8

    /**
     * Type: **DWORD**
     * 
     * 
     * Specifies the size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * 
     * Points to an [**IWiaItem2**](-wia-iwiaitem2.md) interface that represents the valid root item in the application item tree.
     */
    pIWiaItemRoot : IWiaItem2

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
     * Type: **HWND**
     * 
     * 
     * Specifies the handle to the parent window of the dialog.
     */
    hwndParent : HWND

    /**
     * Type: **BSTR**
     * 
     * 
     * Specifies the folder name where the files are transferred.
     */
    bstrFolderName : BSTR

    /**
     * Type: **BSTR**
     * 
     * 
     * Specifies the filename template to be used for files transferred from WIA items to the destination folder designated by **bstrFolderName**. An arbitrary number of unique file names can be created by appending additional characters to the file name template.
     */
    bstrFilename : BSTR

    /**
     * Type: **LONG**
     * 
     * 
     * Receives the number of strings written to the **pbstrFilePaths** array.
     */
    lNumFiles : Int32

    /**
     * Type: **BSTR\***
     * 
     * 
     * Pointer to an array of BSTR pointers. Each array element points to a BSTR that contains the destination name of a file that was successfully transferred to the folder identified by bstrFolderName. The method must allocate the storage for this member.
     */
    pbstrFilePaths : BSTR.Ptr

    pWiaItem : IWiaItem2

}
