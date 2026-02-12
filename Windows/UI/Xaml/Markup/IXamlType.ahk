#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXamlType.ahk
#Include .\IXamlMember.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the means to report XAML-type system specifics about XAML types. Using this interface contract, XAML parsers can load any custom types and members thereof that are defined in your app and are referenced in XAML files.
 * @remarks
 * The Windows Runtime is a native Component Object Model (COM) based API. You can use several languages to write the app code, including Microsoft .NET languages and native C++. The Windows Runtime does not include reflection or a CLR-style type system. In absence of such a type system, the XAML framework for the Windows Runtime needs infrastructure and contracts to recognize and load any custom types that are defined in your app and are referenced in XAML files. The [IXamlMember](ixamlmember.md) and IXamlType interfaces are the contract. The infrastructure is partially visible as a generated code file XamlTypeInfo.* (remainder of file name varying depending on which language you use). This file contains a partial class that extends the [Application](../windows.ui.xaml/application.md) class and implements the [IXamlMetadataProvider](ixamlmetadataprovider.md) interface. The Windows Runtime XAML framework uses this interface to query for the details of types referenced in XAML files. Other generated files also use [IXamlMetadataProvider](ixamlmetadataprovider.md) for discovery.
 * 
 * > [!NOTE]
 * > XamlTypeInfo.* can be found in the obj folder along with other generated files . You may need to enable **Show all files** to see it. Also, if you want to step into the type definition code, disable the **Just my code** feature in the debugger options.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlType extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlType
     * @type {Guid}
     */
    static IID => Guid("{7920eab1-a2e5-479a-bd50-6cef3c0b4970}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaseType", "get_ContentProperty", "get_FullName", "get_IsArray", "get_IsCollection", "get_IsConstructible", "get_IsDictionary", "get_IsMarkupExtension", "get_IsBindable", "get_ItemType", "get_KeyType", "get_UnderlyingType", "ActivateInstance", "CreateFromString", "GetMember", "AddToVector", "AddToMap", "RunInitializer"]

    /**
     * Gets the [IXamlType](ixamltype.md) for the immediate base type of the XAML type. Determination of this value is based on the underlying type for core types.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.basetype
     * @type {IXamlType} 
     */
    BaseType {
        get => this.get_BaseType()
    }

    /**
     * Gets the [IXamlMember](ixamlmember.md) information for the XAML content property of this [IXamlType](ixamltype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.contentproperty
     * @type {IXamlMember} 
     */
    ContentProperty {
        get => this.get_ContentProperty()
    }

    /**
     * Gets the full class name of the underlying type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.fullname
     * @type {HSTRING} 
     */
    FullName {
        get => this.get_FullName()
    }

    /**
     * Gets a value that indicates whether the [IXamlType](ixamltype.md) represents an array.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.isarray
     * @type {Boolean} 
     */
    IsArray {
        get => this.get_IsArray()
    }

    /**
     * Gets a value that indicates whether this [IXamlType](ixamltype.md) represents a collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.iscollection
     * @type {Boolean} 
     */
    IsCollection {
        get => this.get_IsCollection()
    }

    /**
     * Gets a value that indicates whether this [IXamlType](ixamltype.md) represents a constructible type, as per the XAML definition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.isconstructible
     * @type {Boolean} 
     */
    IsConstructible {
        get => this.get_IsConstructible()
    }

    /**
     * Gets a value that indicates whether this [IXamlType](ixamltype.md) represents a dictionary/map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.isdictionary
     * @type {Boolean} 
     */
    IsDictionary {
        get => this.get_IsDictionary()
    }

    /**
     * Gets a value that indicates whether the [IXamlType](ixamltype.md) represents a markup extension.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.ismarkupextension
     * @type {Boolean} 
     */
    IsMarkupExtension {
        get => this.get_IsMarkupExtension()
    }

    /**
     * Gets a value that declares whether the type is bindable.
     * @remarks
     * The value of this property corresponds to application of the [BindableAttribute](../windows.ui.xaml.data/bindableattribute.md) to the underlying class for native C++ classes. The value is always **true** for all common language runtime (CLR) classes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.isbindable
     * @type {Boolean} 
     */
    IsBindable {
        get => this.get_IsBindable()
    }

    /**
     * Gets a value that provides the type information for the **Items** property of this [IXamlType](ixamltype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.itemtype
     * @type {IXamlType} 
     */
    ItemType {
        get => this.get_ItemType()
    }

    /**
     * Gets a value that provides the type information for the **Key** property of this [IXamlType](ixamltype.md), if this [IXamlType](ixamltype.md) represents a dictionary/map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.keytype
     * @type {IXamlType} 
     */
    KeyType {
        get => this.get_KeyType()
    }

    /**
     * Gets information for the backing type.
     * @remarks
     * > [!NOTE]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). If you're using Visual C++ component extensions (C++/CX)), this is a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.underlyingtype
     * @type {TypeName} 
     */
    UnderlyingType {
        get => this.get_UnderlyingType()
    }

    /**
     * 
     * @returns {IXamlType} 
     */
    get_BaseType() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(value)
    }

    /**
     * 
     * @returns {IXamlMember} 
     */
    get_ContentProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlMember(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FullName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsArray() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCollection() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConstructible() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDictionary() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMarkupExtension() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBindable() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IXamlType} 
     */
    get_ItemType() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(value)
    }

    /**
     * 
     * @returns {IXamlType} 
     */
    get_KeyType() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlType(value)
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_UnderlyingType() {
        value := TypeName()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Given a XAML type, sets its values for initialization and returns a usable instance.
     * @remarks
     * This is an infrastructure API that replicates **ActivateInstance** for XAML activation.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.activateinstance
     */
    ActivateInstance() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Creates a type system representation based on a string. The main scenario for this usage is creating an enumeration value and mapping the appropriate enumeration.
     * @param {HSTRING} value The string to create from.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.createfromstring
     */
    CreateFromString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(19, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Returns the [IXamlMember](ixamlmember.md) information for a specific named member from this [IXamlType](ixamltype.md).
     * @param {HSTRING} name The name of the member to get (as a string).
     * @returns {IXamlMember} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.getmember
     */
    GetMember(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(20, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlMember(result_)
    }

    /**
     * Adds an item to a custom vector type.
     * @param {IInspectable} instance The type instance to set the item to.
     * @param {IInspectable} value The value of the item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.addtovector
     */
    AddToVector(instance, value) {
        result := ComCall(21, this, "ptr", instance, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an item to a custom map type.
     * @param {IInspectable} instance The type instance to set the map item to.
     * @param {IInspectable} key The key of the map item to add.
     * @param {IInspectable} value The value of the map item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.addtomap
     */
    AddToMap(instance, key, value) {
        result := ComCall(22, this, "ptr", instance, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Invokes any necessary pre-activation logic as required by the XAML schema context and its platform dependencies.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.ixamltype.runinitializer
     */
    RunInitializer() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
