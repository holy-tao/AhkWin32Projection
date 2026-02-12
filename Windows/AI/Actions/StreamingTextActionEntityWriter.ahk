#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamingTextActionEntityWriter.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs for streaming the text content of a [StreamingTextActionEntity](streamingtextactionentity.md).
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateStreamingTextActionEntityWriter](actionentityfactory_createstreamingtextactionentitywriter_700016466.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitywriter
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class StreamingTextActionEntityWriter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamingTextActionEntityWriter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamingTextActionEntityWriter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an instance of  the [StreamingTextActionEntity](streamingtextactionentity.md) class that is used for reading the streaming text content written by calls to [SetText](streamingtextactionentitywriter_settext_908345632.md)
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitywriter.readerentity
     * @type {StreamingTextActionEntity} 
     */
    ReaderEntity {
        get => this.get_ReaderEntity()
    }

    /**
     * Gets the text format of the **StreamingTextActionEntityWriter**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitywriter.textformat
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

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {StreamingTextActionEntity} 
     */
    get_ReaderEntity() {
        if (!this.HasProp("__IStreamingTextActionEntityWriter")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntityWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntityWriter := IStreamingTextActionEntityWriter(outPtr)
        }

        return this.__IStreamingTextActionEntityWriter.get_ReaderEntity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextFormat() {
        if (!this.HasProp("__IStreamingTextActionEntityWriter")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntityWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntityWriter := IStreamingTextActionEntityWriter(outPtr)
        }

        return this.__IStreamingTextActionEntityWriter.get_TextFormat()
    }

    /**
     * Sets the current text of the associated [StreamingTextActionEntity](streamingtextactionentity.md).
     * @param {HSTRING} text The current text of the **StreamingTextActionEntity**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitywriter.settext
     */
    SetText(text) {
        if (!this.HasProp("__IStreamingTextActionEntityWriter")) {
            if ((queryResult := this.QueryInterface(IStreamingTextActionEntityWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamingTextActionEntityWriter := IStreamingTextActionEntityWriter(outPtr)
        }

        return this.__IStreamingTextActionEntityWriter.SetText(text)
    }

    /**
     * Closes and releases any resources used by this **StreamingTextActionEntityWriter**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.streamingtextactionentitywriter.close
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
