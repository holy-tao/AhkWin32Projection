#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the method to create an IXpsOMPackageWriter that can be used by a print job that was created by the StartXpsPrintJob1 function.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface writes the application data in the order in which they will appear to the user.
  * 
  * To create an instance of an <b>IXpsOMPackageTarget</b> interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-startxpsprintjob1">StartXpsPrintJob1</a> function.
  * 
  * To create the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> interface to use to write the document to a printer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ff970305(v=vs.85)">CreateXpsOMPackageWriter</a> method of this interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagetarget
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPackageTarget extends IUnknown{
    /**
     * The interface identifier for IXpsOMPackageTarget
     * @type {Guid}
     */
    static IID => Guid("{219a9db0-4959-47d0-8034-b1ce84f41a4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOpcPartUri>} documentSequencePartName 
     * @param {Pointer<IXpsOMPrintTicketResource>} documentSequencePrintTicket 
     * @param {Pointer<IOpcPartUri>} discardControlPartName 
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreateXpsOMPackageWriter(documentSequencePartName, documentSequencePrintTicket, discardControlPartName, packageWriter) {
        result := ComCall(3, this, "ptr", documentSequencePartName, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
