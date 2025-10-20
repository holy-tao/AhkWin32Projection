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
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_AuthenticationType(pType) {
        result := ComCall(7, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    put_AuthenticationType(Type) {
        result := ComCall(8, this, "int", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPServer 
     * @returns {HRESULT} 
     */
    get_SMTPServer(pbstrSMTPServer) {
        result := ComCall(9, this, "ptr", pbstrSMTPServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPServer 
     * @returns {HRESULT} 
     */
    put_SMTPServer(bstrSMTPServer) {
        bstrSMTPServer := bstrSMTPServer is String ? BSTR.Alloc(bstrSMTPServer).Value : bstrSMTPServer

        result := ComCall(10, this, "ptr", bstrSMTPServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSMTPPort 
     * @returns {HRESULT} 
     */
    get_SMTPPort(plSMTPPort) {
        result := ComCall(11, this, "int*", plSMTPPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSMTPPort 
     * @returns {HRESULT} 
     */
    put_SMTPPort(lSMTPPort) {
        result := ComCall(12, this, "int", lSMTPPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPSender 
     * @returns {HRESULT} 
     */
    get_SMTPSender(pbstrSMTPSender) {
        result := ComCall(13, this, "ptr", pbstrSMTPSender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPSender 
     * @returns {HRESULT} 
     */
    put_SMTPSender(bstrSMTPSender) {
        bstrSMTPSender := bstrSMTPSender is String ? BSTR.Alloc(bstrSMTPSender).Value : bstrSMTPSender

        result := ComCall(14, this, "ptr", bstrSMTPSender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPUser 
     * @returns {HRESULT} 
     */
    get_SMTPUser(pbstrSMTPUser) {
        result := ComCall(15, this, "ptr", pbstrSMTPUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPUser 
     * @returns {HRESULT} 
     */
    put_SMTPUser(bstrSMTPUser) {
        bstrSMTPUser := bstrSMTPUser is String ? BSTR.Alloc(bstrSMTPUser).Value : bstrSMTPUser

        result := ComCall(16, this, "ptr", bstrSMTPUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAllowedReceipts 
     * @returns {HRESULT} 
     */
    get_AllowedReceipts(pAllowedReceipts) {
        result := ComCall(17, this, "int*", pAllowedReceipts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AllowedReceipts 
     * @returns {HRESULT} 
     */
    put_AllowedReceipts(AllowedReceipts) {
        result := ComCall(18, this, "int", AllowedReceipts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSMTPPassword 
     * @returns {HRESULT} 
     */
    get_SMTPPassword(pbstrSMTPPassword) {
        result := ComCall(19, this, "ptr", pbstrSMTPPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSMTPPassword 
     * @returns {HRESULT} 
     */
    put_SMTPPassword(bstrSMTPPassword) {
        bstrSMTPPassword := bstrSMTPPassword is String ? BSTR.Alloc(bstrSMTPPassword).Value : bstrSMTPPassword

        result := ComCall(20, this, "ptr", bstrSMTPPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseForInboundRouting 
     * @returns {HRESULT} 
     */
    get_UseForInboundRouting(pbUseForInboundRouting) {
        result := ComCall(23, this, "ptr", pbUseForInboundRouting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseForInboundRouting 
     * @returns {HRESULT} 
     */
    put_UseForInboundRouting(bUseForInboundRouting) {
        result := ComCall(24, this, "short", bUseForInboundRouting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
