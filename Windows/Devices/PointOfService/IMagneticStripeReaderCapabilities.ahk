#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderCapabilities
     * @type {Guid}
     */
    static IID => Guid("{7128809c-c440-44a2-a467-469175d02896}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CardAuthentication", "get_SupportedEncryptionAlgorithms", "get_AuthenticationLevel", "get_IsIsoSupported", "get_IsJisOneSupported", "get_IsJisTwoSupported", "get_PowerReportingType", "get_IsStatisticsReportingSupported", "get_IsStatisticsUpdatingSupported", "get_IsTrackDataMaskingSupported", "get_IsTransmitSentinelsSupported"]

    /**
     * @type {HSTRING} 
     */
    CardAuthentication {
        get => this.get_CardAuthentication()
    }

    /**
     * @type {Integer} 
     */
    SupportedEncryptionAlgorithms {
        get => this.get_SupportedEncryptionAlgorithms()
    }

    /**
     * @type {Integer} 
     */
    AuthenticationLevel {
        get => this.get_AuthenticationLevel()
    }

    /**
     * @type {Boolean} 
     */
    IsIsoSupported {
        get => this.get_IsIsoSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsJisOneSupported {
        get => this.get_IsJisOneSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsJisTwoSupported {
        get => this.get_IsJisTwoSupported()
    }

    /**
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsTrackDataMaskingSupported {
        get => this.get_IsTrackDataMaskingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsTransmitSentinelsSupported {
        get => this.get_IsTransmitSentinelsSupported()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CardAuthentication() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedEncryptionAlgorithms() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationLevel() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIsoSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsJisOneSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsJisTwoSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerReportingType() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrackDataMaskingSupported() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransmitSentinelsSupported() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
