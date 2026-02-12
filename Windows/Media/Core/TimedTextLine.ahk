#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextLine.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a line of text that is displayed with a [TimedTextCue](timedtextcue.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextline
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextLine extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextLine

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextLine.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text content of the [TimedTextLine](timedtextlinealignment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextline.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets a list of [TimedTextSubformat](timedtextsubformat.md) objects that provide formatting for substrings within the [TimedTextLine](timedtextlinealignment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextline.subformats
     * @type {IVector<TimedTextSubformat>} 
     */
    Subformats {
        get => this.get_Subformats()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimedTextLine](timedtextline.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextLine")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ITimedTextLine")) {
            if ((queryResult := this.QueryInterface(ITimedTextLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextLine := ITimedTextLine(outPtr)
        }

        return this.__ITimedTextLine.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ITimedTextLine")) {
            if ((queryResult := this.QueryInterface(ITimedTextLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextLine := ITimedTextLine(outPtr)
        }

        return this.__ITimedTextLine.put_Text(value)
    }

    /**
     * 
     * @returns {IVector<TimedTextSubformat>} 
     */
    get_Subformats() {
        if (!this.HasProp("__ITimedTextLine")) {
            if ((queryResult := this.QueryInterface(ITimedTextLine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextLine := ITimedTextLine(outPtr)
        }

        return this.__ITimedTextLine.get_Subformats()
    }

;@endregion Instance Methods
}
