#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\ITextActionEntity.ahk
#Include .\ITextActionEntity2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a string of text.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateTextEntity](actionentityfactory_createtextentity_614258486.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.textactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class TextActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text content of the **TextActionEntity**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.textactionentity.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets the text format of the **TextActionEntity**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.textactionentity.textformat
     * @type {Integer} 
     */
    TextFormat {
        get => this.get_TextFormat()
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
    get_Text() {
        if (!this.HasProp("__ITextActionEntity")) {
            if ((queryResult := this.QueryInterface(ITextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextActionEntity := ITextActionEntity(outPtr)
        }

        return this.__ITextActionEntity.get_Text()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextFormat() {
        if (!this.HasProp("__ITextActionEntity2")) {
            if ((queryResult := this.QueryInterface(ITextActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextActionEntity2 := ITextActionEntity2(outPtr)
        }

        return this.__ITextActionEntity2.get_TextFormat()
    }

;@endregion Instance Methods
}
