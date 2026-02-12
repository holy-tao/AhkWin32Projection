#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INamedActionEntity.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subclass of [ActionEntity](actionentity.md) that associates the name of an entity with an entity object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.namedactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class NamedActionEntity extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INamedActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INamedActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the action entity that is the value of the [Entity](namedactionentity_entity.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.namedactionentity.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the action entity that is associated with the value in the [Name](namedactionentity_name.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.namedactionentity.entity
     * @type {ActionEntity} 
     */
    Entity {
        get => this.get_Entity()
        set => this.put_Entity(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__INamedActionEntity")) {
            if ((queryResult := this.QueryInterface(INamedActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedActionEntity := INamedActionEntity(outPtr)
        }

        return this.__INamedActionEntity.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__INamedActionEntity")) {
            if ((queryResult := this.QueryInterface(INamedActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedActionEntity := INamedActionEntity(outPtr)
        }

        return this.__INamedActionEntity.put_Name(value)
    }

    /**
     * 
     * @returns {ActionEntity} 
     */
    get_Entity() {
        if (!this.HasProp("__INamedActionEntity")) {
            if ((queryResult := this.QueryInterface(INamedActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedActionEntity := INamedActionEntity(outPtr)
        }

        return this.__INamedActionEntity.get_Entity()
    }

    /**
     * 
     * @param {ActionEntity} value 
     * @returns {HRESULT} 
     */
    put_Entity(value) {
        if (!this.HasProp("__INamedActionEntity")) {
            if ((queryResult := this.QueryInterface(INamedActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedActionEntity := INamedActionEntity(outPtr)
        }

        return this.__INamedActionEntity.put_Entity(value)
    }

    /**
     * Closes and releases any resources used by this **NamedActionEntity**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.namedactionentity.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
