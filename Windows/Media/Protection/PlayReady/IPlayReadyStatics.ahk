#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyStatics
     * @type {Guid}
     */
    static IID => Guid("{5e69c00d-247c-469a-8f31-5c1a1571d9c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DomainJoinServiceRequestType", "get_DomainLeaveServiceRequestType", "get_IndividualizationServiceRequestType", "get_LicenseAcquirerServiceRequestType", "get_MeteringReportServiceRequestType", "get_RevocationServiceRequestType", "get_MediaProtectionSystemId", "get_PlayReadySecurityVersion"]

    /**
     * @type {Guid} 
     */
    DomainJoinServiceRequestType {
        get => this.get_DomainJoinServiceRequestType()
    }

    /**
     * @type {Guid} 
     */
    DomainLeaveServiceRequestType {
        get => this.get_DomainLeaveServiceRequestType()
    }

    /**
     * @type {Guid} 
     */
    IndividualizationServiceRequestType {
        get => this.get_IndividualizationServiceRequestType()
    }

    /**
     * @type {Guid} 
     */
    LicenseAcquirerServiceRequestType {
        get => this.get_LicenseAcquirerServiceRequestType()
    }

    /**
     * @type {Guid} 
     */
    MeteringReportServiceRequestType {
        get => this.get_MeteringReportServiceRequestType()
    }

    /**
     * @type {Guid} 
     */
    RevocationServiceRequestType {
        get => this.get_RevocationServiceRequestType()
    }

    /**
     * @type {Guid} 
     */
    MediaProtectionSystemId {
        get => this.get_MediaProtectionSystemId()
    }

    /**
     * @type {Integer} 
     */
    PlayReadySecurityVersion {
        get => this.get_PlayReadySecurityVersion()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainJoinServiceRequestType() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainLeaveServiceRequestType() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_IndividualizationServiceRequestType() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LicenseAcquirerServiceRequestType() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_MeteringReportServiceRequestType() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RevocationServiceRequestType() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_MediaProtectionSystemId() {
        value := Guid()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlayReadySecurityVersion() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
