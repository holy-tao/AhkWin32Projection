#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmAction.ahk

/**
 * Used to generate a report in response to a quota or file screen event.
 * @remarks
 * 
  * You must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmactionreport-get_reporttypes">ReportTypes</a> property; 
  *     the other property is optional.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmactionreport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmActionReport extends IFsrmAction{
    /**
     * The interface identifier for IFsrmActionReport
     * @type {Guid}
     */
    static IID => Guid("{2dbe63c4-b340-48a0-a5b0-158e07fc567e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<SAFEARRAY>} reportTypes 
     * @returns {HRESULT} 
     */
    get_ReportTypes(reportTypes) {
        result := ComCall(12, this, "ptr", reportTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} reportTypes 
     * @returns {HRESULT} 
     */
    put_ReportTypes(reportTypes) {
        result := ComCall(13, this, "ptr", reportTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} mailTo 
     * @returns {HRESULT} 
     */
    get_MailTo(mailTo) {
        result := ComCall(14, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     */
    put_MailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(15, this, "ptr", mailTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
