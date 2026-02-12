#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPropertyChangedEventArgs.ahk
#Include .\IPropertyChangedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PropertyChanged](inotifypropertychanged_propertychanged.md) event.
  * 
  * 
  * 
  * > **.NET**
  * > This class appears as [System.ComponentModel.PropertyChangedEventArgs](/dotnet/api/system.componentmodel.propertychangedeventargs?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this class is hidden and developers should use the [System.ComponentModel.PropertyChangedEventArgs](/dotnet/api/system.componentmodel.propertychangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.propertychangedeventargs
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class PropertyChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPropertyChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPropertyChangedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} name 
     * @returns {PropertyChangedEventArgs} 
     */
    static CreateInstance(name) {
        if (!PropertyChangedEventArgs.HasProp("__IPropertyChangedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.PropertyChangedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyChangedEventArgsFactory.IID)
            PropertyChangedEventArgs.__IPropertyChangedEventArgsFactory := IPropertyChangedEventArgsFactory(factoryPtr)
        }

        return PropertyChangedEventArgs.__IPropertyChangedEventArgsFactory.CreateInstance(name, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the property that changed.
     * 
     * > **.NET**
     * > This type is hidden, use [System.ComponentModel.PropertyChangedEventArgs](/dotnet/api/system.componentmodel.propertychangedeventargs?view=dotnet-uwp-10.0&preserve-view=true).
     * @remarks
     * When programming with .NET, this class is hidden and developers should use the [System.ComponentModel.PropertyChangedEventArgs](/dotnet/api/system.componentmodel.propertychangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.propertychangedeventargs.propertyname
     * @type {HSTRING} 
     */
    PropertyName {
        get => this.get_PropertyName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PropertyName() {
        if (!this.HasProp("__IPropertyChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPropertyChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyChangedEventArgs := IPropertyChangedEventArgs(outPtr)
        }

        return this.__IPropertyChangedEventArgs.get_PropertyName()
    }

;@endregion Instance Methods
}
