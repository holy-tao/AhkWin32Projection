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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackage", "CreatePackageFromFile", "CreatePackageFromStream", "CreateStoryFragmentsResource", "CreateDocumentStructureResource", "CreateSignatureBlockResource", "CreateRemoteDictionaryResource", "CreateRemoteDictionaryResourceFromStream", "CreatePartResources", "CreateDocumentSequence", "CreateDocument", "CreatePageReference", "CreatePage", "CreatePageFromStream", "CreateCanvas", "CreateGlyphs", "CreatePath", "CreateGeometry", "CreateGeometryFigure", "CreateMatrixTransform", "CreateSolidColorBrush", "CreateColorProfileResource", "CreateImageBrush", "CreateVisualBrush", "CreateImageResource", "CreatePrintTicketResource", "CreateFontResource", "CreateGradientStop", "CreateLinearGradientBrush", "CreateRadialGradientBrush", "CreateCoreProperties", "CreateDictionary", "CreatePartUriCollection", "CreatePackageWriterOnFile", "CreatePackageWriterOnStream", "CreatePartUri", "CreateReadOnlyStreamOnFile"]

    /**
     * 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackage
     */
    CreatePackage(package) {
        result := ComCall(3, this, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromfile
     */
    CreatePackageFromFile(filename, reuseObjects, package) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(4, this, "ptr", filename, "int", reuseObjects, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromstream
     */
    CreatePackageFromStream(stream, reuseObjects, package) {
        result := ComCall(5, this, "ptr", stream, "int", reuseObjects, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMStoryFragmentsResource>} storyFragmentsResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createstoryfragmentsresource
     */
    CreateStoryFragmentsResource(acquiredStream, partUri, storyFragmentsResource) {
        result := ComCall(6, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", storyFragmentsResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMDocumentStructureResource>} documentStructureResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocumentstructureresource
     */
    CreateDocumentStructureResource(acquiredStream, partUri, documentStructureResource) {
        result := ComCall(7, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", documentStructureResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createsignatureblockresource
     */
    CreateSignatureBlockResource(acquiredStream, partUri, signatureBlockResource) {
        result := ComCall(8, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMDictionary} dictionary 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} remoteDictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createremotedictionaryresource
     */
    CreateRemoteDictionaryResource(dictionary, partUri, remoteDictionaryResource) {
        result := ComCall(9, this, "ptr", dictionary, "ptr", partUri, "ptr*", remoteDictionaryResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} dictionaryMarkupStream 
     * @param {IOpcPartUri} dictionaryPartUri 
     * @param {IXpsOMPartResources} resources 
     * @param {Pointer<IXpsOMRemoteDictionaryResource>} dictionaryResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createremotedictionaryresourcefromstream
     */
    CreateRemoteDictionaryResourceFromStream(dictionaryMarkupStream, dictionaryPartUri, resources, dictionaryResource) {
        result := ComCall(10, this, "ptr", dictionaryMarkupStream, "ptr", dictionaryPartUri, "ptr", resources, "ptr*", dictionaryResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPartResources>} partResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpartresources
     */
    CreatePartResources(partResources) {
        result := ComCall(11, this, "ptr*", partResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMDocumentSequence>} documentSequence 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocumentsequence
     */
    CreateDocumentSequence(partUri, documentSequence) {
        result := ComCall(12, this, "ptr", partUri, "ptr*", documentSequence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocument
     */
    CreateDocument(partUri, document) {
        result := ComCall(13, this, "ptr", partUri, "ptr*", document, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions 
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpagereference
     */
    CreatePageReference(advisoryPageDimensions, pageReference) {
        result := ComCall(14, this, "ptr", advisoryPageDimensions, "ptr*", pageReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @param {PWSTR} language 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpage
     */
    CreatePage(pageDimensions, language, partUri, page) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(15, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr*", page, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pageMarkupStream 
     * @param {IOpcPartUri} partUri 
     * @param {IXpsOMPartResources} resources 
     * @param {BOOL} reuseObjects 
     * @param {Pointer<IXpsOMPage>} page 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpagefromstream
     */
    CreatePageFromStream(pageMarkupStream, partUri, resources, reuseObjects, page) {
        result := ComCall(16, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr*", page, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMCanvas>} canvas 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcanvas
     */
    CreateCanvas(canvas) {
        result := ComCall(17, this, "ptr*", canvas, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMFontResource} fontResource 
     * @param {Pointer<IXpsOMGlyphs>} glyphs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createglyphs
     */
    CreateGlyphs(fontResource, glyphs) {
        result := ComCall(18, this, "ptr", fontResource, "ptr*", glyphs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPath>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpath
     */
    CreatePath(path) {
        result := ComCall(19, this, "ptr*", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategeometry
     */
    CreateGeometry(geometry) {
        result := ComCall(20, this, "ptr*", geometry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @param {Pointer<IXpsOMGeometryFigure>} figure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategeometryfigure
     */
    CreateGeometryFigure(startPoint, figure) {
        result := ComCall(21, this, "ptr", startPoint, "ptr*", figure, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creatematrixtransform
     */
    CreateMatrixTransform(matrix, transform) {
        result := ComCall(22, this, "ptr", matrix, "ptr*", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {IXpsOMColorProfileResource} colorProfile 
     * @param {Pointer<IXpsOMSolidColorBrush>} solidColorBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createsolidcolorbrush
     */
    CreateSolidColorBrush(color, colorProfile, solidColorBrush) {
        result := ComCall(23, this, "ptr", color, "ptr", colorProfile, "ptr*", solidColorBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMColorProfileResource>} colorProfileResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcolorprofileresource
     */
    CreateColorProfileResource(acquiredStream, partUri, colorProfileResource) {
        result := ComCall(24, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", colorProfileResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMImageResource} image 
     * @param {Pointer<XPS_RECT>} viewBox 
     * @param {Pointer<XPS_RECT>} viewPort 
     * @param {Pointer<IXpsOMImageBrush>} imageBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createimagebrush
     */
    CreateImageBrush(image, viewBox, viewPort, imageBrush) {
        result := ComCall(25, this, "ptr", image, "ptr", viewBox, "ptr", viewPort, "ptr*", imageBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewBox 
     * @param {Pointer<XPS_RECT>} viewPort 
     * @param {Pointer<IXpsOMVisualBrush>} visualBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createvisualbrush
     */
    CreateVisualBrush(viewBox, viewPort, visualBrush) {
        result := ComCall(26, this, "ptr", viewBox, "ptr", viewPort, "ptr*", visualBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {Integer} contentType 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createimageresource
     */
    CreateImageResource(acquiredStream, contentType, partUri, imageResource) {
        result := ComCall(27, this, "ptr", acquiredStream, "int", contentType, "ptr", partUri, "ptr*", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMPrintTicketResource>} printTicketResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createprintticketresource
     */
    CreatePrintTicketResource(acquiredStream, partUri, printTicketResource) {
        result := ComCall(28, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", printTicketResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {Integer} fontEmbedding 
     * @param {IOpcPartUri} partUri 
     * @param {BOOL} isObfSourceStream 
     * @param {Pointer<IXpsOMFontResource>} fontResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createfontresource
     */
    CreateFontResource(acquiredStream, fontEmbedding, partUri, isObfSourceStream, fontResource) {
        result := ComCall(29, this, "ptr", acquiredStream, "int", fontEmbedding, "ptr", partUri, "int", isObfSourceStream, "ptr*", fontResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {IXpsOMColorProfileResource} colorProfile 
     * @param {Float} offset 
     * @param {Pointer<IXpsOMGradientStop>} gradientStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategradientstop
     */
    CreateGradientStop(color, colorProfile, offset, gradientStop) {
        result := ComCall(30, this, "ptr", color, "ptr", colorProfile, "float", offset, "ptr*", gradientStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMGradientStop} gradStop1 
     * @param {IXpsOMGradientStop} gradStop2 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @param {Pointer<XPS_POINT>} endPoint 
     * @param {Pointer<IXpsOMLinearGradientBrush>} linearGradientBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createlineargradientbrush
     */
    CreateLinearGradientBrush(gradStop1, gradStop2, startPoint, endPoint, linearGradientBrush) {
        result := ComCall(31, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", startPoint, "ptr", endPoint, "ptr*", linearGradientBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMGradientStop} gradStop1 
     * @param {IXpsOMGradientStop} gradStop2 
     * @param {Pointer<XPS_POINT>} centerPoint 
     * @param {Pointer<XPS_POINT>} gradientOrigin 
     * @param {Pointer<XPS_SIZE>} radiiSizes 
     * @param {Pointer<IXpsOMRadialGradientBrush>} radialGradientBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createradialgradientbrush
     */
    CreateRadialGradientBrush(gradStop1, gradStop2, centerPoint, gradientOrigin, radiiSizes, radialGradientBrush) {
        result := ComCall(32, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", centerPoint, "ptr", gradientOrigin, "ptr", radiiSizes, "ptr*", radialGradientBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partUri 
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcoreproperties
     */
    CreateCoreProperties(partUri, coreProperties) {
        result := ComCall(33, this, "ptr", partUri, "ptr*", coreProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDictionary>} dictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdictionary
     */
    CreateDictionary(dictionary) {
        result := ComCall(34, this, "ptr*", dictionary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPartUriCollection>} partUriCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createparturicollection
     */
    CreatePartUriCollection(partUriCollection) {
        result := ComCall(35, this, "ptr*", partUriCollection, "HRESULT")
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
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronfile
     */
    CreatePackageWriterOnFile(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(36, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", packageWriter, "HRESULT")
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
     * @param {Pointer<IXpsOMPackageWriter>} packageWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronstream
     */
    CreatePackageWriterOnStream(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName, packageWriter) {
        result := ComCall(37, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", packageWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<IOpcPartUri>} partUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createparturi
     */
    CreatePartUri(uri, partUri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(38, this, "ptr", uri, "ptr*", partUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createreadonlystreamonfile
     */
    CreateReadOnlyStreamOnFile(filename, stream) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(39, this, "ptr", filename, "ptr*", stream, "HRESULT")
        return result
    }
}
