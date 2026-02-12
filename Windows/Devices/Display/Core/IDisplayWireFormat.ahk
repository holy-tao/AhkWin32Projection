#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayWireFormat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayWireFormat
     * @type {Guid}
     */
    static IID => Guid("{1acc967d-872c-5a38-bbb9-1d4872b76255}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelEncoding", "get_BitsPerChannel", "get_ColorSpace", "get_Eotf", "get_HdrMetadata", "get_Properties"]

    /**
     * @type {Integer} 
     */
    PixelEncoding {
        get => this.get_PixelEncoding()
    }

    /**
     * @type {Integer} 
     */
    BitsPerChannel {
        get => this.get_BitsPerChannel()
    }

    /**
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
    }

    /**
     * @type {Integer} 
     */
    Eotf {
        get => this.get_Eotf()
    }

    /**
     * @type {Integer} 
     */
    HdrMetadata {
        get => this.get_HdrMetadata()
    }

    /**
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelEncoding() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerChannel() {
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
    get_ColorSpace() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Eotf() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HdrMetadata() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }
}
