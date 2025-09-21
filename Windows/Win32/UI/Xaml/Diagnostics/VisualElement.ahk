#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SourceInfo.ahk

/**
 * Represents a XAML element in the Live Visual Tree in Microsoft Visual Studio.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-visualelement
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class VisualElement extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A handle to the object.
     * @type {Integer}
     */
    Handle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Information about the XAML source document.
     * @type {SourceInfo}
     */
    SrcInfo{
        get {
            if(!this.HasProp("__SrcInfo"))
                this.__SrcInfo := SourceInfo(this.ptr + 8)
            return this.__SrcInfo
        }
    }

    /**
     * The type of the object.
     * @type {Pointer<Char>}
     */
    Type {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The name of the XAML element, if it has an <a href="https://docs.microsoft.com/windows/uwp/xaml-platform/x-name-attribute">x:Name</a> defined in markup.
     * @type {Pointer<Char>}
     */
    Name {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The number of children the XAML element has.
     * @type {Integer}
     */
    NumChildren {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
