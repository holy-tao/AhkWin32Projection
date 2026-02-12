#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class IDevicePortalWebSocketConnectionRequestReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePortalWebSocketConnectionRequestReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{79fdcaba-175c-4739-9f74-dda797c35b3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsWebSocketUpgradeRequest", "get_WebSocketProtocolsRequested", "GetDeferral"]

    /**
     * @type {Boolean} 
     */
    IsWebSocketUpgradeRequest {
        get => this.get_IsWebSocketUpgradeRequest()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    WebSocketProtocolsRequested {
        get => this.get_WebSocketProtocolsRequested()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWebSocketUpgradeRequest() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_WebSocketProtocolsRequested() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}
