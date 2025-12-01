#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\UI\Controls\HIMAGELIST.ahk

/**
 * An SP_CLASSIMAGELIST_DATA structure describes a class image list.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_classimagelist_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_CLASSIMAGELIST_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the SP_CLASSIMAGE_DATA structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the class image list.
     * @type {HIMAGELIST}
     */
    ImageList{
        get {
            if(!this.HasProp("__ImageList"))
                this.__ImageList := HIMAGELIST(8, this)
            return this.__ImageList
        }
    }

    /**
     * Reserved. For internal use only.
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
