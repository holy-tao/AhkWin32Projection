#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PlayReadyContentHeader.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Performs a license acquisition process.
 * @remarks
 * The license can be created proactively, returned from a previous service request operation, or delivered to the app using the **MediaProtectionManager.ServiceRequested** event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicenseacquisitionservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicenseAcquisitionServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicenseAcquisitionServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{5d85ff45-3e9f-4f48-93e1-9530c8d58c3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentHeader", "put_ContentHeader", "get_DomainServiceId", "put_DomainServiceId"]

    /**
     * Gets the current content header property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicenseacquisitionservicerequest.contentheader
     * @type {PlayReadyContentHeader} 
     */
    ContentHeader {
        get => this.get_ContentHeader()
        set => this.put_ContentHeader(value)
    }

    /**
     * Gets the current domain service identifier property that overrides a service identifier in the content header.
     * @remarks
     * This property is sensitive to the underlying platform's endianness. Carefully test your app on all platforms you intend to support to ensure that correct endianness is used on each platform.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicenseacquisitionservicerequest.domainserviceid
     * @type {Guid} 
     */
    DomainServiceId {
        get => this.get_DomainServiceId()
        set => this.put_DomainServiceId(value)
    }

    /**
     * 
     * @returns {PlayReadyContentHeader} 
     */
    get_ContentHeader() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyContentHeader(value)
    }

    /**
     * 
     * @param {PlayReadyContentHeader} value 
     * @returns {HRESULT} 
     */
    put_ContentHeader(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainServiceId() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_DomainServiceId(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
