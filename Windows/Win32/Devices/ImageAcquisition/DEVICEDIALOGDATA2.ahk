#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * DEVICEDIALOGDATA2 structure - Defines the data needed to call a device dialog.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-devicedialogdata2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class DEVICEDIALOGDATA2 extends Win32Struct
{
    static sizeof => 72

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
     * Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * 
     * Points to an [**IWiaItem2**](-wia-iwiaitem2.md) interface that represents the valid root item in the application item tree.
     * @type {IWiaItem2}
     */
    pIWiaItemRoot {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
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
                this.__hwndParent := HWND(24, this)
            return this.__hwndParent
        }
    }

    /**
     * Type: **BSTR**
     * 
     * 
     * Specifies the folder name where the files are transferred.
     * @type {BSTR}
     */
    bstrFolderName{
        get {
            if(!this.HasProp("__bstrFolderName"))
                this.__bstrFolderName := BSTR(32, this)
            return this.__bstrFolderName
        }
    }

    /**
     * Type: **BSTR**
     * 
     * 
     * Specifies the filename template to be used for files transferred from WIA items to the destination folder designated by **bstrFolderName**. An arbitrary number of unique file names can be created by appending additional characters to the file name template.
     * @type {BSTR}
     */
    bstrFilename{
        get {
            if(!this.HasProp("__bstrFilename"))
                this.__bstrFilename := BSTR(40, this)
            return this.__bstrFilename
        }
    }

    /**
     * Type: **LONG**
     * 
     * 
     * Receives the number of strings written to the **pbstrFilePaths** array.
     * @type {Integer}
     */
    lNumFiles {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: **BSTR\***
     * 
     * 
     * Pointer to an array of BSTR pointers. Each array element points to a BSTR that contains the destination name of a file that was successfully transferred to the folder identified by bstrFolderName. The method must allocate the storage for this member.
     * @type {Pointer<BSTR>}
     */
    pbstrFilePaths {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {IWiaItem2}
     */
    pWiaItem {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
