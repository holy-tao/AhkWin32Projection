#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyCredentialOperationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a key credential operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialoperationresult
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyCredentialOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyCredentialOperationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result of the key credential operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialoperationresult.result
     * @type {IBuffer} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * Gets the status of the key credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialoperationresult.status
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
     * @returns {IBuffer} 
     */
    get_Result() {
        if (!this.HasProp("__IKeyCredentialOperationResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialOperationResult := IKeyCredentialOperationResult(outPtr)
        }

        return this.__IKeyCredentialOperationResult.get_Result()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IKeyCredentialOperationResult")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialOperationResult := IKeyCredentialOperationResult(outPtr)
        }

        return this.__IKeyCredentialOperationResult.get_Status()
    }

;@endregion Instance Methods
}
