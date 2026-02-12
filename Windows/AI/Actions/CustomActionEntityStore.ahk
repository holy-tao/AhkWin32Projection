#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomActionEntityStore.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ICustomActionEntityStoreFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class CustomActionEntityStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomActionEntityStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomActionEntityStore.IID

;@endregion Static Properties

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
     * @param {HSTRING} kind 
     * @returns {DateTime} 
     */
    GetLastModifiedTime(kind) {
        if (!this.HasProp("__ICustomActionEntityStore")) {
            if ((queryResult := this.QueryInterface(ICustomActionEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomActionEntityStore := ICustomActionEntityStore(outPtr)
        }

        return this.__ICustomActionEntityStore.GetLastModifiedTime(kind)
    }

    /**
     * 
     * @param {CustomTextActionEntity} entity 
     * @returns {HRESULT} 
     */
    Insert(entity) {
        if (!this.HasProp("__ICustomActionEntityStore")) {
            if ((queryResult := this.QueryInterface(ICustomActionEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomActionEntityStore := ICustomActionEntityStore(outPtr)
        }

        return this.__ICustomActionEntityStore.Insert(entity)
    }

    /**
     * 
     * @param {Integer} entities_length 
     * @param {Pointer<CustomTextActionEntity>} entities 
     * @returns {HRESULT} 
     */
    InsertMany(entities_length, entities) {
        if (!this.HasProp("__ICustomActionEntityStore")) {
            if ((queryResult := this.QueryInterface(ICustomActionEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomActionEntityStore := ICustomActionEntityStore(outPtr)
        }

        return this.__ICustomActionEntityStore.InsertMany(entities_length, entities)
    }

    /**
     * 
     * @param {HSTRING} kind 
     * @returns {HRESULT} 
     */
    Delete(kind) {
        if (!this.HasProp("__ICustomActionEntityStore")) {
            if ((queryResult := this.QueryInterface(ICustomActionEntityStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomActionEntityStore := ICustomActionEntityStore(outPtr)
        }

        return this.__ICustomActionEntityStore.Delete(kind)
    }

    /**
     * 
     * @returns {HRESULT} 
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
