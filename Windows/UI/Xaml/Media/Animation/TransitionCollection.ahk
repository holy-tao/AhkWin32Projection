#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include .\Transition.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a collection of [Transition](transition.md) objects. Each [Transition](transition.md) object represents a different theme transition, part of the Windows Runtime animation library.
 * @remarks
 * TransitionCollection is used as the value type for these properties:
 * + [Border.ChildTransitions](../windows.ui.xaml.controls/border_childtransitions.md)
 * + [ContentControl.ContentTransitions](../windows.ui.xaml.controls/contentcontrol_contenttransitions.md) (on content controls such as [Button](../windows.ui.xaml.controls/button.md) or AppBar)
 * + [ContentPresenter.ContentTransitions](../windows.ui.xaml.controls/contentpresenter_contenttransitionsproperty.md)
 * + [ItemsControl.ItemContainerTransitions](../windows.ui.xaml.controls/itemscontrol_itemcontainertransitions.md) (on items controls such as [GridView](../windows.ui.xaml.controls/gridview.md), [ListBox](../windows.ui.xaml.controls/listbox.md), [ListView](../windows.ui.xaml.controls/listview.md) and [Selector](../windows.ui.xaml.controls.primitives/selector.md))
 * + [ItemsPresenter.FooterTransitions](../windows.ui.xaml.controls/itemspresenter_footertransitions.md)
 * + [ItemsPresenter.HeaderTransitions](../windows.ui.xaml.controls/itemspresenter_headertransitions.md)
 * + [ListViewBase.FooterTransitions](../windows.ui.xaml.controls/listviewbase_footertransitions.md)
 * + [ListViewBase.HeaderTransitions](../windows.ui.xaml.controls/listviewbase_headertransitions.md)
 * + [Panel.ChildrenTransitions](../windows.ui.xaml.controls/panel_childrentransitions.md) (on [Grid](../windows.ui.xaml.controls/grid.md), [StackPanel](../windows.ui.xaml.controls/stackpanel.md) and other panels)
 * + [Popup.ChildTransitions](../windows.ui.xaml.controls.primitives/popup_childtransitions.md)
 * + [SettingsFlyoutTemplateSettings.ContentTransitions](../windows.ui.xaml.controls.primitives/settingsflyouttemplatesettings_contenttransitions.md)
 * + [UIElement.Transitions](../windows.ui.xaml/uielement_transitions.md) (on hundreds of classes)
 * 
 * > [!NOTE]
 * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
 * 
 * Transition animations are preconfigured animations from the Windows Runtime animation library. Transition animations run automatically upon the conditions that the transition animation is associated with, using the property owner where the TransitionCollection is set as the target. The properties being animated vary depending on which transition you use. 
 * <!--For more info, see Transition animations and theme animations.-->
 * 
 * [VisualStateGroup.Transitions](../windows.ui.xaml/visualstategroup_transitions.md) does not use the TransitionCollection type. [VisualStateGroup.Transitions](../windows.ui.xaml/visualstategroup_transitions.md) uses a built-in collection(list or vector) of [VisualTransition](../windows.ui.xaml/visualtransition.md) objects.
 * 
 * 
 * <!--Begin NET note for IEnumerable support-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class TransitionCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVector.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size (count) of the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TransitionCollection](transitioncollection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.TransitionCollection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns the item located at the specified index.
     * @param {Integer} index The integer index for the value to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.get_Size()
    }

    /**
     * Gets an immutable view into the collection.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.getview
     */
    GetView() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.GetView()
    }

    /**
     * Retrieves the index of the specified item.
     * @param {Generic} value The value to find in the collection.
     * @param {Pointer<UInt32>} index The index of the item to find, if found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.IndexOf(value, index)
    }

    /**
     * Sets the value at the specified index to the [Transition](transition.md) value specified.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.setat
     */
    SetAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.SetAt(index, value)
    }

    /**
     * Inserts the specified item at the specified index.
     * @param {Integer} index The index at which to set the value.
     * @param {Generic} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.insertat
     */
    InsertAt(index, value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.InsertAt(index, value)
    }

    /**
     * Removes the item at the specified index.
     * @param {Integer} index The index position of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.removeat
     */
    RemoveAt(index) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.RemoveAt(index)
    }

    /**
     * Adds a new item to the collection.
     * @param {Generic} value The new item to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.append
     */
    Append(value) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.Append(value)
    }

    /**
     * Removes the last item in the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.removeatend
     */
    RemoveAtEnd() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.RemoveAtEnd()
    }

    /**
     * Removes all items from the collection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.clear
     */
    Clear() {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.Clear()
    }

    /**
     * Retrieves multiple elements in a single pass through the iterator.
     * @param {Integer} startIndex The index from which to start retrieval.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items Provides the destination for the result. Size the initial array size as a *capacity* in order to specify how many results should be retrieved.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.GetMany(startIndex, items_length, items)
    }

    /**
     * Initially clears the collection, then inserts the provided array as new items.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The new collection items.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.replaceall
     */
    ReplaceAll(items_length, items) {
        if (!this.HasProp("__IVector")) {
            piid := Guid("{e798571f-7e3e-5e1a-aa55-cbc93b83f821}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector := IVector(Transition, outPtr)
        }

        return this.__IVector.ReplaceAll(items_length, items)
    }

    /**
     * Returns the iterator for iteration over the items in the collection.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.transitioncollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{feb51398-4fdb-5112-8a9b-6a8786ca01ce}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(Transition, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
