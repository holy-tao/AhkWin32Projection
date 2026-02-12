#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextInputService.ahk
#Include .\ITextInputServiceStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextInputService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextInputService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextInputService.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TextInputService} 
     */
    static GetForCurrentThread() {
        if (!TextInputService.HasProp("__ITextInputServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Preview.Text.TextInputService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextInputServiceStatics.IID)
            TextInputService.__ITextInputServiceStatics := ITextInputServiceStatics(factoryPtr)
        }

        return TextInputService.__ITextInputServiceStatics.GetForCurrentThread()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} inputProfile 
     * @returns {KeyboardInputProcessor} 
     */
    CreateKeyboardInputProcessor(inputProfile) {
        if (!this.HasProp("__ITextInputService")) {
            if ((queryResult := this.QueryInterface(ITextInputService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputService := ITextInputService(outPtr)
        }

        return this.__ITextInputService.CreateKeyboardInputProcessor(inputProfile)
    }

    /**
     * 
     * @param {HSTRING} inputProfile 
     * @returns {TextInputProvider} 
     */
    CreateTextInputProvider(inputProfile) {
        if (!this.HasProp("__ITextInputService")) {
            if ((queryResult := this.QueryInterface(ITextInputService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputService := ITextInputService(outPtr)
        }

        return this.__ITextInputService.CreateTextInputProvider(inputProfile)
    }

;@endregion Instance Methods
}
