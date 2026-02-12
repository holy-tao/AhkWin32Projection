#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Geometry.ahk
#Include .\IGeometryGroup.ahk
#Include .\IGeometryGroupStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a composite geometry, composed of other [Geometry](geometry.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometrygroup
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class GeometryGroup extends Geometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeometryGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeometryGroup.IID

    /**
     * Identifies the [FillRule](geometrygroup_fillrule.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometrygroup.fillruleproperty
     * @type {DependencyProperty} 
     */
    static FillRuleProperty {
        get => GeometryGroup.get_FillRuleProperty()
    }

    /**
     * Identifies the [Children](geometrygroup_children.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometrygroup.childrenproperty
     * @type {DependencyProperty} 
     */
    static ChildrenProperty {
        get => GeometryGroup.get_ChildrenProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillRuleProperty() {
        if (!GeometryGroup.HasProp("__IGeometryGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GeometryGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeometryGroupStatics.IID)
            GeometryGroup.__IGeometryGroupStatics := IGeometryGroupStatics(factoryPtr)
        }

        return GeometryGroup.__IGeometryGroupStatics.get_FillRuleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildrenProperty() {
        if (!GeometryGroup.HasProp("__IGeometryGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GeometryGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeometryGroupStatics.IID)
            GeometryGroup.__IGeometryGroupStatics := IGeometryGroupStatics(factoryPtr)
        }

        return GeometryGroup.__IGeometryGroupStatics.get_ChildrenProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets how the intersecting areas of the objects contained in this [GeometryGroup](geometrygroup.md) are combined.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometrygroup.fillrule
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * Gets or sets the [GeometryCollection](geometrycollection.md) that contains the objects that define this [GeometryGroup](geometrygroup.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometrygroup.children
     * @type {GeometryCollection} 
     */
    Children {
        get => this.get_Children()
        set => this.put_Children(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [GeometryGroup](geometrygroup.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GeometryGroup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FillRule() {
        if (!this.HasProp("__IGeometryGroup")) {
            if ((queryResult := this.QueryInterface(IGeometryGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometryGroup := IGeometryGroup(outPtr)
        }

        return this.__IGeometryGroup.get_FillRule()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FillRule(value) {
        if (!this.HasProp("__IGeometryGroup")) {
            if ((queryResult := this.QueryInterface(IGeometryGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometryGroup := IGeometryGroup(outPtr)
        }

        return this.__IGeometryGroup.put_FillRule(value)
    }

    /**
     * 
     * @returns {GeometryCollection} 
     */
    get_Children() {
        if (!this.HasProp("__IGeometryGroup")) {
            if ((queryResult := this.QueryInterface(IGeometryGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometryGroup := IGeometryGroup(outPtr)
        }

        return this.__IGeometryGroup.get_Children()
    }

    /**
     * 
     * @param {GeometryCollection} value 
     * @returns {HRESULT} 
     */
    put_Children(value) {
        if (!this.HasProp("__IGeometryGroup")) {
            if ((queryResult := this.QueryInterface(IGeometryGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometryGroup := IGeometryGroup(outPtr)
        }

        return this.__IGeometryGroup.put_Children(value)
    }

;@endregion Instance Methods
}
