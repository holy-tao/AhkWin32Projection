#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\CompositionAnimation.ahk
#Include .\ICompositionAnimationGroup.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a group of animations.
  * 
  * CompositionAnimationGroup provides a way to group [CompositionAnimation](compositionanimation.md)s in a list which will be started at the same time when [StartAnimationGroup](compositionobject_startanimationgroup_696523374.md) is called on [CompositionObject](compositionobject.md). All CompositionAnimation in CompositionAnimationGroup need to assign a value to the [Target](compositionanimation_target.md) property in the animation itself. CompositionAnimationGroup can also be associated with [ImplicitAnimationCollection](implicitanimationcollection.md) as an animation that gets executed as a result of a trigger.
 * @remarks
 * CompositionAnimationGroup is a list of [CompositionAnimation](compositionanimation.md). Different [CompositionAnimation](compositionanimation.md)s can be added to the group and can be used in [ImplicitAnimationCollection](implicitanimationcollection.md) or start the group using Visual.StartAnimationGroup(CompositionAnimationGroup).
 * 
 * All the [CompositionAnimation](compositionanimation.md)s in CompositionAnimationGroup should have target property assigned as part of animation template.
 * 
 * If CompositionAnimationGroup is changed while iterating the animations in the group, an InvalidOperationException will be thrown.
 * 
 * Use the [CompostionObject.StartAnimationGroup](compositionobject_startanimationgroup_696523374.md) and [CompostionObject.StopAnimationGroup](compositionobject_stopanimationgroup_293483380.md) methods to start and stop the animation group.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimationgroup
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionAnimationGroup extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionAnimationGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionAnimationGroup.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The number of animations in the group.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimationgroup.count
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        if (!this.HasProp("__ICompositionAnimationGroup")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimationGroup := ICompositionAnimationGroup(outPtr)
        }

        return this.__ICompositionAnimationGroup.get_Count()
    }

    /**
     * Adds an animation to the animation group.
     * @param {CompositionAnimation} value The animation to add to the group.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimationgroup.add
     */
    Add(value) {
        if (!this.HasProp("__ICompositionAnimationGroup")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimationGroup := ICompositionAnimationGroup(outPtr)
        }

        return this.__ICompositionAnimationGroup.Add(value)
    }

    /**
     * Removes an animation from the animation group.
     * @param {CompositionAnimation} value The animation to remove from the group.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimationgroup.remove
     */
    Remove(value) {
        if (!this.HasProp("__ICompositionAnimationGroup")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimationGroup := ICompositionAnimationGroup(outPtr)
        }

        return this.__ICompositionAnimationGroup.Remove(value)
    }

    /**
     * Removes all animations from the group.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimationgroup.removeall
     */
    RemoveAll() {
        if (!this.HasProp("__ICompositionAnimationGroup")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimationGroup := ICompositionAnimationGroup(outPtr)
        }

        return this.__ICompositionAnimationGroup.RemoveAll()
    }

    /**
     * Retrieves the first animation in the group.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimationgroup.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{0cb59942-c6f3-585f-9a92-b47e8dd38ebf}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(CompositionAnimation, outPtr)
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
