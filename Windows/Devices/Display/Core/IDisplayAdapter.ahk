#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\DisplayAdapterId.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayAdapter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayAdapter
     * @type {Guid}
     */
    static IID => Guid("{a56f5287-f000-5f2e-b5ac-3783a2b69af5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_DeviceInterfacePath", "get_SourceCount", "get_PciVendorId", "get_PciDeviceId", "get_PciSubSystemId", "get_PciRevision", "get_Properties"]

    /**
     * @type {DisplayAdapterId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceInterfacePath {
        get => this.get_DeviceInterfacePath()
    }

    /**
     * @type {Integer} 
     */
    SourceCount {
        get => this.get_SourceCount()
    }

    /**
     * @type {Integer} 
     */
    PciVendorId {
        get => this.get_PciVendorId()
    }

    /**
     * @type {Integer} 
     */
    PciDeviceId {
        get => this.get_PciDeviceId()
    }

    /**
     * @type {Integer} 
     */
    PciSubSystemId {
        get => this.get_PciSubSystemId()
    }

    /**
     * @type {Integer} 
     */
    PciRevision {
        get => this.get_PciRevision()
    }

    /**
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_Id() {
        value := DisplayAdapterId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceInterfacePath() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciVendorId() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciDeviceId() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciSubSystemId() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PciRevision() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }
}
