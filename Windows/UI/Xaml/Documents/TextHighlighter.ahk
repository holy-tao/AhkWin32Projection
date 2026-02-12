#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextHighlighter.ahk
#Include .\ITextHighlighterFactory.ahk
#Include .\ITextHighlighterStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an object that highlights one or more ranges of text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.texthighlighter
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class TextHighlighter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextHighlighter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextHighlighter.IID

    /**
     * Identifies the Foreground dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.texthighlighter.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => TextHighlighter.get_ForegroundProperty()
    }

    /**
     * Identifies the Background dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.texthighlighter.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => TextHighlighter.get_BackgroundProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TextHighlighter} 
     */
    static CreateInstance() {
        if (!TextHighlighter.HasProp("__ITextHighlighterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextHighlighter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextHighlighterFactory.IID)
            TextHighlighter.__ITextHighlighterFactory := ITextHighlighterFactory(factoryPtr)
        }

        return TextHighlighter.__ITextHighlighterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!TextHighlighter.HasProp("__ITextHighlighterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextHighlighter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextHighlighterStatics.IID)
            TextHighlighter.__ITextHighlighterStatics := ITextHighlighterStatics(factoryPtr)
        }

        return TextHighlighter.__ITextHighlighterStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!TextHighlighter.HasProp("__ITextHighlighterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.TextHighlighter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextHighlighterStatics.IID)
            TextHighlighter.__ITextHighlighterStatics := ITextHighlighterStatics(factoryPtr)
        }

        return TextHighlighter.__ITextHighlighterStatics.get_BackgroundProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the text ranges to highlight.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.texthighlighter.ranges
     * @type {IVector<TextRange>} 
     */
    Ranges {
        get => this.get_Ranges()
    }

    /**
     * Gets or sets the brush used to color highlighted text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.texthighlighter.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets the brush used to highlight the text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.texthighlighter.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<TextRange>} 
     */
    get_Ranges() {
        if (!this.HasProp("__ITextHighlighter")) {
            if ((queryResult := this.QueryInterface(ITextHighlighter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextHighlighter := ITextHighlighter(outPtr)
        }

        return this.__ITextHighlighter.get_Ranges()
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__ITextHighlighter")) {
            if ((queryResult := this.QueryInterface(ITextHighlighter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextHighlighter := ITextHighlighter(outPtr)
        }

        return this.__ITextHighlighter.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__ITextHighlighter")) {
            if ((queryResult := this.QueryInterface(ITextHighlighter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextHighlighter := ITextHighlighter(outPtr)
        }

        return this.__ITextHighlighter.put_Foreground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__ITextHighlighter")) {
            if ((queryResult := this.QueryInterface(ITextHighlighter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextHighlighter := ITextHighlighter(outPtr)
        }

        return this.__ITextHighlighter.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__ITextHighlighter")) {
            if ((queryResult := this.QueryInterface(ITextHighlighter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextHighlighter := ITextHighlighter(outPtr)
        }

        return this.__ITextHighlighter.put_Background(value)
    }

;@endregion Instance Methods
}
