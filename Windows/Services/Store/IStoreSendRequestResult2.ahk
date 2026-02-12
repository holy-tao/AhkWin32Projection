#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreSendRequestResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreSendRequestResult2
     * @type {Guid}
     */
    static IID => Guid("{2901296f-c0b0-49d0-8e8d-aa940af9c10b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HttpStatusCode"]

    /**
     * @type {Integer} 
     */
    HttpStatusCode {
        get => this.get_HttpStatusCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HttpStatusCode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
