#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionEntity.ahk
#Include .\IActionEntity2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IActionEntityFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The base class for all entity types.
 * @remarks
 * App Actions on Windows defines several different entity types for different kinds of content. Each supported type has a dedicated subclass of **ActionEntity** that exposes properties specific to the type of content they represent. Supported action entity subclasses include the following:
 * 
 * - [DocumentActionEntity](documentactionentity.md)
 * - [FileActionEntity](fileactionentity.md)
 * - [NamedActionEntity](namedactionentity.md)
 * - [PhotoActionEntity](photoactionentity.md)
 * - [RemoteFileActionEntity](remotefileactionentity.md)
 * - [StreamingTextActionEntity](streamingtextactionentity.md)
 * - [TextActionEntity](textactionentity.md)
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionEntity extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying what kind of entity this **ActionEntity** is.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentity.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets an object that contains the display information for the **ActionEntity**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentity.displayinfo
     * @type {ActionEntityDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * Gets the unique identifier for the **ActionEntity**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentity.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
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
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActionEntity")) {
            if ((queryResult := this.QueryInterface(IActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntity := IActionEntity(outPtr)
        }

        return this.__IActionEntity.get_Kind()
    }

    /**
     * 
     * @returns {ActionEntityDisplayInfo} 
     */
    get_DisplayInfo() {
        if (!this.HasProp("__IActionEntity")) {
            if ((queryResult := this.QueryInterface(IActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntity := IActionEntity(outPtr)
        }

        return this.__IActionEntity.get_DisplayInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IActionEntity2")) {
            if ((queryResult := this.QueryInterface(IActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntity2 := IActionEntity2(outPtr)
        }

        return this.__IActionEntity2.get_Id()
    }

    /**
     * Closes and releases any resources used by this **ActionEntity**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentity.close
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
