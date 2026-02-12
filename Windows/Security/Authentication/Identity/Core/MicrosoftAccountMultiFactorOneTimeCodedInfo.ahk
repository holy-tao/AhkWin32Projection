#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMicrosoftAccountMultiFactorOneTimeCodedInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactoronetimecodedinfo
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorOneTimeCodedInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMicrosoftAccountMultiFactorOneTimeCodedInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMicrosoftAccountMultiFactorOneTimeCodedInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactoronetimecodedinfo.code
     * @type {HSTRING} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactoronetimecodedinfo.timeinterval
     * @type {TimeSpan} 
     */
    TimeInterval {
        get => this.get_TimeInterval()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactoronetimecodedinfo.timetolive
     * @type {TimeSpan} 
     */
    TimeToLive {
        get => this.get_TimeToLive()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactoronetimecodedinfo.serviceresponse
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
     * @returns {HSTRING} 
     */
    get_Code() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorOneTimeCodedInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorOneTimeCodedInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo := IMicrosoftAccountMultiFactorOneTimeCodedInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo.get_Code()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimeInterval() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorOneTimeCodedInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorOneTimeCodedInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo := IMicrosoftAccountMultiFactorOneTimeCodedInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo.get_TimeInterval()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimeToLive() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorOneTimeCodedInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorOneTimeCodedInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo := IMicrosoftAccountMultiFactorOneTimeCodedInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo.get_TimeToLive()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceResponse() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorOneTimeCodedInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorOneTimeCodedInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo := IMicrosoftAccountMultiFactorOneTimeCodedInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorOneTimeCodedInfo.get_ServiceResponse()
    }

;@endregion Instance Methods
}
