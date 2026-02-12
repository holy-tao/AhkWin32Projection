#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastBackgroundService.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{deebab35-ec5e-4d8f-b1c0-5da6e8c75638}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundService"]

    /**
     * @type {AppBroadcastBackgroundService} 
     */
    BackgroundService {
        get => this.get_BackgroundService()
    }

    /**
     * 
     * @returns {AppBroadcastBackgroundService} 
     */
    get_BackgroundService() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastBackgroundService(value)
    }
}
