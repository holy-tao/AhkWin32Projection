#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\KeyCredentialRetrievalResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IKeyCredentialManagerCreateWithWindowStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyCredentialManagerCreateWithWindowStatics
     * @type {Guid}
     */
    static IID => Guid("{30b1b9c9-61ef-43e8-88ac-cc433b38d1a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestCreateForWindowAsync"]

    /**
     * 
     * @param {WindowId} window_ 
     * @param {HSTRING} name 
     * @param {Integer} option 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     */
    RequestCreateForWindowAsync(window_, name, option) {
        window_ := window_ is Win32Handle ? NumGet(window_, "ptr") : window_
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", window_, "ptr", name, "int", option, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialRetrievalResult, value)
    }
}
