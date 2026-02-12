#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxCapabilities3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxCapabilities3
     * @type {Guid}
     */
    static IID => Guid("{f690e944-56f2-45aa-872c-0ce9f3db0b5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_CanForwardMeetings", "put_CanGetAndSetExternalAutoReplies", "put_CanGetAndSetInternalAutoReplies", "put_CanUpdateMeetingResponses", "put_CanServerSearchFolders", "put_CanServerSearchMailbox", "put_CanProposeNewTimeForMeetings", "put_CanSmartSend", "put_CanResolveRecipients", "put_CanValidateCertificates", "put_CanEmptyFolder", "put_CanCreateFolder", "put_CanDeleteFolder", "put_CanMoveFolder"]

    /**
     * @type {HRESULT} 
     */
    CanForwardMeetings {
        set => this.put_CanForwardMeetings(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanGetAndSetExternalAutoReplies {
        set => this.put_CanGetAndSetExternalAutoReplies(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanGetAndSetInternalAutoReplies {
        set => this.put_CanGetAndSetInternalAutoReplies(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanUpdateMeetingResponses {
        set => this.put_CanUpdateMeetingResponses(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanServerSearchFolders {
        set => this.put_CanServerSearchFolders(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanServerSearchMailbox {
        set => this.put_CanServerSearchMailbox(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanProposeNewTimeForMeetings {
        set => this.put_CanProposeNewTimeForMeetings(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanSmartSend {
        set => this.put_CanSmartSend(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanResolveRecipients {
        set => this.put_CanResolveRecipients(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanValidateCertificates {
        set => this.put_CanValidateCertificates(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanEmptyFolder {
        set => this.put_CanEmptyFolder(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanCreateFolder {
        set => this.put_CanCreateFolder(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanDeleteFolder {
        set => this.put_CanDeleteFolder(value)
    }

    /**
     * @type {HRESULT} 
     */
    CanMoveFolder {
        set => this.put_CanMoveFolder(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanForwardMeetings(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanGetAndSetExternalAutoReplies(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanGetAndSetInternalAutoReplies(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanUpdateMeetingResponses(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanServerSearchFolders(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanServerSearchMailbox(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanProposeNewTimeForMeetings(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSmartSend(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanResolveRecipients(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanValidateCertificates(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanEmptyFolder(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanCreateFolder(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDeleteFolder(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanMoveFolder(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
