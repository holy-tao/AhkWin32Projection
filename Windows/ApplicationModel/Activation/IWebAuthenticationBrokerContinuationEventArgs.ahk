#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Authentication\Web\WebAuthenticationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information to an app that was launched after being suspended for a web authentication broker operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwebauthenticationbrokercontinuationeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationBrokerContinuationEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationBrokerContinuationEventArgs
     * @type {Guid}
     */
    static IID => Guid("{75dda3d4-7714-453d-b7ff-b95e3a1709da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAuthenticationResult"]

    /**
     * Gets the [WebAuthenticationResult](../windows.security.authentication.web/webauthenticationresult.md) object returned from the web authentication broker operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwebauthenticationbrokercontinuationeventargs.webauthenticationresult
     * @type {WebAuthenticationResult} 
     */
    WebAuthenticationResult {
        get => this.get_WebAuthenticationResult()
    }

    /**
     * 
     * @returns {WebAuthenticationResult} 
     */
    get_WebAuthenticationResult() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAuthenticationResult(result_)
    }
}
