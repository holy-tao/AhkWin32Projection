#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class DEVICEDIALOGDATA2 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<IWiaItem2>}
     */
    pIWiaItemRoot {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
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
     * @type {Integer}
     */
    lNumFiles {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    pbstrFilePaths {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<IWiaItem2>}
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
