#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FileUpdateRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IFileUpdateRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileUpdateRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7b0a9342-3905-438d-aaef-78ae265f8dd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request"]

    /**
     * @type {FileUpdateRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {FileUpdateRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileUpdateRequest(value)
    }
}
