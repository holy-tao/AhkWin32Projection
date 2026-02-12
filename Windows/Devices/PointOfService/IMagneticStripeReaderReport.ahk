#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MagneticStripeReaderTrackData.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderReport
     * @type {Guid}
     */
    static IID => Guid("{6a5b6047-99b0-4188-bef1-eddf79f78fe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CardType", "get_Track1", "get_Track2", "get_Track3", "get_Track4", "get_Properties", "get_CardAuthenticationData", "get_CardAuthenticationDataLength", "get_AdditionalSecurityInformation"]

    /**
     * @type {Integer} 
     */
    CardType {
        get => this.get_CardType()
    }

    /**
     * @type {MagneticStripeReaderTrackData} 
     */
    Track1 {
        get => this.get_Track1()
    }

    /**
     * @type {MagneticStripeReaderTrackData} 
     */
    Track2 {
        get => this.get_Track2()
    }

    /**
     * @type {MagneticStripeReaderTrackData} 
     */
    Track3 {
        get => this.get_Track3()
    }

    /**
     * @type {MagneticStripeReaderTrackData} 
     */
    Track4 {
        get => this.get_Track4()
    }

    /**
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {IBuffer} 
     */
    CardAuthenticationData {
        get => this.get_CardAuthenticationData()
    }

    /**
     * @type {Integer} 
     */
    CardAuthenticationDataLength {
        get => this.get_CardAuthenticationDataLength()
    }

    /**
     * @type {IBuffer} 
     */
    AdditionalSecurityInformation {
        get => this.get_AdditionalSecurityInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CardType() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track1() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderTrackData(value)
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track2() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderTrackData(value)
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track3() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderTrackData(value)
    }

    /**
     * 
     * @returns {MagneticStripeReaderTrackData} 
     */
    get_Track4() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagneticStripeReaderTrackData(value)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Properties() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CardAuthenticationData() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CardAuthenticationDataLength() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AdditionalSecurityInformation() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
