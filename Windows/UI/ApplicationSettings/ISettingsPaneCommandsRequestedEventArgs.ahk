#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SettingsPaneCommandsRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class ISettingsPaneCommandsRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsPaneCommandsRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{205f5d24-1b48-4629-a6ca-2fdfedafb75d}")

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
     * @type {SettingsPaneCommandsRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {SettingsPaneCommandsRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &request := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SettingsPaneCommandsRequest(request)
    }
}
