#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IStreamingTextActionEntity.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\StreamingTextActionEntity.ahk
#Include .\StreamingTextActionEntityTextChangedArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that enables incremental streaming text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class StreamingTextActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamingTextActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamingTextActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the text provided by the **StreamingTextActionEntity** is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentity.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the text format of the **StreamingTextActionEntity**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentity.textformat
     * @type {Integer} 
     */
    TextFormat {
        get => this.get_TextFormat()
    }

    /**
     * Raised when the text content of a **StreamingTextActionEntity** has changed.
     * @type {TypedEventHandler<StreamingTextActionEntity, StreamingTextActionEntityTextChangedArgs>}
    */
    OnTextChanged {
        get {
            if(!this.HasProp("__OnTextChanged")){
                this.__OnTextChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9154a3ed-c383-5bdd-a8ae-fab2c13869d5}"),
                    StreamingTextActionEntity,
                    StreamingTextActionEntityTextChangedArgs
                )
                this.__OnTextChangedToken := this.add_TextChanged(this.__OnTextChanged.iface)
            }
            return this.__OnTextChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTextChangedToken")) {
            this.remove_TextChanged(this.__OnTextChangedToken)
            this.__OnTextChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IStreamingTextActionEntity")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntity := IStreamingTextActionEntity(outPtr)
        }

        return this.__IStreamingTextActionEntity.get_IsComplete()
    }

    /**
     * Gets the current text content of the **StreamingTextActionEntity**.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentity.gettext
     */
    GetText() {
        if (!this.HasProp("__IStreamingTextActionEntity")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntity := IStreamingTextActionEntity(outPtr)
        }

        return this.__IStreamingTextActionEntity.GetText()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextFormat() {
        if (!this.HasProp("__IStreamingTextActionEntity")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntity := IStreamingTextActionEntity(outPtr)
        }

        return this.__IStreamingTextActionEntity.get_TextFormat()
    }

    /**
     * 
     * @param {TypedEventHandler<StreamingTextActionEntity, StreamingTextActionEntityTextChangedArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanged(handler) {
        if (!this.HasProp("__IStreamingTextActionEntity")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntity := IStreamingTextActionEntity(outPtr)
        }

        return this.__IStreamingTextActionEntity.add_TextChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanged(token) {
        if (!this.HasProp("__IStreamingTextActionEntity")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntity := IStreamingTextActionEntity(outPtr)
        }

        return this.__IStreamingTextActionEntity.remove_TextChanged(token)
    }

;@endregion Instance Methods
}
