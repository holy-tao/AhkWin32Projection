#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Networking\EndpointPair.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceRemotePortAddedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceRemotePortAddedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d4cebac1-3fd3-4f0e-b7bd-782906f44411}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EndpointPairs", "get_Protocol"]

    /**
     * @type {IVectorView<EndpointPair>} 
     */
    EndpointPairs {
        get => this.get_EndpointPairs()
    }

    /**
     * @type {Integer} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * 
     * @returns {IVectorView<EndpointPair>} 
     */
    get_EndpointPairs() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(EndpointPair, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Protocol() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
