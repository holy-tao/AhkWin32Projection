#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\ISequentialStream.ahk" { ISequentialStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMPackage.ahk" { IXpsOMPackage }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\XPS_DOCUMENT_TYPE.ahk" { XPS_DOCUMENT_TYPE }

/**
 * Inherits from IXpsOMPackage.
 * @remarks
 * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
 * The base interface is defined and documented in Windows 7 SDK.
 * 
 * [IXpsOMPackage interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage)
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompackage1
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPackage1 extends IXpsOMPackage {
    /**
     * The interface identifier for IXpsOMPackage1
     * @type {Guid}
     */
    static IID := Guid("{95a9435e-12bb-461b-8e7f-c6adb04cd96a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPackage1 interfaces
    */
    struct Vtbl extends IXpsOMPackage.Vtbl {
        GetDocumentType : IntPtr
        WriteToFile1    : IntPtr
        WriteToStream1  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPackage1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the document type of the data that was used to initialize this package. This method is used to determine whether a document is the XPS or OpenXPS type. For more information, see XPS Documents.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsompackage1">IXpsOMPackage1</a> instance was not loaded from a stream or a  file, the document type is unspecified (XPS_DOCUMENT_TYPE_UNSPECIFIED). Otherwise, the document type returned is that of the stream or file used to initialize the <b>IXpsOMPackage1</b> instance.
     * @returns {XPS_DOCUMENT_TYPE} [out, retval] The document type of the source data used to initialize this package. A document type value of XPS_DOCUMENT_TYPE_UNSPECIFIED is returned if the package was created in memory.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-getdocumenttype
     */
    GetDocumentType() {
        result := ComCall(13, this, "int*", &documentType := 0, "HRESULT")
        return documentType
    }

    /**
     * Writes an XPS OM to a file as an XPS package of a specified type.
     * @remarks
     * The caller must ensure that all image resources in the package are supported by the package type. For example, JpegXR images cannot be used in an MSXPS document type because they are incompatible.
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
     * @param {XPS_DOCUMENT_TYPE} documentType [in]            The XPS data format to write to outputStream. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, the following values. For information about XPS Document API return values that are not listed in this table, see XPS Document Errors.
     * 
     * S_OK: The method succeeded.
     * 
     * E_POINTER: documentType is <b>NULL</b>.
     * 
     * E_INVALIDARG:  The document type was specified as XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * 
     * XPS_E_INVALID_CONTENT_TYPE:  An image resource in the package is of a type that is not supported by the document type specified in documentType.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-writetofile1
     */
    WriteToFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, documentType) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(14, this, "ptr", fileName, SECURITY_ATTRIBUTES.Ptr, securityAttributes, "uint", flagsAndAttributes, BOOL, optimizeMarkupSize, XPS_DOCUMENT_TYPE, documentType, "HRESULT")
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
     * @param {XPS_DOCUMENT_TYPE} documentType [in]            The XPS data format to write to outputStream. The value of this parameter cannot be XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, the following values. For information about XPS Document API return values that are not listed in this table, see XPS Document Errors.
     * 
     * S_OK: The method succeeded.
     * 
     * E_POINTER: documentType is <b>NULL</b>.
     * 
     * E_INVALIDARG: documentType was set to XPS_DOCUMENT_TYPE_UNSPECIFIED.
     * 
     * XPS_E_INVALID_CONTENT_TYPE: An image resource in the package is of a type that is not supported by the document type specified in documentType.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsompackage1-writetostream1
     */
    WriteToStream1(outputStream, optimizeMarkupSize, documentType) {
        result := ComCall(15, this, "ptr", outputStream, BOOL, optimizeMarkupSize, XPS_DOCUMENT_TYPE, documentType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMPackage1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentType := CallbackCreate(GetMethod(implObj, "GetDocumentType"), flags, 2)
        this.vtbl.WriteToFile1 := CallbackCreate(GetMethod(implObj, "WriteToFile1"), flags, 6)
        this.vtbl.WriteToStream1 := CallbackCreate(GetMethod(implObj, "WriteToStream1"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentType)
        CallbackFree(this.vtbl.WriteToFile1)
        CallbackFree(this.vtbl.WriteToStream1)
    }
}
