#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IErrorDetails.ahk
#Include .\IErrorDetailsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an error that occurred.
 * @remarks
 * Constructed using the [CreateFromHResult](errordetails_createfromhresultasync_172714447.md) factory method.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.errordetails
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ErrorDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IErrorDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IErrorDetails.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously creates an [ErrorDetails](errordetails.md) object based on an **HRESULT** error code.
     * @param {Integer} errorCode The unique code representing the error.
     * @returns {IAsyncOperation<ErrorDetails>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.errordetails.createfromhresultasync
     */
    static CreateFromHResultAsync(errorCode) {
        if (!ErrorDetails.HasProp("__IErrorDetailsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.ErrorDetails")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IErrorDetailsStatics.IID)
            ErrorDetails.__IErrorDetailsStatics := IErrorDetailsStatics(factoryPtr)
        }

        return ErrorDetails.__IErrorDetailsStatics.CreateFromHResultAsync(errorCode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a short description of the error.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.errordetails.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets a detailed description of the error.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.errordetails.longdescription
     * @type {HSTRING} 
     */
    LongDescription {
        get => this.get_LongDescription()
    }

    /**
     * Gets the address to a help page about the error.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.errordetails.helpuri
     * @type {Uri} 
     */
    HelpUri {
        get => this.get_HelpUri()
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
    get_Description() {
        if (!this.HasProp("__IErrorDetails")) {
            if ((queryResult := this.QueryInterface(IErrorDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IErrorDetails := IErrorDetails(outPtr)
        }

        return this.__IErrorDetails.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LongDescription() {
        if (!this.HasProp("__IErrorDetails")) {
            if ((queryResult := this.QueryInterface(IErrorDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IErrorDetails := IErrorDetails(outPtr)
        }

        return this.__IErrorDetails.get_LongDescription()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_HelpUri() {
        if (!this.HasProp("__IErrorDetails")) {
            if ((queryResult := this.QueryInterface(IErrorDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IErrorDetails := IErrorDetails(outPtr)
        }

        return this.__IErrorDetails.get_HelpUri()
    }

;@endregion Instance Methods
}
