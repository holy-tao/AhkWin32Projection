#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMObjectFactory.ahk

/**
 * Inherits from IXpsOMObjectFactory.
 * @remarks
 * 
  * <h3><a id="Additional_References"></a><a id="additional_references"></a><a id="ADDITIONAL_REFERENCES"></a>Additional References</h3>
  * The base interface is defined and documented in Windows 7 SDK.
  * 
  * [IXpsOMObjectFactory interface](/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsomobjectfactory1
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMObjectFactory1 extends IXpsOMObjectFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMObjectFactory1
     * @type {Guid}
     */
    static IID => Guid("{0a91b617-d612-4181-bf7c-be5824e9cc8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentTypeFromFile", "GetDocumentTypeFromStream", "ConvertHDPhotoToJpegXR", "ConvertJpegXRToHDPhoto", "CreatePackageWriterOnFile1", "CreatePackageWriterOnStream1", "CreatePackage1", "CreatePackageFromStream1", "CreatePackageFromFile1", "CreatePage1", "CreatePageFromStream1", "CreateRemoteDictionaryResourceFromStream1"]

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<Integer>} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-getdocumenttypefromfile
     */
    GetDocumentTypeFromFile(filename, documentType) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(40, this, "ptr", filename, "int*", documentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} xpsDocumentStream 
     * @param {Pointer<Integer>} documentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-getdocumenttypefromstream
     */
    GetDocumentTypeFromStream(xpsDocumentStream, documentType) {
        result := ComCall(41, this, "ptr", xpsDocumentStream, "int*", documentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMImageResource} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-converthdphototojpegxr
     */
    ConvertHDPhotoToJpegXR(imageResource) {
        result := ComCall(42, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMImageResource} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-convertjpegxrtohdphoto
     */
    ConvertJpegXRToHDPhoto(imageResource) {
        result := ComCall(43, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes 
     * @param {Integer} flagsAndAttributes 
     * @param {BOOL} optimizeMarkupSize 
     * @param {Integer} interleaving 
     * @param {IOpcPartUri} documentSequencePartName 
     * @param {IXpsOMCoreProperties} coreProperties 
     * @param {IXpsOMImageResource} packageThumbnail 
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket 
     * @param {IOpcPartUri} discardControlPartName 
     * @param {Integer} documentType 
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagewriteronfile1
     */
    CreatePackageWriterOnFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType, packageWriter) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(44, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "int", documentType, "ptr*", packageWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISequentialStream} outputStream 
     * @param {BOOL} optimizeMarkupSize 
     * @param {Integer} interleaving 
     * @param {IOpcPartUri} documentSequencePartName 
     * @param {IXpsOMCoreProperties} coreProperties 
     * @param {IXpsOMImageResource} packageThumbnail 
     * @param {IXpsOMPrintTicketResource} documentSequencePrintTicket 
     * @param {IOpcPartUri} discardControlPartName 
     * @param {Integer} documentType 
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagewriteronstream1
     */
    CreatePackageWriterOnStream1(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType, packageWriter) {
        result := ComCall(45, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "int", documentType, "ptr*", packageWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPackage1>} package 
     * @returns {HRESULT} 
     */
    CreatePackage1(package) {
        result := ComCall(46, this, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage1>} package 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagefromstream1
     */
    CreatePackageFromStream1(stream, reuseObjects, package) {
        result := ComCall(47, this, "ptr", stream, "int", reuseObjects, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage1>} package 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpackagefromfile1
     */
    CreatePackageFromFile1(filename, reuseObjects, package) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(48, this, "ptr", filename, "int", reuseObjects, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @param {PWSTR} language 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMPage1>} page 
     * @returns {HRESULT} 
     */
    CreatePage1(pageDimensions, language, partUri, page) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(49, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr*", page, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pageMarkupStream 
     * @param {IOpcPartUri} partUri 
     * @param {IXpsOMPartResources} resources 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPage1>} page 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createpagefromstream1
     */
    CreatePageFromStream1(pageMarkupStream, partUri, resources, reuseObjects, page) {
        result := ComCall(50, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr*", page, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} dictionaryMarkupStream 
     * @param {IOpcPartUri} partUri 
     * @param {IXpsOMPartResources} resources 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} dictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/nf-xpsobjectmodel_1-ixpsomobjectfactory1-createremotedictionaryresourcefromstream1
     */
    CreateRemoteDictionaryResourceFromStream1(dictionaryMarkupStream, partUri, resources, dictionaryResource) {
        result := ComCall(51, this, "ptr", dictionaryMarkupStream, "ptr", partUri, "ptr", resources, "ptr*", dictionaryResource, "HRESULT")
        return result
    }
}
