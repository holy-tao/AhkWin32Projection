#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HotspotCredentialsAuthenticationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IHotspotAuthenticationContext2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHotspotAuthenticationContext2
     * @type {Guid}
     */
    static IID => Guid("{e756c791-1004-4de5-83c7-de61d88831d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IssueCredentialsAsync"]

    /**
     * 
     * @param {HSTRING} userName 
     * @param {HSTRING} password 
     * @param {HSTRING} extraParameters 
     * @param {Boolean} markAsManualConnectOnFailure 
     * @returns {IAsyncOperation<HotspotCredentialsAuthenticationResult>} 
     */
    IssueCredentialsAsync(userName, password, extraParameters, markAsManualConnectOnFailure) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password
        if(extraParameters is String) {
            pin := HSTRING.Create(extraParameters)
            extraParameters := pin.Value
        }
        extraParameters := extraParameters is Win32Handle ? NumGet(extraParameters, "ptr") : extraParameters

        result := ComCall(6, this, "ptr", userName, "ptr", password, "ptr", extraParameters, "int", markAsManualConnectOnFailure, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HotspotCredentialsAuthenticationResult, asyncInfo)
    }
}
