#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{68a7a829-2d5f-4653-8bb0-bd2fa6bd2d87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PullCookiesAsync"]

    /**
     * 
     * @param {HSTRING} uriString 
     * @param {HSTRING} callerPFN 
     * @returns {IAsyncAction} 
     */
    PullCookiesAsync(uriString, callerPFN) {
        if(uriString is String) {
            pin := HSTRING.Create(uriString)
            uriString := pin.Value
        }
        uriString := uriString is Win32Handle ? NumGet(uriString, "ptr") : uriString
        if(callerPFN is String) {
            pin := HSTRING.Create(callerPFN)
            callerPFN := pin.Value
        }
        callerPFN := callerPFN is Win32Handle ? NumGet(callerPFN, "ptr") : callerPFN

        result := ComCall(6, this, "ptr", uriString, "ptr", callerPFN, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
