#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\SizeInt32.ahk
#Include .\DisplayPresentationRate.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayModeInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayModeInfo
     * @type {Guid}
     */
    static IID => Guid("{48d513a0-f79b-5a74-a05e-da821f470868}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceResolution", "get_IsStereo", "get_SourcePixelFormat", "get_TargetResolution", "get_PresentationRate", "get_IsInterlaced", "GetWireFormatSupportedBitsPerChannel", "IsWireFormatSupported", "get_Properties"]

    /**
     * @type {SizeInt32} 
     */
    SourceResolution {
        get => this.get_SourceResolution()
    }

    /**
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * @type {Integer} 
     */
    SourcePixelFormat {
        get => this.get_SourcePixelFormat()
    }

    /**
     * @type {SizeInt32} 
     */
    TargetResolution {
        get => this.get_TargetResolution()
    }

    /**
     * @type {DisplayPresentationRate} 
     */
    PresentationRate {
        get => this.get_PresentationRate()
    }

    /**
     * @type {Boolean} 
     */
    IsInterlaced {
        get => this.get_IsInterlaced()
    }

    /**
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_SourceResolution() {
        value := SizeInt32()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourcePixelFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_TargetResolution() {
        value := SizeInt32()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DisplayPresentationRate} 
     */
    get_PresentationRate() {
        value := DisplayPresentationRate()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterlaced() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} encoding 
     * @returns {Integer} 
     */
    GetWireFormatSupportedBitsPerChannel(encoding) {
        result := ComCall(12, this, "int", encoding, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DisplayWireFormat} wireFormat 
     * @returns {Boolean} 
     */
    IsWireFormatSupported(wireFormat) {
        result := ComCall(13, this, "ptr", wireFormat, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }
}
