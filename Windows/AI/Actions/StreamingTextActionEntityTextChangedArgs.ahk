#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamingTextActionEntityTextChangedArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [StreamingTextActionEntity.TextChanged](streamingtextactionentity_textchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitytextchangedargs
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class StreamingTextActionEntityTextChangedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamingTextActionEntityTextChangedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamingTextActionEntityTextChangedArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current text content of the [StreamingTextActionEntity](streamingtextactionentity.md) associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitytextchangedargs.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets a value indicating whether the text provided by the [StreamingTextActionEntity](streamingtextactionentity.md) is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitytextchangedargs.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
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
        if (!this.HasProp("__IStreamingTextActionEntityTextChangedArgs")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntityTextChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntityTextChangedArgs := IStreamingTextActionEntityTextChangedArgs(outPtr)
        }

        return this.__IStreamingTextActionEntityTextChangedArgs.get_Text()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IStreamingTextActionEntityTextChangedArgs")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntityTextChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntityTextChangedArgs := IStreamingTextActionEntityTextChangedArgs(outPtr)
        }

        return this.__IStreamingTextActionEntityTextChangedArgs.get_IsComplete()
    }

;@endregion Instance Methods
}
