#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHANGER_ELEMENT.ahk

/**
 * Represents a range of elements of a single type, typically for an operation such as getting or initializing the status of multiple elements.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-changer_element_list
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_ELEMENT_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-changer_element">CHANGER_ELEMENT</a> structure that represent the first element in the range.
     * @type {CHANGER_ELEMENT}
     */
    Element{
        get {
            if(!this.HasProp("__Element"))
                this.__Element := CHANGER_ELEMENT(0, this)
            return this.__Element
        }
    }

    /**
     * The number of elements in the range.
     * @type {Integer}
     */
    NumberOfElements {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
