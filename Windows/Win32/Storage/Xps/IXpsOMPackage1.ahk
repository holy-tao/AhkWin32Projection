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
     * Gets the document type of the data that was used to initialize this package. This method is used to determine whether a document is the XPS or OpenXPS type. For more information, see XPS Documents.
     * @returns {Integer} [out, retval] The document type of the source data used to initialize this package. A document type value of XPS_DOCUMENT_TYPE_UNSPECIFIED is returned if the package was created in memory.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-getdocumenttype
     */
    GetDocumentType() {
        result := ComCall(13, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Writes an XPS OM to a file as an XPS package of a specified type.
     * @param {PWSTR} fileName [in, string]    The name of the file to be created. This parameter must not be <b>NULL</b>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes [in, unique]    The SECURITY_ATTRIBUTES structure, which contains two distinct but related data members:
     * 
     * lpSecurityDescriptor: an optional security descriptor
     * 
     * bInheritHandle: a Boolean value that determines whether the returned handle can be inherited by child processes
     * 
     * If lpSecurityDescriptor is <b>NULL</b>, the file or device that is associated with the returned handle will be assigned a default security descriptor. 
     * 
     * For more information about the securityAttributes parameter, refer to CreateFile.
     * @param {Integer} flagsAndAttributes [in] Specifies the settings and attributes of the file to be created. For most files, a value of FILE_ATTRIBUTE_NORMAL can be used. 
     * 
     * For more information about the flagsAndAttributes parameter, refer to CreateFile.
     * @param {BOOL} optimizeMarkupSize [in]            A Boolean value that indicates whether the document markup will be optimized for size when the contents of the XPS OM are written to the XPS package.
     * 
     * TRUE: The package writer will try to optimize the markup for minimum size.
     * 
     * FALSE: The package writer will not try to perform any optimization.
     * @param {Integer} documentType [in]            The XPS data format to write to outputStream. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, the following values. For information about XPS Document API return values that are not listed in this table, see XPS Document Errors.
     * 
     * S_OK: The method succeeded.
     * 
     * E_POINTER: documentType is <b>NULL</b>.
     * 
     * E_INVALIDARG:  The document type was specified as XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * 
     * XPS_E_INVALID_CONTENT_TYPE:  An image resource in the package is of a type that is not supported by the document type specified in documentType.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-writetofile1
     */
    WriteToFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, documentType) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(14, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", documentType, "HRESULT")
        return result
    }

    /**
     * Writes an XPS OM to a stream as an XPS package of a specified type.
     * @param {ISequentialStream} outputStream [in]            The stream that receives the serialized contents of the package. This parameter must not be <b>NULL</b>.
     * @param {BOOL} optimizeMarkupSize [in]            A Boolean value that indicates whether the document markup will be optimized for size when the contents of the XPS OM are written to the XPS package.
     * 
     * TRUE: The package writer will try to optimize the markup for minimum size.
     * 
     * FALSE: The package writer will not try to perform any optimization.
     * @param {Integer} documentType [in]            The XPS data format to write to outputStream. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, the following values. For information about XPS Document API return values that are not listed in this table, see XPS Document Errors.
     * 
     * S_OK: The method succeeded.
     * 
     * E_POINTER: documentType is <b>NULL</b>.
     * 
     * E_INVALIDARG: documentType was set to XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * 
     * XPS_E_INVALID_CONTENT_TYPE: An image resource in the package is of a type that is not supported by the document type specified in documentType.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-writetostream1
     */
    WriteToStream1(outputStream, optimizeMarkupSize, documentType) {
        result := ComCall(15, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", documentType, "HRESULT")
        return result
    }
}
