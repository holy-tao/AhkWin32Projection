#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxReceiptOptions interface defines a FaxReceiptOptions configuration object used by a fax client application to set and retrieve the receipt configuration that the fax service uses to send delivery receipts for fax transmissions.
 * @remarks
 * 
  * A default implementation of <b>IFaxReceiptOptions</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxreceiptoptions">FaxReceiptOptions</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxreceiptoptions
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
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_authenticationtype
     */
    get_AuthenticationType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_authenticationtype
     */
    put_AuthenticationType(Type) {
        result := ComCall(8, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpserver
     */
    get_SMTPServer(pbstrSMTPServer) {
        result := ComCall(9, this, "ptr", pbstrSMTPServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpserver
     */
    put_SMTPServer(bstrSMTPServer) {
        bstrSMTPServer := bstrSMTPServer is String ? BSTR.Alloc(bstrSMTPServer).Value : bstrSMTPServer

        result := ComCall(10, this, "ptr", bstrSMTPServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSMTPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpport
     */
    get_SMTPPort(plSMTPPort) {
        plSMTPPortMarshal := plSMTPPort is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plSMTPPortMarshal, plSMTPPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSMTPPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpport
     */
    put_SMTPPort(lSMTPPort) {
        result := ComCall(12, this, "int", lSMTPPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPSender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpsender
     */
    get_SMTPSender(pbstrSMTPSender) {
        result := ComCall(13, this, "ptr", pbstrSMTPSender, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPSender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpsender
     */
    put_SMTPSender(bstrSMTPSender) {
        bstrSMTPSender := bstrSMTPSender is String ? BSTR.Alloc(bstrSMTPSender).Value : bstrSMTPSender

        result := ComCall(14, this, "ptr", bstrSMTPSender, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtpuser
     */
    get_SMTPUser(pbstrSMTPUser) {
        result := ComCall(15, this, "ptr", pbstrSMTPUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtpuser
     */
    put_SMTPUser(bstrSMTPUser) {
        bstrSMTPUser := bstrSMTPUser is String ? BSTR.Alloc(bstrSMTPUser).Value : bstrSMTPUser

        result := ComCall(16, this, "ptr", bstrSMTPUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAllowedReceipts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_allowedreceipts
     */
    get_AllowedReceipts(pAllowedReceipts) {
        pAllowedReceiptsMarshal := pAllowedReceipts is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pAllowedReceiptsMarshal, pAllowedReceipts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AllowedReceipts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_allowedreceipts
     */
    put_AllowedReceipts(AllowedReceipts) {
        result := ComCall(18, this, "int", AllowedReceipts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_smtppassword
     */
    get_SMTPPassword(pbstrSMTPPassword) {
        result := ComCall(19, this, "ptr", pbstrSMTPPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_smtppassword
     */
    put_SMTPPassword(bstrSMTPPassword) {
        bstrSMTPPassword := bstrSMTPPassword is String ? BSTR.Alloc(bstrSMTPPassword).Value : bstrSMTPPassword

        result := ComCall(20, this, "ptr", bstrSMTPPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-refresh
     */
    Refresh() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-save
     */
    Save() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseForInboundRouting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-get_useforinboundrouting
     */
    get_UseForInboundRouting(pbUseForInboundRouting) {
        result := ComCall(23, this, "ptr", pbUseForInboundRouting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseForInboundRouting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxreceiptoptions-put_useforinboundrouting
     */
    put_UseForInboundRouting(bUseForInboundRouting) {
        result := ComCall(24, this, "short", bUseForInboundRouting, "HRESULT")
        return result
    }
}
