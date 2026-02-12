#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IXamlType.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the means to report XAML-type system specifics about XAML members. Using this interface contract, XAML parsers can load any custom types and members thereof that are defined in your app and are referenced in XAML files.
 * @remarks
 * For more info on [IXamlType](ixamltype.md) and IXamlMember and how these are used for XAML custom types, see "Remarks" section of [IXamlType](ixamltype.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlMember extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlMember
     * @type {Guid}
     */
    static IID => Guid("{c541f58c-43a9-4216-b718-e0b11b14e93e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAttachable", "get_IsDependencyProperty", "get_IsReadOnly", "get_Name", "get_TargetType", "get_Type", "GetValue", "SetValue"]

    /**
     * Gets a value that indicates whether the XAML member is an attachable member.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.isattachable
     * @type {Boolean} 
     */
    IsAttachable {
        get => this.get_IsAttachable()
    }

    /**
     * Gets a value that indicates whether the XAML member is implemented as a dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.isdependencyproperty
     * @type {Boolean} 
     */
    IsDependencyProperty {
        get => this.get_IsDependencyProperty()
    }

    /**
     * Gets whether the XAML member is read-only in its backing implementation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets the [XamlName name string](/dotnet/framework/xaml-services/xamlname-grammar) that declares the XAML member.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the [IXamlType](ixamltype.md) of the type where the member can exist.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.targettype
     * @type {IXamlType} 
     */
    TargetType {
        get => this.get_TargetType()
    }

    /**
     * Gets the [IXamlType](ixamltype.md) of the type that is used by the member.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.type
     * @type {IXamlType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAttachable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDependencyProperty() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IXamlType} 
     */
    get_TargetType() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(value)
    }

    /**
     * 
     * @returns {IXamlType} 
     */
    get_Type() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(value)
    }

    /**
     * Provides a get-value utility for this [IXamlMember](ixamlmember.md).
     * @param {IInspectable} instance The object instance to get the member value from.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.getvalue
     */
    GetValue(instance) {
        result := ComCall(12, this, "ptr", instance, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Provides a set-value utility for this [IXamlMember](ixamlmember.md).
     * @param {IInspectable} instance The object instance to set the member value on.
     * @param {IInspectable} value The member value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamlmember.setvalue
     */
    SetValue(instance, value) {
        result := ComCall(13, this, "ptr", instance, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
