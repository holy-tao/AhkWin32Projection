#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTransferContentPart.ahk
#Include .\IBackgroundTransferContentPartFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a content part of a multi-part transfer request. Each BackgroundTransferContentPart object can represent either a single string of text content or a single file payload, but not both.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercontentpart
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferContentPart extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTransferContentPart

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTransferContentPart.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object that identifies the content it represents.
     * @param {HSTRING} name Identifies the content.
     * @returns {BackgroundTransferContentPart} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercontentpart.#ctor
     */
    static CreateWithName(name) {
        if (!BackgroundTransferContentPart.HasProp("__IBackgroundTransferContentPartFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundTransferContentPart")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTransferContentPartFactory.IID)
            BackgroundTransferContentPart.__IBackgroundTransferContentPartFactory := IBackgroundTransferContentPartFactory(factoryPtr)
        }

        return BackgroundTransferContentPart.__IBackgroundTransferContentPartFactory.CreateWithName(name)
    }

    /**
     * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object that identifies the file content and the name of the file that it represents.
     * @param {HSTRING} name Identifies the content.
     * @param {HSTRING} fileName The fully qualified file name, including the local path.
     * @returns {BackgroundTransferContentPart} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercontentpart.#ctor
     */
    static CreateWithNameAndFileName(name, fileName) {
        if (!BackgroundTransferContentPart.HasProp("__IBackgroundTransferContentPartFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundTransferContentPart")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTransferContentPartFactory.IID)
            BackgroundTransferContentPart.__IBackgroundTransferContentPartFactory := IBackgroundTransferContentPartFactory(factoryPtr)
        }

        return BackgroundTransferContentPart.__IBackgroundTransferContentPartFactory.CreateWithNameAndFileName(name, fileName)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundTransferContentPart")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Sets content disposition header values that indicate the nature of the information that this [BackgroundTransferContentPart](backgroundtransfercontentpart.md) represents.
     * @param {HSTRING} headerName The header name.
     * @param {HSTRING} headerValue The header value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercontentpart.setheader
     */
    SetHeader(headerName, headerValue) {
        if (!this.HasProp("__IBackgroundTransferContentPart")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferContentPart.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferContentPart := IBackgroundTransferContentPart(outPtr)
        }

        return this.__IBackgroundTransferContentPart.SetHeader(headerName, headerValue)
    }

    /**
     * Use this method to set text information that the [BackgroundTransferContentPart](backgroundtransfercontentpart.md) represents.
     * @param {HSTRING} value A string value used to represent text information. (for example, api_sig, api_key, auth_token, etc...)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercontentpart.settext
     */
    SetText(value) {
        if (!this.HasProp("__IBackgroundTransferContentPart")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferContentPart.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferContentPart := IBackgroundTransferContentPart(outPtr)
        }

        return this.__IBackgroundTransferContentPart.SetText(value)
    }

    /**
     * Sets the source file for a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) containing the file for upload.
     * @param {IStorageFile} value The source file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercontentpart.setfile
     */
    SetFile(value) {
        if (!this.HasProp("__IBackgroundTransferContentPart")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferContentPart.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferContentPart := IBackgroundTransferContentPart(outPtr)
        }

        return this.__IBackgroundTransferContentPart.SetFile(value)
    }

;@endregion Instance Methods
}
