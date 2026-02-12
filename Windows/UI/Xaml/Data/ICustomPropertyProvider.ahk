#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICustomProperty.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides lookup service for [ICustomProperty](icustomproperty.md) support. This interface is implemented by objects so that their custom defined properties can be used as run-time binding sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustompropertyprovider
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICustomPropertyProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomPropertyProvider
     * @type {Guid}
     */
    static IID => Guid("{7c925755-3e48-42b4-8677-76372267033f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCustomProperty", "GetIndexedProperty", "GetStringRepresentation", "get_Type"]

    /**
     * Gets the underlying type of the custom property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustompropertyprovider.type
     * @type {TypeName} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a custom property's [ICustomProperty](icustomproperty.md) support object by specifying a property name.
     * @param {HSTRING} name The name of the property to get the support object for.
     * @returns {ICustomProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustompropertyprovider.getcustomproperty
     */
    GetCustomProperty(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICustomProperty(result_)
    }

    /**
     * Gets a custom property's [ICustomProperty](icustomproperty.md) support object by specifying a property name and the type of the indexed collection.
     * @param {HSTRING} name The name of the property to get the support object for.
     * @param {TypeName} type The type of the indexed collection, specified as a [TypeName](../windows.ui.xaml.interop/typename.md) wrapper.
     * @returns {ICustomProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustompropertyprovider.getindexedproperty
     */
    GetIndexedProperty(name, type) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", type, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICustomProperty(result_)
    }

    /**
     * Provides support for "GetStringFromObject" and/or "ToString" logic on the assumption that the implementation supports [System.Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true). This logic might be accessed by features or services such as generating UI Automation values based on data content.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustompropertyprovider.getstringrepresentation
     */
    GetStringRepresentation() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_Type() {
        value := TypeName()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
