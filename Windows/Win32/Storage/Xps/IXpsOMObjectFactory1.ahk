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
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<Int32>} documentType 
     * @returns {HRESULT} 
     */
    GetDocumentTypeFromFile(filename, documentType) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(40, this, "ptr", filename, "int*", documentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} xpsDocumentStream 
     * @param {Pointer<Int32>} documentType 
     * @returns {HRESULT} 
     */
    GetDocumentTypeFromStream(xpsDocumentStream, documentType) {
        result := ComCall(41, this, "ptr", xpsDocumentStream, "int*", documentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     */
    ConvertHDPhotoToJpegXR(imageResource) {
        result := ComCall(42, this, "ptr", imageResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     */
    ConvertJpegXRToHDPhoto(imageResource) {
        result := ComCall(43, this, "ptr", imageResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes 
     * @param {Integer} flagsAndAttributes 
     * @param {BOOL} optimizeMarkupSize 
     * @param {Integer} interleaving 
     * @param {Pointer<IOpcPartUri>} documentSequencePartName 
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @param {Pointer<IXpsOMImageResource>} packageThumbnail 
     * @param {Pointer<IXpsOMPrintTicketResource>} documentSequencePrintTicket 
     * @param {Pointer<IOpcPartUri>} discardControlPartName 
     * @param {Integer} documentType 
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreatePackageWriterOnFile1(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType, packageWriter) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(44, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "int", documentType, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISequentialStream>} outputStream 
     * @param {BOOL} optimizeMarkupSize 
     * @param {Integer} interleaving 
     * @param {Pointer<IOpcPartUri>} documentSequencePartName 
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @param {Pointer<IXpsOMImageResource>} packageThumbnail 
     * @param {Pointer<IXpsOMPrintTicketResource>} documentSequencePrintTicket 
     * @param {Pointer<IOpcPartUri>} discardControlPartName 
     * @param {Integer} documentType 
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreatePackageWriterOnStream1(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, documentType, packageWriter) {
        result := ComCall(45, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "int", documentType, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPackage1>} package 
     * @returns {HRESULT} 
     */
    CreatePackage1(package) {
        result := ComCall(46, this, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage1>} package 
     * @returns {HRESULT} 
     */
    CreatePackageFromStream1(stream, reuseObjects, package) {
        result := ComCall(47, this, "ptr", stream, "int", reuseObjects, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage1>} package 
     * @returns {HRESULT} 
     */
    CreatePackageFromFile1(filename, reuseObjects, package) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(48, this, "ptr", filename, "int", reuseObjects, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @param {PWSTR} language 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMPage1>} page 
     * @returns {HRESULT} 
     */
    CreatePage1(pageDimensions, language, partUri, page) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(49, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pageMarkupStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMPartResources>} resources 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPage1>} page 
     * @returns {HRESULT} 
     */
    CreatePageFromStream1(pageMarkupStream, partUri, resources, reuseObjects, page) {
        result := ComCall(50, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} dictionaryMarkupStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMPartResources>} resources 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} dictionaryResource 
     * @returns {HRESULT} 
     */
    CreateRemoteDictionaryResourceFromStream1(dictionaryMarkupStream, partUri, resources, dictionaryResource) {
        result := ComCall(51, this, "ptr", dictionaryMarkupStream, "ptr", partUri, "ptr", resources, "ptr", dictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
