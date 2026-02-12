#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxReceiptOptions interface defines a FaxReceiptOptions configuration object used by a fax client application to set and retrieve the receipt configuration that the fax service uses to send delivery receipts for fax transmissions.
 * @remarks
 * A default implementation of <b>IFaxReceiptOptions</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxreceiptoptions">FaxReceiptOptions</a> object.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxreceiptoptions
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxReceiptOptions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxReceiptOptions
     * @type {Guid}
     */
    static IID => Guid("{378efaeb-5fcb-4afb-b2ee-e16e80614487}")

    /**
     * The class identifier for FaxReceiptOptions
     * @type {Guid}
     */
    static CLSID => Guid("{6982487b-227b-4c96-a61c-248348b05ab6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AuthenticationType", "put_AuthenticationType", "get_SMTPServer", "put_SMTPServer", "get_SMTPPort", "put_SMTPPort", "get_SMTPSender", "put_SMTPSender", "get_SMTPUser", "put_SMTPUser", "get_AllowedReceipts", "put_AllowedReceipts", "get_SMTPPassword", "put_SMTPPassword", "Refresh", "Save", "get_UseForInboundRouting", "put_UseForInboundRouting"]

    /**
     * @type {Integer} 
     */
    AuthenticationType {
        get => this.get_AuthenticationType()
        set => this.put_AuthenticationType(value)
    }

    /**
     * @type {BSTR} 
     */
    SMTPServer {
        get => this.get_SMTPServer()
        set => this.put_SMTPServer(value)
    }

    /**
     * @type {Integer} 
     */
    SMTPPort {
        get => this.get_SMTPPort()
        set => this.put_SMTPPort(value)
    }

    /**
     * @type {BSTR} 
     */
    SMTPSender {
        get => this.get_SMTPSender()
        set => this.put_SMTPSender(value)
    }

    /**
     * @type {BSTR} 
     */
    SMTPUser {
        get => this.get_SMTPUser()
        set => this.put_SMTPUser(value)
    }

    /**
     * @type {Integer} 
     */
    AllowedReceipts {
        get => this.get_AllowedReceipts()
        set => this.put_AllowedReceipts(value)
    }

    /**
     * @type {BSTR} 
     */
    SMTPPassword {
        get => this.get_SMTPPassword()
        set => this.put_SMTPPassword(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseForInboundRouting {
        get => this.get_UseForInboundRouting()
        set => this.put_UseForInboundRouting(value)
    }

    /**
     * The IFaxReceiptOptions::get_AuthenticationType property specifies the type of authentication the fax service uses when connecting to an Simple Mail Transport Protocol (SMTP) server. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_authenticationtype
     */
    get_AuthenticationType() {
        result := ComCall(7, this, "int*", &pType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pType
    }

    /**
     * The IFaxReceiptOptions::get_AuthenticationType property specifies the type of authentication the fax service uses when connecting to an Simple Mail Transport Protocol (SMTP) server. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_authenticationtype
     */
    put_AuthenticationType(Type) {
        result := ComCall(8, this, "int", Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_SMTPServer property is a null-terminated string that contains the name of the Simple Mail Transport Protocol (SMTP) server. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpserver
     */
    get_SMTPServer() {
        pbstrSMTPServer := BSTR()
        result := ComCall(9, this, "ptr", pbstrSMTPServer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSMTPServer
    }

    /**
     * The IFaxReceiptOptions::get_SMTPServer property is a null-terminated string that contains the name of the Simple Mail Transport Protocol (SMTP) server. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrSMTPServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpserver
     */
    put_SMTPServer(bstrSMTPServer) {
        if(bstrSMTPServer is String) {
            pin := BSTR.Alloc(bstrSMTPServer)
            bstrSMTPServer := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrSMTPServer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_SMTPPort property is a value that specifies the Simple Mail Transport Protocol (SMTP) port number. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpport
     */
    get_SMTPPort() {
        result := ComCall(11, this, "int*", &plSMTPPort := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plSMTPPort
    }

    /**
     * The IFaxReceiptOptions::get_SMTPPort property is a value that specifies the Simple Mail Transport Protocol (SMTP) port number. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lSMTPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpport
     */
    put_SMTPPort(lSMTPPort) {
        result := ComCall(12, this, "int", lSMTPPort, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_SMTPSender property is a null-terminated string that contains the Simple Mail Transport Protocol (SMTP) email address for the sender of the mail message receipt. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpsender
     */
    get_SMTPSender() {
        pbstrSMTPSender := BSTR()
        result := ComCall(13, this, "ptr", pbstrSMTPSender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSMTPSender
    }

    /**
     * The IFaxReceiptOptions::get_SMTPSender property is a null-terminated string that contains the Simple Mail Transport Protocol (SMTP) email address for the sender of the mail message receipt. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrSMTPSender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpsender
     */
    put_SMTPSender(bstrSMTPSender) {
        if(bstrSMTPSender is String) {
            pin := BSTR.Alloc(bstrSMTPSender)
            bstrSMTPSender := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrSMTPSender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_SMTPUser property is a null-terminated string that contains the Simple Mail Transport Protocol (SMTP) user name used for authenticated connections. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpuser
     */
    get_SMTPUser() {
        pbstrSMTPUser := BSTR()
        result := ComCall(15, this, "ptr", pbstrSMTPUser, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSMTPUser
    }

    /**
     * The IFaxReceiptOptions::get_SMTPUser property is a null-terminated string that contains the Simple Mail Transport Protocol (SMTP) user name used for authenticated connections. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrSMTPUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpuser
     */
    put_SMTPUser(bstrSMTPUser) {
        if(bstrSMTPUser is String) {
            pin := BSTR.Alloc(bstrSMTPUser)
            bstrSMTPUser := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrSMTPUser, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_AllowedReceipts property is a value that specifies the permitted types of delivery receipts. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_allowedreceipts
     */
    get_AllowedReceipts() {
        result := ComCall(17, this, "int*", &pAllowedReceipts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pAllowedReceipts
    }

    /**
     * The IFaxReceiptOptions::get_AllowedReceipts property is a value that specifies the permitted types of delivery receipts. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} AllowedReceipts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_allowedreceipts
     */
    put_AllowedReceipts(AllowedReceipts) {
        result := ComCall(18, this, "int", AllowedReceipts, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_SMTPPassword property is a null-terminated string that contains the Simple Mail Transport Protocol (SMTP) password used for authenticated connections. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtppassword
     */
    get_SMTPPassword() {
        pbstrSMTPPassword := BSTR()
        result := ComCall(19, this, "ptr", pbstrSMTPPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSMTPPassword
    }

    /**
     * The IFaxReceiptOptions::get_SMTPPassword property is a null-terminated string that contains the Simple Mail Transport Protocol (SMTP) password used for authenticated connections. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrSMTPPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtppassword
     */
    put_SMTPPassword(bstrSMTPPassword) {
        if(bstrSMTPPassword is String) {
            pin := BSTR.Alloc(bstrSMTPPassword)
            bstrSMTPPassword := pin.Value
        }

        result := ComCall(20, this, "ptr", bstrSMTPPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::Refresh method refreshes FaxReceiptOptions object information from the fax server. When the IFaxReceiptOptions::Refresh method is called, any configuration changes made after the last IFaxReceiptOptions::Save method call are lost.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-refresh
     */
    Refresh() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::Save method saves the FaxReceiptOptions object data.
     * @remarks
     * This method is not supported for Windows XP when the receipt type is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtMAIL</a>, or if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxreceiptoptions-useforinboundrouting-vb">IFaxReceiptOptions::get_UseForInboundRouting </a> is set to <b>TRUE</b>. In these cases, this method will return the error: <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-error-codes">FAX_E_NOT_SUPPORTED_ON_THIS_SKU</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-save
     */
    Save() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IFaxReceiptOptions::get_UseForInboundRouting property sets or retrieves whether to use the FaxReceiptOptions settings for the Microsoft Routing Extension, which allows incoming faxes to be routed to email addresses. (Get)
     * @remarks
     * If the settings are not used (property is set to <b>FALSE</b>), then the Microsoft Routing Extension is disabled, and users will not be able to receive faxes to email addresses. If the settings are used (property is set to <b>TRUE</b>), then the Microsoft Routing Extension is enabled, and users will be able to receive faxes to email addresses.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_useforinboundrouting
     */
    get_UseForInboundRouting() {
        result := ComCall(23, this, "short*", &pbUseForInboundRouting := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbUseForInboundRouting
    }

    /**
     * The IFaxReceiptOptions::get_UseForInboundRouting property sets or retrieves whether to use the FaxReceiptOptions settings for the Microsoft Routing Extension, which allows incoming faxes to be routed to email addresses. (Put)
     * @remarks
     * If the settings are not used (property is set to <b>FALSE</b>), then the Microsoft Routing Extension is disabled, and users will not be able to receive faxes to email addresses. If the settings are used (property is set to <b>TRUE</b>), then the Microsoft Routing Extension is enabled, and users will be able to receive faxes to email addresses.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bUseForInboundRouting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_useforinboundrouting
     */
    put_UseForInboundRouting(bUseForInboundRouting) {
        result := ComCall(24, this, "short", bUseForInboundRouting, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
