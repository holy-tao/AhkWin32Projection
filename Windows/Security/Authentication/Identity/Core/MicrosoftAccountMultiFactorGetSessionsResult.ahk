#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMicrosoftAccountMultiFactorGetSessionsResult.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorgetsessionsresult
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorGetSessionsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMicrosoftAccountMultiFactorGetSessionsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMicrosoftAccountMultiFactorGetSessionsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorgetsessionsresult.sessions
     * @type {IVectorView<MicrosoftAccountMultiFactorSessionInfo>} 
     */
    Sessions {
        get => this.get_Sessions()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorgetsessionsresult.serviceresponse
     * @type {Integer} 
     */
    ServiceResponse {
        get => this.get_ServiceResponse()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MicrosoftAccountMultiFactorSessionInfo>} 
     */
    get_Sessions() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorGetSessionsResult")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorGetSessionsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorGetSessionsResult := IMicrosoftAccountMultiFactorGetSessionsResult(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorGetSessionsResult.get_Sessions()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceResponse() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorGetSessionsResult")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorGetSessionsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorGetSessionsResult := IMicrosoftAccountMultiFactorGetSessionsResult(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorGetSessionsResult.get_ServiceResponse()
    }

;@endregion Instance Methods
}
