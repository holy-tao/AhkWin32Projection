#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyCredentialRetrievalResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a key credential retrieval.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialretrievalresult
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialRetrievalResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyCredentialRetrievalResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyCredentialRetrievalResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the key credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialretrievalresult.credential
     * @type {KeyCredential} 
     */
    Credential {
        get => this.get_Credential()
    }

    /**
     * Gets the status of the key credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialretrievalresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {KeyCredential} 
     */
    get_Credential() {
        if (!this.HasProp("__IKeyCredentialRetrievalResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialRetrievalResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialRetrievalResult := IKeyCredentialRetrievalResult(outPtr)
        }

        return this.__IKeyCredentialRetrievalResult.get_Credential()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IKeyCredentialRetrievalResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialRetrievalResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialRetrievalResult := IKeyCredentialRetrievalResult(outPtr)
        }

        return this.__IKeyCredentialRetrievalResult.get_Status()
    }

;@endregion Instance Methods
}
