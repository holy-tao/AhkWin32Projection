#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Implements custom property definition support for data binding sources that are implemented using COM.
 * @remarks
 * ICustomProperty represents a property on an instance of an object, but the calling patterns support the ability to implement the interface per owner type.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICustomProperty extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomProperty
     * @type {Guid}
     */
    static IID => Guid("{30da92c0-23e8-42a0-ae7c-734a0e5d2782}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Name", "GetValue", "SetValue", "GetIndexedValue", "SetIndexedValue", "get_CanWrite", "get_CanRead"]

    /**
     * Gets the underlying type of the custom property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.type
     * @type {TypeName} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the path-relevant name of the property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets a value that determines whether the custom property supports write access.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.canwrite
     * @type {Boolean} 
     */
    CanWrite {
        get => this.get_CanWrite()
    }

    /**
     * Gets a value that determines whether the custom property supports read access.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_Type() {
        value := TypeName()
        result := ComCall(6, this, "ptr", value, "int")
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
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the value of the custom property from a particular instance.
     * @param {IInspectable} target The owning instance.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.getvalue
     */
    GetValue(target) {
        result := ComCall(8, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Sets the custom property value on a specified instance.
     * @param {IInspectable} target The owner instance.
     * @param {IInspectable} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.setvalue
     */
    SetValue(target, value) {
        result := ComCall(9, this, "ptr", target, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the value at an index location, for cases where the custom property has indexer support.
     * @param {IInspectable} target The owning instance.
     * @param {IInspectable} index The index to get.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.getindexedvalue
     */
    GetIndexedValue(target, index) {
        result := ComCall(10, this, "ptr", target, "ptr", index, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Sets the value at an index location, for cases where the custom property has indexer support.
     * @param {IInspectable} target The owner instance.
     * @param {IInspectable} value The value to set.
     * @param {IInspectable} index The index location to set to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.icustomproperty.setindexedvalue
     */
    SetIndexedValue(target, value, index) {
        result := ComCall(11, this, "ptr", target, "ptr", value, "ptr", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanWrite() {
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
    get_CanRead() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
