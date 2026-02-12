#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Notifies clients that a property value has changed.
  * 
  * 
  * 
  * > **.NET**
  * > This interface appears as [System.ComponentModel.INotifyPropertyChanged](/dotnet/api/system.componentmodel.inotifypropertychanged?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.ComponentModel.INotifyPropertyChanged](/dotnet/api/system.componentmodel.inotifypropertychanged?view=dotnet-uwp-10.0&preserve-view=true) interface.
 * 
 * The INotifyPropertyChanged interface is used to notify clients, typically binding clients, that a property value has changed. For example, consider an `Employee` object with a property called `Name`. To provide generic property-change notification, the `Employee` type implements the INotifyPropertyChanged interface and raises a [PropertyChanged](inotifypropertychanged_propertychanged.md) event when `Name` is changed.
 * 
 * The [PropertyChanged](inotifypropertychanged_propertychanged.md) event can indicate that all properties on the object have changed by using [String.Empty](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) for the [PropertyName](propertychangedeventargs_propertyname.md) property of the [PropertyChangedEventArgs](propertychangedeventargs.md). Note that you cannot use **null** (**Nothing** in Microsoft Visual Basic) for this like you can in Windows Presentation Foundation (WPF) and Microsoft Silverlight.
 * 
 * The [PropertyChanged](inotifypropertychanged_propertychanged.md) event can indicate that indexer properties on the object have changed by using a [PropertyName](propertychangedeventargs_propertyname.md) value of "Item[*indexer* ]" for specific indexers or "Item[]" for all indexers. Note that C++ does not currently support binding to indexers. For a workaround, see the [XAML data binding sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlBind).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.inotifypropertychanged
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class INotifyPropertyChanged extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotifyPropertyChanged
     * @type {Guid}
     */
    static IID => Guid("{cf75d69c-f2f4-486b-b302-bb4c09baebfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PropertyChanged", "remove_PropertyChanged"]

    /**
     * 
     * @param {PropertyChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertyChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PropertyChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
