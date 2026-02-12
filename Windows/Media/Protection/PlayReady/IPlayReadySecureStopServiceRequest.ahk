#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manages secure stop messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadysecurestopservicerequest
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadySecureStopServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadySecureStopServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{b5501ee5-01bf-4401-9677-05630a6a4cc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionID", "get_StartTime", "get_UpdateTime", "get_Stopped", "get_PublisherCertificate"]

    /**
     * Gets the secure stop session identifier property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadysecurestopservicerequest.sessionid
     * @type {Guid} 
     */
    SessionID {
        get => this.get_SessionID()
    }

    /**
     * Gets the secure stop session's start time property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadysecurestopservicerequest.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Gets the secure stop session's update/stop time property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadysecurestopservicerequest.updatetime
     * @type {DateTime} 
     */
    UpdateTime {
        get => this.get_UpdateTime()
    }

    /**
     * Gets the secure stop session's stopped flag property which indicates whether the secure stop session for this request was cleanly shut down.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadysecurestopservicerequest.stopped
     * @type {Boolean} 
     */
    Stopped {
        get => this.get_Stopped()
    }

    /**
     * Gets the current publisher certificate property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadysecurestopservicerequest.publishercertificate
     */
    PublisherCertificate {
        get => this.get_PublisherCertificate()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionID() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_UpdateTime() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Stopped() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Pointer>} publisherCertBytes 
     * @returns {HRESULT} 
     */
    get_PublisherCertificate(publisherCertBytes) {
        result := ComCall(10, this, "ptr", publisherCertBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
