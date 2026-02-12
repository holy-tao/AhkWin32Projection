#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentObject.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single object within the TargetedContentContainer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentobject
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentObject.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [TargetedContentObjectKind](targetedcontentobjectkind.md) object for the [TargetedContentObject](targetedcontentobject.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentobject.objectkind
     * @type {Integer} 
     */
    ObjectKind {
        get => this.get_ObjectKind()
    }

    /**
     * Gets a TargetedContentCollection object in the TargetedContentObject object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentobject.collection
     * @type {TargetedContentCollection} 
     */
    Collection {
        get => this.get_Collection()
    }

    /**
     * Gets a TargetedContentItem object in the TargetedContentObject object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentobject.item
     * @type {TargetedContentItem} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * Gets the [TargetedContentValue](targetedcontentvalue.md) object for the [TargetedContentObject](targetedcontentobject.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentobject.value
     * @type {TargetedContentValue} 
     */
    Value {
        get => this.get_Value()
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
    get_ObjectKind() {
        if (!this.HasProp("__ITargetedContentObject")) {
            if ((queryResult := this.QueryInterface(ITargetedContentObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentObject := ITargetedContentObject(outPtr)
        }

        return this.__ITargetedContentObject.get_ObjectKind()
    }

    /**
     * 
     * @returns {TargetedContentCollection} 
     */
    get_Collection() {
        if (!this.HasProp("__ITargetedContentObject")) {
            if ((queryResult := this.QueryInterface(ITargetedContentObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentObject := ITargetedContentObject(outPtr)
        }

        return this.__ITargetedContentObject.get_Collection()
    }

    /**
     * 
     * @returns {TargetedContentItem} 
     */
    get_Item() {
        if (!this.HasProp("__ITargetedContentObject")) {
            if ((queryResult := this.QueryInterface(ITargetedContentObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentObject := ITargetedContentObject(outPtr)
        }

        return this.__ITargetedContentObject.get_Item()
    }

    /**
     * 
     * @returns {TargetedContentValue} 
     */
    get_Value() {
        if (!this.HasProp("__ITargetedContentObject")) {
            if ((queryResult := this.QueryInterface(ITargetedContentObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentObject := ITargetedContentObject(outPtr)
        }

        return this.__ITargetedContentObject.get_Value()
    }

;@endregion Instance Methods
}
