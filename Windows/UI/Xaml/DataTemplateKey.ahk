#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataTemplateKey.ahk
#Include .\IDataTemplateKeyFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the resource key for the [DataTemplate](datatemplate.md) class.
 * @remarks
 * DataTemplateKey represents an underlying type for a resource key ([x:Key attribute](/windows/uwp/xaml-platform/x-key-attribute) of a [DataTemplate](datatemplate.md)) that is used for resource lookup internally instead of a string. It exists mainly for infrastructure, you don't use this type directly in any common XAML data binding scenario.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplatekey
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DataTemplateKey extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataTemplateKey

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataTemplateKey.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DataTemplateKey} 
     */
    static CreateInstance() {
        if (!DataTemplateKey.HasProp("__IDataTemplateKeyFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DataTemplateKey")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateKeyFactory.IID)
            DataTemplateKey.__IDataTemplateKeyFactory := IDataTemplateKeyFactory(factoryPtr)
        }

        return DataTemplateKey.__IDataTemplateKeyFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {IInspectable} dataType 
     * @returns {DataTemplateKey} 
     */
    static CreateInstanceWithType(dataType) {
        if (!DataTemplateKey.HasProp("__IDataTemplateKeyFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DataTemplateKey")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTemplateKeyFactory.IID)
            DataTemplateKey.__IDataTemplateKeyFactory := IDataTemplateKeyFactory(factoryPtr)
        }

        return DataTemplateKey.__IDataTemplateKeyFactory.CreateInstanceWithType(dataType, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type for which the template is designed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datatemplatekey.datatype
     * @type {IInspectable} 
     */
    DataType {
        get => this.get_DataType()
        set => this.put_DataType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DataType() {
        if (!this.HasProp("__IDataTemplateKey")) {
            if ((queryResult := this.QueryInterface(IDataTemplateKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplateKey := IDataTemplateKey(outPtr)
        }

        return this.__IDataTemplateKey.get_DataType()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_DataType(value) {
        if (!this.HasProp("__IDataTemplateKey")) {
            if ((queryResult := this.QueryInterface(IDataTemplateKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTemplateKey := IDataTemplateKey(outPtr)
        }

        return this.__IDataTemplateKey.put_DataType(value)
    }

;@endregion Instance Methods
}
