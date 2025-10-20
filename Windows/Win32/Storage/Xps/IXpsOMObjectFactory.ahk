#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates objects in the XPS document object model.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomobjectfactory
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMObjectFactory extends IUnknown{
    /**
     * The interface identifier for IXpsOMObjectFactory
     * @type {Guid}
     */
    static IID => Guid("{f9b2a685-a50d-4fc2-b764-b56e093ea0ca}")

    /**
     * The class identifier for XpsOMObjectFactory
     * @type {Guid}
     */
    static CLSID => Guid("{e974d26d-3d9b-4d47-88cc-3872f2dc3585}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     */
    CreatePackage(package) {
        result := ComCall(3, this, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     */
    CreatePackageFromFile(filename, reuseObjects, package) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(4, this, "ptr", filename, "int", reuseObjects, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     */
    CreatePackageFromStream(stream, reuseObjects, package) {
        result := ComCall(5, this, "ptr", stream, "int", reuseObjects, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMStoryFragmentsResource>} storyFragmentsResource 
     * @returns {HRESULT} 
     */
    CreateStoryFragmentsResource(acquiredStream, partUri, storyFragmentsResource) {
        result := ComCall(6, this, "ptr", acquiredStream, "ptr", partUri, "ptr", storyFragmentsResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMDocumentStructureResource>} documentStructureResource 
     * @returns {HRESULT} 
     */
    CreateDocumentStructureResource(acquiredStream, partUri, documentStructureResource) {
        result := ComCall(7, this, "ptr", acquiredStream, "ptr", partUri, "ptr", documentStructureResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     */
    CreateSignatureBlockResource(acquiredStream, partUri, signatureBlockResource) {
        result := ComCall(8, this, "ptr", acquiredStream, "ptr", partUri, "ptr", signatureBlockResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} dictionary 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     */
    CreateRemoteDictionaryResource(dictionary, partUri, remoteDictionaryResource) {
        result := ComCall(9, this, "ptr", dictionary, "ptr", partUri, "ptr", remoteDictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} dictionaryMarkupStream 
     * @param {Pointer<IOpcPartUri>} dictionaryPartUri 
     * @param {Pointer<IXpsOMPartResources>} resources 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} dictionaryResource 
     * @returns {HRESULT} 
     */
    CreateRemoteDictionaryResourceFromStream(dictionaryMarkupStream, dictionaryPartUri, resources, dictionaryResource) {
        result := ComCall(10, this, "ptr", dictionaryMarkupStream, "ptr", dictionaryPartUri, "ptr", resources, "ptr", dictionaryResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPartResources>} partResources 
     * @returns {HRESULT} 
     */
    CreatePartResources(partResources) {
        result := ComCall(11, this, "ptr", partResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMDocumentSequence>} documentSequence 
     * @returns {HRESULT} 
     */
    CreateDocumentSequence(partUri, documentSequence) {
        result := ComCall(12, this, "ptr", partUri, "ptr", documentSequence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     */
    CreateDocument(partUri, document) {
        result := ComCall(13, this, "ptr", partUri, "ptr", document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions 
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @returns {HRESULT} 
     */
    CreatePageReference(advisoryPageDimensions, pageReference) {
        result := ComCall(14, this, "ptr", advisoryPageDimensions, "ptr", pageReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @param {PWSTR} language 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     */
    CreatePage(pageDimensions, language, partUri, page) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(15, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr", page, "int")
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
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     */
    CreatePageFromStream(pageMarkupStream, partUri, resources, reuseObjects, page) {
        result := ComCall(16, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMCanvas>} canvas 
     * @returns {HRESULT} 
     */
    CreateCanvas(canvas) {
        result := ComCall(17, this, "ptr", canvas, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMFontResource>} fontResource 
     * @param {Pointer<IXpsOMGlyphs>} glyphs 
     * @returns {HRESULT} 
     */
    CreateGlyphs(fontResource, glyphs) {
        result := ComCall(18, this, "ptr", fontResource, "ptr", glyphs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPath>} path 
     * @returns {HRESULT} 
     */
    CreatePath(path) {
        result := ComCall(19, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     */
    CreateGeometry(geometry) {
        result := ComCall(20, this, "ptr", geometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @param {Pointer<IXpsOMGeometryFigure>} figure 
     * @returns {HRESULT} 
     */
    CreateGeometryFigure(startPoint, figure) {
        result := ComCall(21, this, "ptr", startPoint, "ptr", figure, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     */
    CreateMatrixTransform(matrix, transform) {
        result := ComCall(22, this, "ptr", matrix, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {Pointer<IXpsOMColorProfileResource>} colorProfile 
     * @param {Pointer<IXpsOMSolidColorBrush>} solidColorBrush 
     * @returns {HRESULT} 
     */
    CreateSolidColorBrush(color, colorProfile, solidColorBrush) {
        result := ComCall(23, this, "ptr", color, "ptr", colorProfile, "ptr", solidColorBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMColorProfileResource>} colorProfileResource 
     * @returns {HRESULT} 
     */
    CreateColorProfileResource(acquiredStream, partUri, colorProfileResource) {
        result := ComCall(24, this, "ptr", acquiredStream, "ptr", partUri, "ptr", colorProfileResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} image 
     * @param {Pointer<XPS_RECT>} viewBox 
     * @param {Pointer<XPS_RECT>} viewPort 
     * @param {Pointer<IXpsOMImageBrush>} imageBrush 
     * @returns {HRESULT} 
     */
    CreateImageBrush(image, viewBox, viewPort, imageBrush) {
        result := ComCall(25, this, "ptr", image, "ptr", viewBox, "ptr", viewPort, "ptr", imageBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewBox 
     * @param {Pointer<XPS_RECT>} viewPort 
     * @param {Pointer<IXpsOMVisualBrush>} visualBrush 
     * @returns {HRESULT} 
     */
    CreateVisualBrush(viewBox, viewPort, visualBrush) {
        result := ComCall(26, this, "ptr", viewBox, "ptr", viewPort, "ptr", visualBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Integer} contentType 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     */
    CreateImageResource(acquiredStream, contentType, partUri, imageResource) {
        result := ComCall(27, this, "ptr", acquiredStream, "int", contentType, "ptr", partUri, "ptr", imageResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMPrintTicketResource>} printTicketResource 
     * @returns {HRESULT} 
     */
    CreatePrintTicketResource(acquiredStream, partUri, printTicketResource) {
        result := ComCall(28, this, "ptr", acquiredStream, "ptr", partUri, "ptr", printTicketResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} acquiredStream 
     * @param {Integer} fontEmbedding 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {BOOL} isObfSourceStream 
     * @param {Pointer<IXpsOMFontResource>} fontResource 
     * @returns {HRESULT} 
     */
    CreateFontResource(acquiredStream, fontEmbedding, partUri, isObfSourceStream, fontResource) {
        result := ComCall(29, this, "ptr", acquiredStream, "int", fontEmbedding, "ptr", partUri, "int", isObfSourceStream, "ptr", fontResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {Pointer<IXpsOMColorProfileResource>} colorProfile 
     * @param {Float} offset 
     * @param {Pointer<IXpsOMGradientStop>} gradientStop 
     * @returns {HRESULT} 
     */
    CreateGradientStop(color, colorProfile, offset, gradientStop) {
        result := ComCall(30, this, "ptr", color, "ptr", colorProfile, "float", offset, "ptr", gradientStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGradientStop>} gradStop1 
     * @param {Pointer<IXpsOMGradientStop>} gradStop2 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @param {Pointer<XPS_POINT>} endPoint 
     * @param {Pointer<IXpsOMLinearGradientBrush>} linearGradientBrush 
     * @returns {HRESULT} 
     */
    CreateLinearGradientBrush(gradStop1, gradStop2, startPoint, endPoint, linearGradientBrush) {
        result := ComCall(31, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", startPoint, "ptr", endPoint, "ptr", linearGradientBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGradientStop>} gradStop1 
     * @param {Pointer<IXpsOMGradientStop>} gradStop2 
     * @param {Pointer<XPS_POINT>} centerPoint 
     * @param {Pointer<XPS_POINT>} gradientOrigin 
     * @param {Pointer<XPS_SIZE>} radiiSizes 
     * @param {Pointer<IXpsOMRadialGradientBrush>} radialGradientBrush 
     * @returns {HRESULT} 
     */
    CreateRadialGradientBrush(gradStop1, gradStop2, centerPoint, gradientOrigin, radiiSizes, radialGradientBrush) {
        result := ComCall(32, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", centerPoint, "ptr", gradientOrigin, "ptr", radiiSizes, "ptr", radialGradientBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @returns {HRESULT} 
     */
    CreateCoreProperties(partUri, coreProperties) {
        result := ComCall(33, this, "ptr", partUri, "ptr", coreProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} dictionary 
     * @returns {HRESULT} 
     */
    CreateDictionary(dictionary) {
        result := ComCall(34, this, "ptr", dictionary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPartUriCollection>} partUriCollection 
     * @returns {HRESULT} 
     */
    CreatePartUriCollection(partUriCollection) {
        result := ComCall(35, this, "ptr", partUriCollection, "int")
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
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreatePackageWriterOnFile(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(36, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr", packageWriter, "int")
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
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     */
    CreatePackageWriterOnStream(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter) {
        result := ComCall(37, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr", packageWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     */
    CreatePartUri(uri, partUri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(38, this, "ptr", uri, "ptr", partUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     */
    CreateReadOnlyStreamOnFile(filename, stream) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(39, this, "ptr", filename, "ptr", stream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
