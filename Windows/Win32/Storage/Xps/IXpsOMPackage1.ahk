#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackage.ahk

/**
 * Inherits from IXpsOMPackage.
 * @remarks
 * 
  * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
  * The base interface is defined and documented in Windows 7 SDK.
  * 
  * [IXpsOMPackage interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompackage1
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPackage1 extends IXpsOMPackage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPackage1
     * @type {Guid}
     */
    static IID => Guid("{95a9435e-12bb-461b-8e7f-c6adb04cd96a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentType", "WriteToFile1", "WriteToStream1"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-getdocumenttype
     */
    GetDocumentType() {
        result := ComCall(13, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes 
     * @param {Integer} flagsAndAttributes 
     * @param {BOOL} optimizeMarkupSize 
     * @param {Integer} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-writetofile1
     */
    WriteToFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, documentType) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(14, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", documentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISequentialStream} outputStream 
     * @param {BOOL} optimizeMarkupSize 
     * @param {Integer} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-writetostream1
     */
    WriteToStream1(outputStream, optimizeMarkupSize, documentType) {
        result := ComCall(15, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", documentType, "HRESULT")
        return result
    }
}
