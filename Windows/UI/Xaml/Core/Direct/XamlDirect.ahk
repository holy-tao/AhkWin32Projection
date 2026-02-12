#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlDirect.ahk
#Include .\IXamlDirectStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the base class for all XamlDirect APIs. All of the XamlDirect APIs are instance methods off of this class.
  * 
  * [XamlDirect](windows_ui_xaml_core_direct.md) is an API for accessing Xaml at a more primitive level for better CPU and working set performance.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Core.Direct.XamlDirect](/windows/winui/api/microsoft.ui.xaml.core.direct.xamldirect) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect
 * @namespace Windows.UI.Xaml.Core.Direct
 * @version WindowsRuntime 1.4
 */
class XamlDirect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlDirect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlDirect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the current [XamlDirect](xamldirect.md) instance. 
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Core.Direct.XamlDirect.GetDefault](/windows/winui/api/microsoft.ui.xaml.core.direct.xamldirect.getdefault) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * For even better performance, consider caching this locally instead of querying for the instance every time.
     * @returns {XamlDirect} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getdefault
     */
    static GetDefault() {
        if (!XamlDirect.HasProp("__IXamlDirectStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Core.Direct.XamlDirect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlDirectStatics.IID)
            XamlDirect.__IXamlDirectStatics := IXamlDirectStatics(factoryPtr)
        }

        return XamlDirect.__IXamlDirectStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets (and creates if necessary) the instance as its full XAML type of the specified [IXamlDirectObject](ixamldirectobject.md).
     * @remarks
     * Use this method to convert from a [XamlDirect](xamldirect.md) instance to its full XAML type. This results in the creation of a full object and hence the performance benefits of staying within the [XamlDirect](xamldirect.md) APIs will be lost for that specific [IXamlDirectObject](ixamldirectobject.md) instance.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getobject
     */
    GetObject(xamlDirectObject) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetObject(xamlDirectObject)
    }

    /**
     * Gets the instance as an [IXamlDirectObject](ixamldirectobject.md) for a given XAML type.
     * @remarks
     * Use this method to convert from a full XAML type to its [XamlDirect](xamldirect.md) instance and then get the performance benefits of [XamlDirect](xamldirect.md) through property management, collection management and event handling functionalities exposed through the [XamlDirect](xamldirect.md) APIs.
     * @param {IInspectable} object_ Refers to the specific XAML type (typically, but not always, a [DependencyObject](../windows.ui.xaml/dependencyobject.md)).
     * @returns {IXamlDirectObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getxamldirectobject
     */
    GetXamlDirectObject(object_) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetXamlDirectObject(object_)
    }

    /**
     * Creates an [IXamlDirectObject](ixamldirectobject.md) instance of the type specified by the [XamlTypeIndex](xamltypeindex.md) parameter.
     * @param {Integer} typeIndex Refers to the specific XAML type from the set of supported types listed in the [XamlTypeIndex](xamltypeindex.md) enum.
     * @returns {IXamlDirectObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.createinstance
     */
    CreateInstance(typeIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.CreateInstance(typeIndex)
    }

    /**
     * Sets the value of an _object_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _object_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {IInspectable} value _object_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setobjectproperty
     */
    SetObjectProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetObjectProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of an [IXamlDirectObject](ixamldirectobject.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [IXamlDirectObject](ixamldirectobject.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {IXamlDirectObject} value [IXamlDirectObject](ixamldirectobject.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setxamldirectobjectproperty
     */
    SetXamlDirectObjectProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetXamlDirectObjectProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a _Boolean_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Boolean_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Boolean} value _Boolean_ value to set for the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setbooleanproperty
     */
    SetBooleanProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetBooleanProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a _Double_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Double_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Float} value _Double_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setdoubleproperty
     */
    SetDoubleProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetDoubleProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of an _Int32_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Int32_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Integer} value _Int32_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setint32property
     */
    SetInt32Property(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetInt32Property(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a _string_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _string_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {HSTRING} value _string_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setstringproperty
     */
    SetStringProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetStringProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a _DateTimeOffset_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _DateTimeOffset_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {DateTime} value _DateTimeOffset_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setdatetimeproperty
     */
    SetDateTimeProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetDateTimeProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Point](../windows.foundation/point.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Point](../windows.foundation/point.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {POINT} value [Point](../windows.foundation/point.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setpointproperty
     */
    SetPointProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetPointProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Rect](../windows.foundation/rect.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Rect](../windows.foundation/rect.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {RECT} value [Rect](../windows.foundation/rect.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setrectproperty
     */
    SetRectProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetRectProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Size](../windows.foundation/size.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Size](../windows.foundation/size.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {SIZE} value [Size](../windows.foundation/size.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setsizeproperty
     */
    SetSizeProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetSizeProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a _TimeSpan_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _TimeSpan_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {TimeSpan} value _TimeSpan_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.settimespanproperty
     */
    SetTimeSpanProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetTimeSpanProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Color](../windows.ui/color.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Color](../windows.ui/color.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Color} value [Color](../windows.ui/color.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setcolorproperty
     */
    SetColorProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetColorProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [CornerRadius](../windows.ui.xaml/cornerradius.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [CornerRadius](../windows.ui.xaml/cornerradius.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {CornerRadius} value [CornerRadius](../windows.ui.xaml/cornerradius.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setcornerradiusproperty
     */
    SetCornerRadiusProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetCornerRadiusProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a _Duration_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Duration_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Duration} value _Duration_ value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setdurationproperty
     */
    SetDurationProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetDurationProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [GridLength](../windows.ui.xaml/gridlength.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [GridLength](../windows.ui.xaml/gridlength.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {GridLength} value [GridLength](../windows.ui.xaml/gridlength.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setgridlengthproperty
     */
    SetGridLengthProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetGridLengthProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Thickness](../windows.ui.xaml/thickness.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Thickness](../windows.ui.xaml/thickness.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Thickness} value [Thickness](../windows.ui.xaml/thickness.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setthicknessproperty
     */
    SetThicknessProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetThicknessProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Matrix](../windows.ui.xaml.media/matrix.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Matrix](../windows.ui.xaml.media/matrix.md) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Matrix} value [Matrix](../windows.ui.xaml.media/matrix.md) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setmatrixproperty
     */
    SetMatrixProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetMatrixProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of a [Matrix3D](/uwp/api/windows.ui.xaml.media.media3d.matrix3d) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Matrix3D](/uwp/api/windows.ui.xaml.media.media3d.matrix3d) property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Matrix3D} value [Matrix3D](/uwp/api/windows.ui.xaml.media.media3d.matrix3d) value to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setmatrix3dproperty
     */
    SetMatrix3DProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetMatrix3DProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Sets the value of an _Enum_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Enum_ property to set the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @param {Integer} value Cast the desired _Enum_ value to a _UInt32_ to set to the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.setenumproperty
     */
    SetEnumProperty(xamlDirectObject, propertyIndex, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.SetEnumProperty(xamlDirectObject, propertyIndex, value)
    }

    /**
     * Gets the value of an _object_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _object_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getobjectproperty
     */
    GetObjectProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetObjectProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of an [IXamlDirectObject](ixamldirectobject.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [IXamlDirectObject](ixamldirectobject.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {IXamlDirectObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getxamldirectobjectproperty
     */
    GetXamlDirectObjectProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetXamlDirectObjectProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a _Boolean_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Boolean_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getbooleanproperty
     */
    GetBooleanProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetBooleanProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a _Double_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Double_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getdoubleproperty
     */
    GetDoubleProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetDoubleProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of an _Int32_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Int32_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getint32property
     */
    GetInt32Property(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetInt32Property(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a _string_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _string_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getstringproperty
     */
    GetStringProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetStringProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a _DateTimeOffset_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _DateTimeOffset_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {DateTime} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getdatetimeproperty
     */
    GetDateTimeProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetDateTimeProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Point](../windows.foundation/point.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Point](../windows.foundation/point.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getpointproperty
     */
    GetPointProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetPointProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Rect](../windows.foundation/rect.md)  property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Rect](../windows.foundation/rect.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getrectproperty
     */
    GetRectProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetRectProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Size](../windows.foundation/size.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Size](../windows.foundation/size.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getsizeproperty
     */
    GetSizeProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetSizeProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a _TimeSpan_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _TimeSpan_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {TimeSpan} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.gettimespanproperty
     */
    GetTimeSpanProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetTimeSpanProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Color](../windows.ui/color.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Color](../windows.ui/color.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Color} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getcolorproperty
     */
    GetColorProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetColorProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [CornerRadius](../windows.ui.xaml/cornerradius.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [CornerRadius](../windows.ui.xaml/cornerradius.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {CornerRadius} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getcornerradiusproperty
     */
    GetCornerRadiusProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetCornerRadiusProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a _Duration_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Duration_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Duration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getdurationproperty
     */
    GetDurationProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetDurationProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [GridLength](../windows.ui.xaml/gridlength.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [GridLength](../windows.ui.xaml/gridlength.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {GridLength} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getgridlengthproperty
     */
    GetGridLengthProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetGridLengthProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Thickness](../windows.ui.xaml/thickness.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Thickness](../windows.ui.xaml/thickness.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Thickness} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getthicknessproperty
     */
    GetThicknessProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetThicknessProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Matrix](../windows.ui.xaml.media/matrix.md) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Matrix](../windows.ui.xaml.media/matrix.md) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Matrix} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getmatrixproperty
     */
    GetMatrixProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetMatrixProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of a [Matrix3D](/uwp/api/windows.ui.xaml.media.media3d.matrix3d) property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the [Matrix3D](/uwp/api/windows.ui.xaml.media.media3d.matrix3d) property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Matrix3D} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getmatrix3dproperty
     */
    GetMatrix3DProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetMatrix3DProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Gets the value of an _Enum_ property for a specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the _Enum_ property to get the value of from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getenumproperty
     */
    GetEnumProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetEnumProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Clears the value of the specified property on a given [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject A reference to the specific [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} propertyIndex A reference to the property to be cleared from the list of supported properties in [XamlPropertyIndex](xamlpropertyindex.md) enum.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.clearproperty
     */
    ClearProperty(xamlDirectObject, propertyIndex) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.ClearProperty(xamlDirectObject, propertyIndex)
    }

    /**
     * Returns the count of items in the specified [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getcollectioncount
     */
    GetCollectionCount(xamlDirectObject) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetCollectionCount(xamlDirectObject)
    }

    /**
     * Returns the [IXamlDirectObject](ixamldirectobject.md) item at the specified index from the specified [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {Integer} index Refers to the index in the collection of the item to get.
     * @returns {IXamlDirectObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.getxamldirectobjectfromcollectionat
     */
    GetXamlDirectObjectFromCollectionAt(xamlDirectObject, index) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.GetXamlDirectObjectFromCollectionAt(xamlDirectObject, index)
    }

    /**
     * Adds a value to the specified [IXamlDirectObject](ixamldirectobject.md) collection.
     * @remarks
     * [IXamlDirectObject](ixamldirectobject.md) is the minimal handle to Xaml's internal object instances. Hence the collection and the value to add to the collection are both of type [IXamlDirectObject](ixamldirectobject.md).
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {IXamlDirectObject} value Refers to the [IXamlDirectObject](ixamldirectobject.md) value to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.addtocollection
     */
    AddToCollection(xamlDirectObject, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.AddToCollection(xamlDirectObject, value)
    }

    /**
     * Inserts a value into the specified [IXamlDirectObject](ixamldirectobject.md) collection at the specified index.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {Integer} index Refers to the index in the collection where the specified value must be inserted.
     * @param {IXamlDirectObject} value Refers to the [IXamlDirectObject](ixamldirectobject.md) value to add to the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.insertintocollectionat
     */
    InsertIntoCollectionAt(xamlDirectObject, index, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.InsertIntoCollectionAt(xamlDirectObject, index, value)
    }

    /**
     * Tries to remove a value from the specified [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {IXamlDirectObject} value Refers to the [IXamlDirectObject](ixamldirectobject.md) value to remove from the collection.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.removefromcollection
     */
    RemoveFromCollection(xamlDirectObject, value) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.RemoveFromCollection(xamlDirectObject, value)
    }

    /**
     * Tries to remove a value from the [IXamlDirectObject](ixamldirectobject.md) collection at the specified index.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {Integer} index Refers to the index in the collection where the value must be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.removefromcollectionat
     */
    RemoveFromCollectionAt(xamlDirectObject, index) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.RemoveFromCollectionAt(xamlDirectObject, index)
    }

    /**
     * Removes all items from the specified [IXamlDirectObject](ixamldirectobject.md) collection.
     * @param {IXamlDirectObject} xamlDirectObject Refers to the specific [IXamlDirectObject](ixamldirectobject.md) collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.clearcollection
     */
    ClearCollection(xamlDirectObject) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.ClearCollection(xamlDirectObject)
    }

    /**
     * Adds the specified event handler for a specified event using [XamlEventIndex](xamleventindex.md), adding the handler to the handler collection on the current [IXamlDirectObject](ixamldirectobject.md).
     * @remarks
     * AddEventHandler can only be used to add event handlers for the events supported by the [XamlEventIndex](xamleventindex.md) enumeration. You can use this method to add handlers to routed as well non-routed events supported by the xaml object.
     * @param {IXamlDirectObject} xamlDirectObject A reference to the current [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} eventIndex An identifier for the event to be handled specified through [XamlEventIndex](xamleventindex.md) enum.
     * @param {IInspectable} handler A reference to the specified handler implementation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.addeventhandler
     */
    AddEventHandler(xamlDirectObject, eventIndex, handler) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.AddEventHandler(xamlDirectObject, eventIndex, handler)
    }

    /**
     * Adds the specified event handler for a specified event using [XamlEventIndex](xamleventindex.md), adding the handler to the handler collection on the current [IXamlDirectObject](ixamldirectobject.md). Specify *handledEventsToo* as true to have the provided handler be invoked even if the event is handled elsewhere.
     * @remarks
     * AddEventHandler can only be used to add event handlers for the events supported by the [XamlEventIndex](xamleventindex.md) enumeration. You can use this method to add handlers to routed as well non-routed events supported by the xaml object.
     * 
     * See [UIElement.AddHandler](../windows.ui.xaml/uielement_addhandler_2121467075.md) for when to use _handledEventsToo_ and the restrictions around the same. For non-routed events, the _handleEventsToo_ flag is completely ignored.
     * @param {IXamlDirectObject} xamlDirectObject A reference to the current [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} eventIndex An identifier for the event to be handled specified through [XamlEventIndex](xamleventindex.md) enum.
     * @param {IInspectable} handler A reference to the specified handler implementation.
     * @param {Boolean} handledEventsToo **true** to register the handler such that it is invoked even when the routed event is marked handled in its event data.
     * **false** to register the handler with the default condition that it will not be invoked if the routed event is already marked handled. 
     * 
     * The default is false and the parameter is optional.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.addeventhandler
     */
    AddEventHandler_HandledEventsToo(xamlDirectObject, eventIndex, handler, handledEventsToo) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.AddEventHandler_HandledEventsToo(xamlDirectObject, eventIndex, handler, handledEventsToo)
    }

    /**
     * Removes the specified event handler from this [IXamlDirectObject](ixamldirectobject.md). Typically, the handler in question was added by [XamlDirect.AddEventHandler](xamldirect_addeventhandler_1323041406.md).
     * @remarks
     * RemoveEventHandler can only be used to remove event handlers for the events supported by the [XamlEventIndex](xamleventindex.md) enumeration. 
     * 
     * Calling this method has no effect if there were no handlers registered with criteria that match the input parameters for the method call.
     * 
     * This method ignores whether _handledEventsToo_ parameter was true in the [XamlDirect.AddEventHandler](xamldirect_addeventhandler_1323041406.md) call that originally attached the handler.
     * @param {IXamlDirectObject} xamlDirectObject A reference to the current [IXamlDirectObject](ixamldirectobject.md).
     * @param {Integer} eventIndex An identifier for the event to remove the handle for specified through [XamlEventIndex](xamleventindex.md) enum.
     * @param {IInspectable} handler A reference to the specified handler implementation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.xamldirect.removeeventhandler
     */
    RemoveEventHandler(xamlDirectObject, eventIndex, handler) {
        if (!this.HasProp("__IXamlDirect")) {
            if ((queryResult := this.QueryInterface(IXamlDirect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlDirect := IXamlDirect(outPtr)
        }

        return this.__IXamlDirect.RemoveEventHandler(xamlDirectObject, eventIndex, handler)
    }

;@endregion Instance Methods
}
