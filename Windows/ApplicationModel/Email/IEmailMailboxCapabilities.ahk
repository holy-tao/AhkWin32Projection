#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxCapabilities
     * @type {Guid}
     */
    static IID => Guid("{eedec3a6-89db-4305-82c4-439e0a33da11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanForwardMeetings", "get_CanGetAndSetExternalAutoReplies", "get_CanGetAndSetInternalAutoReplies", "get_CanUpdateMeetingResponses", "get_CanServerSearchFolders", "get_CanServerSearchMailbox", "get_CanProposeNewTimeForMeetings", "get_CanSmartSend"]

    /**
     * @type {Boolean} 
     */
    CanForwardMeetings {
        get => this.get_CanForwardMeetings()
    }

    /**
     * @type {Boolean} 
     */
    CanGetAndSetExternalAutoReplies {
        get => this.get_CanGetAndSetExternalAutoReplies()
    }

    /**
     * @type {Boolean} 
     */
    CanGetAndSetInternalAutoReplies {
        get => this.get_CanGetAndSetInternalAutoReplies()
    }

    /**
     * @type {Boolean} 
     */
    CanUpdateMeetingResponses {
        get => this.get_CanUpdateMeetingResponses()
    }

    /**
     * @type {Boolean} 
     */
    CanServerSearchFolders {
        get => this.get_CanServerSearchFolders()
    }

    /**
     * @type {Boolean} 
     */
    CanServerSearchMailbox {
        get => this.get_CanServerSearchMailbox()
    }

    /**
     * @type {Boolean} 
     */
    CanProposeNewTimeForMeetings {
        get => this.get_CanProposeNewTimeForMeetings()
    }

    /**
     * @type {Boolean} 
     */
    CanSmartSend {
        get => this.get_CanSmartSend()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanForwardMeetings() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGetAndSetExternalAutoReplies() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanGetAndSetInternalAutoReplies() {
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
    get_CanUpdateMeetingResponses() {
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
    get_CanServerSearchFolders() {
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
    get_CanServerSearchMailbox() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanProposeNewTimeForMeetings() {
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
    get_CanSmartSend() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
