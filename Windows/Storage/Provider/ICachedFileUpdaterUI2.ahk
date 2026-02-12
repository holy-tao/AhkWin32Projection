#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FileUpdateRequest.ahk
#Include .\FileUpdateRequestDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class ICachedFileUpdaterUI2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICachedFileUpdaterUI2
     * @type {Guid}
     */
    static IID => Guid("{8856a21c-8699-4340-9f49-f7cad7fe8991}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UpdateRequest", "GetDeferral"]

    /**
     * @type {FileUpdateRequest} 
     */
    UpdateRequest {
        get => this.get_UpdateRequest()
    }

    /**
     * 
     * @returns {FileUpdateRequest} 
     */
    get_UpdateRequest() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileUpdateRequest(value)
    }

    /**
     * 
     * @returns {FileUpdateRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileUpdateRequestDeferral(value)
    }
}
