#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPlayReadyLicenseAcquisitionServiceRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates a media session and binds license acquisition to that media session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicensesession
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicenseSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicenseSession
     * @type {Guid}
     */
    static IID => Guid("{a1723a39-87fa-4fdd-abbb-a9720e845259}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLAServiceRequest", "ConfigureMediaProtectionManager"]

    /**
     * Creates a license acquisition service request whose license will be tied to the media session.
     * @returns {IPlayReadyLicenseAcquisitionServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicensesession.createlaservicerequest
     */
    CreateLAServiceRequest() {
        result := ComCall(6, this, "ptr*", &serviceRequest := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPlayReadyLicenseAcquisitionServiceRequest(serviceRequest)
    }

    /**
     * Updates the media protection manger with the appropriate settings so the media foundation can be used for playback.
     * @param {MediaProtectionManager} mpm The media protection manager to be updated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicensesession.configuremediaprotectionmanager
     */
    ConfigureMediaProtectionManager(mpm) {
        result := ComCall(7, this, "ptr", mpm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
