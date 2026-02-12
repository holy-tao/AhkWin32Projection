#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UserCertificateStore.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateStoresStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateStoresStatics2
     * @type {Guid}
     */
    static IID => Guid("{fa900b79-a0d4-4b8c-bc55-c0a37eb141ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserStoreByName"]

    /**
     * 
     * @param {HSTRING} storeName 
     * @returns {UserCertificateStore} 
     */
    GetUserStoreByName(storeName) {
        if(storeName is String) {
            pin := HSTRING.Create(storeName)
            storeName := pin.Value
        }
        storeName := storeName is Win32Handle ? NumGet(storeName, "ptr") : storeName

        result := ComCall(6, this, "ptr", storeName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserCertificateStore(result_)
    }
}
