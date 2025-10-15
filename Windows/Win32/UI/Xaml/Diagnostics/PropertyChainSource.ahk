#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\SourceInfo.ahk

/**
 * Represents the source object (a Style) of a target type.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ns-xamlom-propertychainsource
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class PropertyChainSource extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A handle to the style.
     * @type {Integer}
     */
    Handle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The target type of the style, defined in markup.
     * @type {BSTR}
     */
    TargetType{
        get {
            if(!this.HasProp("__TargetType"))
                this.__TargetType := BSTR(this.ptr + 8)
            return this.__TargetType
        }
    }

    /**
     * The name of the style, if it has an <a href="https://docs.microsoft.com/windows/uwp/xaml-platform/x-name-attribute">x:Name</a> defined in markup.
     * @type {BSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := BSTR(this.ptr + 16)
            return this.__Name
        }
    }

    /**
     * Where the style is defined in the application .
     * @type {Integer}
     */
    Source {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * 
     * @type {SourceInfo}
     */
    SrcInfo{
        get {
            if(!this.HasProp("__SrcInfo"))
                this.__SrcInfo := SourceInfo(this.ptr + 32)
            return this.__SrcInfo
        }
    }
}
