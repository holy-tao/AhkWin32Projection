#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SocketActivityInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ISocketActivityInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocketActivityInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{8570b47a-7e7d-4736-8041-1327a6543c56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllSockets"]

    /**
     * @type {IMapView<HSTRING, SocketActivityInformation>} 
     */
    AllSockets {
        get => this.get_AllSockets()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, SocketActivityInformation>} 
     */
    get_AllSockets() {
        result := ComCall(6, this, "ptr*", &sockets := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), SocketActivityInformation, sockets)
    }
}
