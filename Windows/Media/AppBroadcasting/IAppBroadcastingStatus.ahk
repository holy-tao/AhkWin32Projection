#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastingStatusDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastingStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastingStatus
     * @type {Guid}
     */
    static IID => Guid("{1225e4df-03a1-42f8-8b80-c9228cd9cf2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanStartBroadcast", "get_Details"]

    /**
     * @type {Boolean} 
     */
    CanStartBroadcast {
        get => this.get_CanStartBroadcast()
    }

    /**
     * @type {AppBroadcastingStatusDetails} 
     */
    Details {
        get => this.get_Details()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanStartBroadcast() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppBroadcastingStatusDetails} 
     */
    get_Details() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastingStatusDetails(value)
    }
}
