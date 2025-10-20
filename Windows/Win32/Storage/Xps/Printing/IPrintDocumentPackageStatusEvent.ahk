#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents the progress of the print job.
 * @see https://docs.microsoft.com/windows/win32/api//documenttarget/nn-documenttarget-iprintdocumentpackagestatusevent
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IPrintDocumentPackageStatusEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintDocumentPackageStatusEvent
     * @type {Guid}
     */
    static IID => Guid("{ed90c8ad-5c34-4d05-a1ec-0e8a9b3ad7af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PackageStatusUpdated"]

    /**
     * 
     * @param {Pointer<PrintDocumentPackageStatus>} packageStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/documenttarget/nf-documenttarget-iprintdocumentpackagestatusevent-packagestatusupdated
     */
    PackageStatusUpdated(packageStatus) {
        result := ComCall(7, this, "ptr", packageStatus, "HRESULT")
        return result
    }
}
