#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackage.ahk
#Include .\IXpsOMStoryFragmentsResource.ahk
#Include .\IXpsOMDocumentStructureResource.ahk
#Include .\IXpsOMSignatureBlockResource.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
#Include .\IXpsOMPartResources.ahk
#Include .\IXpsOMDocumentSequence.ahk
#Include .\IXpsOMDocument.ahk
#Include .\IXpsOMPageReference.ahk
#Include .\IXpsOMPage.ahk
#Include .\IXpsOMCanvas.ahk
#Include .\IXpsOMGlyphs.ahk
#Include .\IXpsOMPath.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMGeometryFigure.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMSolidColorBrush.ahk
#Include .\IXpsOMColorProfileResource.ahk
#Include .\IXpsOMImageBrush.ahk
#Include .\IXpsOMVisualBrush.ahk
#Include .\IXpsOMImageResource.ahk
#Include .\IXpsOMPrintTicketResource.ahk
#Include .\IXpsOMFontResource.ahk
#Include .\IXpsOMGradientStop.ahk
#Include .\IXpsOMLinearGradientBrush.ahk
#Include .\IXpsOMRadialGradientBrush.ahk
#Include .\IXpsOMCoreProperties.ahk
#Include .\IXpsOMDictionary.ahk
#Include .\IXpsOMPartUriCollection.ahk
#Include .\IXpsOMPackageWriter.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include ..\..\System\Com\IStream.ahk
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
     * @returns {IXpsOMPackage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackage
     */
    CreatePackage() {
        result := ComCall(3, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {BOOL} reuseObjects 
     * @returns {IXpsOMPackage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromfile
     */
    CreatePackageFromFile(filename, reuseObjects) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(4, this, "ptr", filename, "int", reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {BOOL} reuseObjects 
     * @returns {IXpsOMPackage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagefromstream
     */
    CreatePackageFromStream(stream, reuseObjects) {
        result := ComCall(5, this, "ptr", stream, "int", reuseObjects, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMStoryFragmentsResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createstoryfragmentsresource
     */
    CreateStoryFragmentsResource(acquiredStream, partUri) {
        result := ComCall(6, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &storyFragmentsResource := 0, "HRESULT")
        return IXpsOMStoryFragmentsResource(storyFragmentsResource)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMDocumentStructureResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocumentstructureresource
     */
    CreateDocumentStructureResource(acquiredStream, partUri) {
        result := ComCall(7, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &documentStructureResource := 0, "HRESULT")
        return IXpsOMDocumentStructureResource(documentStructureResource)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMSignatureBlockResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createsignatureblockresource
     */
    CreateSignatureBlockResource(acquiredStream, partUri) {
        result := ComCall(8, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &signatureBlockResource := 0, "HRESULT")
        return IXpsOMSignatureBlockResource(signatureBlockResource)
    }

    /**
     * 
     * @param {IXpsOMDictionary} dictionary 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMRemoteDictionaryResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createremotedictionaryresource
     */
    CreateRemoteDictionaryResource(dictionary, partUri) {
        result := ComCall(9, this, "ptr", dictionary, "ptr", partUri, "ptr*", &remoteDictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(remoteDictionaryResource)
    }

    /**
     * 
     * @param {IStream} dictionaryMarkupStream 
     * @param {IOpcPartUri} dictionaryPartUri 
     * @param {IXpsOMPartResources} resources 
     * @returns {IXpsOMRemoteDictionaryResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createremotedictionaryresourcefromstream
     */
    CreateRemoteDictionaryResourceFromStream(dictionaryMarkupStream, dictionaryPartUri, resources) {
        result := ComCall(10, this, "ptr", dictionaryMarkupStream, "ptr", dictionaryPartUri, "ptr", resources, "ptr*", &dictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(dictionaryResource)
    }

    /**
     * 
     * @returns {IXpsOMPartResources} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpartresources
     */
    CreatePartResources() {
        result := ComCall(11, this, "ptr*", &partResources := 0, "HRESULT")
        return IXpsOMPartResources(partResources)
    }

    /**
     * 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMDocumentSequence} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocumentsequence
     */
    CreateDocumentSequence(partUri) {
        result := ComCall(12, this, "ptr", partUri, "ptr*", &documentSequence := 0, "HRESULT")
        return IXpsOMDocumentSequence(documentSequence)
    }

    /**
     * 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMDocument} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdocument
     */
    CreateDocument(partUri) {
        result := ComCall(13, this, "ptr", partUri, "ptr*", &document := 0, "HRESULT")
        return IXpsOMDocument(document)
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} advisoryPageDimensions 
     * @returns {IXpsOMPageReference} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpagereference
     */
    CreatePageReference(advisoryPageDimensions) {
        result := ComCall(14, this, "ptr", advisoryPageDimensions, "ptr*", &pageReference := 0, "HRESULT")
        return IXpsOMPageReference(pageReference)
    }

    /**
     * 
     * @param {Pointer<XPS_SIZE>} pageDimensions 
     * @param {PWSTR} language 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMPage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpage
     */
    CreatePage(pageDimensions, language, partUri) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(15, this, "ptr", pageDimensions, "ptr", language, "ptr", partUri, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * 
     * @param {IStream} pageMarkupStream 
     * @param {IOpcPartUri} partUri 
     * @param {IXpsOMPartResources} resources 
     * @param {BOOL} reuseObjects 
     * @returns {IXpsOMPage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpagefromstream
     */
    CreatePageFromStream(pageMarkupStream, partUri, resources, reuseObjects) {
        result := ComCall(16, this, "ptr", pageMarkupStream, "ptr", partUri, "ptr", resources, "int", reuseObjects, "ptr*", &page := 0, "HRESULT")
        return IXpsOMPage(page)
    }

    /**
     * 
     * @returns {IXpsOMCanvas} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcanvas
     */
    CreateCanvas() {
        result := ComCall(17, this, "ptr*", &canvas := 0, "HRESULT")
        return IXpsOMCanvas(canvas)
    }

    /**
     * 
     * @param {IXpsOMFontResource} fontResource 
     * @returns {IXpsOMGlyphs} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createglyphs
     */
    CreateGlyphs(fontResource) {
        result := ComCall(18, this, "ptr", fontResource, "ptr*", &glyphs := 0, "HRESULT")
        return IXpsOMGlyphs(glyphs)
    }

    /**
     * 
     * @returns {IXpsOMPath} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpath
     */
    CreatePath() {
        result := ComCall(19, this, "ptr*", &path := 0, "HRESULT")
        return IXpsOMPath(path)
    }

    /**
     * 
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategeometry
     */
    CreateGeometry() {
        result := ComCall(20, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @returns {IXpsOMGeometryFigure} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategeometryfigure
     */
    CreateGeometryFigure(startPoint) {
        result := ComCall(21, this, "ptr", startPoint, "ptr*", &figure := 0, "HRESULT")
        return IXpsOMGeometryFigure(figure)
    }

    /**
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creatematrixtransform
     */
    CreateMatrixTransform(matrix) {
        result := ComCall(22, this, "ptr", matrix, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {IXpsOMColorProfileResource} colorProfile 
     * @returns {IXpsOMSolidColorBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createsolidcolorbrush
     */
    CreateSolidColorBrush(color, colorProfile) {
        result := ComCall(23, this, "ptr", color, "ptr", colorProfile, "ptr*", &solidColorBrush := 0, "HRESULT")
        return IXpsOMSolidColorBrush(solidColorBrush)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMColorProfileResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcolorprofileresource
     */
    CreateColorProfileResource(acquiredStream, partUri) {
        result := ComCall(24, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &colorProfileResource := 0, "HRESULT")
        return IXpsOMColorProfileResource(colorProfileResource)
    }

    /**
     * 
     * @param {IXpsOMImageResource} image 
     * @param {Pointer<XPS_RECT>} viewBox 
     * @param {Pointer<XPS_RECT>} viewPort 
     * @returns {IXpsOMImageBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createimagebrush
     */
    CreateImageBrush(image, viewBox, viewPort) {
        result := ComCall(25, this, "ptr", image, "ptr", viewBox, "ptr", viewPort, "ptr*", &imageBrush := 0, "HRESULT")
        return IXpsOMImageBrush(imageBrush)
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewBox 
     * @param {Pointer<XPS_RECT>} viewPort 
     * @returns {IXpsOMVisualBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createvisualbrush
     */
    CreateVisualBrush(viewBox, viewPort) {
        result := ComCall(26, this, "ptr", viewBox, "ptr", viewPort, "ptr*", &visualBrush := 0, "HRESULT")
        return IXpsOMVisualBrush(visualBrush)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {Integer} contentType 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMImageResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createimageresource
     */
    CreateImageResource(acquiredStream, contentType, partUri) {
        result := ComCall(27, this, "ptr", acquiredStream, "int", contentType, "ptr", partUri, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMPrintTicketResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createprintticketresource
     */
    CreatePrintTicketResource(acquiredStream, partUri) {
        result := ComCall(28, this, "ptr", acquiredStream, "ptr", partUri, "ptr*", &printTicketResource := 0, "HRESULT")
        return IXpsOMPrintTicketResource(printTicketResource)
    }

    /**
     * 
     * @param {IStream} acquiredStream 
     * @param {Integer} fontEmbedding 
     * @param {IOpcPartUri} partUri 
     * @param {BOOL} isObfSourceStream 
     * @returns {IXpsOMFontResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createfontresource
     */
    CreateFontResource(acquiredStream, fontEmbedding, partUri, isObfSourceStream) {
        result := ComCall(29, this, "ptr", acquiredStream, "int", fontEmbedding, "ptr", partUri, "int", isObfSourceStream, "ptr*", &fontResource := 0, "HRESULT")
        return IXpsOMFontResource(fontResource)
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {IXpsOMColorProfileResource} colorProfile 
     * @param {Float} offset 
     * @returns {IXpsOMGradientStop} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-creategradientstop
     */
    CreateGradientStop(color, colorProfile, offset) {
        result := ComCall(30, this, "ptr", color, "ptr", colorProfile, "float", offset, "ptr*", &gradientStop := 0, "HRESULT")
        return IXpsOMGradientStop(gradientStop)
    }

    /**
     * 
     * @param {IXpsOMGradientStop} gradStop1 
     * @param {IXpsOMGradientStop} gradStop2 
     * @param {Pointer<XPS_POINT>} startPoint 
     * @param {Pointer<XPS_POINT>} endPoint 
     * @returns {IXpsOMLinearGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createlineargradientbrush
     */
    CreateLinearGradientBrush(gradStop1, gradStop2, startPoint, endPoint) {
        result := ComCall(31, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", startPoint, "ptr", endPoint, "ptr*", &linearGradientBrush := 0, "HRESULT")
        return IXpsOMLinearGradientBrush(linearGradientBrush)
    }

    /**
     * 
     * @param {IXpsOMGradientStop} gradStop1 
     * @param {IXpsOMGradientStop} gradStop2 
     * @param {Pointer<XPS_POINT>} centerPoint 
     * @param {Pointer<XPS_POINT>} gradientOrigin 
     * @param {Pointer<XPS_SIZE>} radiiSizes 
     * @returns {IXpsOMRadialGradientBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createradialgradientbrush
     */
    CreateRadialGradientBrush(gradStop1, gradStop2, centerPoint, gradientOrigin, radiiSizes) {
        result := ComCall(32, this, "ptr", gradStop1, "ptr", gradStop2, "ptr", centerPoint, "ptr", gradientOrigin, "ptr", radiiSizes, "ptr*", &radialGradientBrush := 0, "HRESULT")
        return IXpsOMRadialGradientBrush(radialGradientBrush)
    }

    /**
     * 
     * @param {IOpcPartUri} partUri 
     * @returns {IXpsOMCoreProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createcoreproperties
     */
    CreateCoreProperties(partUri) {
        result := ComCall(33, this, "ptr", partUri, "ptr*", &coreProperties := 0, "HRESULT")
        return IXpsOMCoreProperties(coreProperties)
    }

    /**
     * 
     * @returns {IXpsOMDictionary} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createdictionary
     */
    CreateDictionary() {
        result := ComCall(34, this, "ptr*", &dictionary := 0, "HRESULT")
        return IXpsOMDictionary(dictionary)
    }

    /**
     * 
     * @returns {IXpsOMPartUriCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createparturicollection
     */
    CreatePartUriCollection() {
        result := ComCall(35, this, "ptr*", &partUriCollection := 0, "HRESULT")
        return IXpsOMPartUriCollection(partUriCollection)
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
     * @returns {IXpsOMPackageWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronfile
     */
    CreatePackageWriterOnFile(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(36, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
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
     * @returns {IXpsOMPackageWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createpackagewriteronstream
     */
    CreatePackageWriterOnStream(outputStream, optimizeMarkupSize, interleaving, documentSequencePartName, coreProperties, packageThumbnail, documentSequencePrintTicket, discardControlPartName) {
        result := ComCall(37, this, "ptr", outputStream, "int", optimizeMarkupSize, "int", interleaving, "ptr", documentSequencePartName, "ptr", coreProperties, "ptr", packageThumbnail, "ptr", documentSequencePrintTicket, "ptr", discardControlPartName, "ptr*", &packageWriter := 0, "HRESULT")
        return IXpsOMPackageWriter(packageWriter)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createparturi
     */
    CreatePartUri(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(38, this, "ptr", uri, "ptr*", &partUri := 0, "HRESULT")
        return IOpcPartUri(partUri)
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomobjectfactory-createreadonlystreamonfile
     */
    CreateReadOnlyStreamOnFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(39, this, "ptr", filename, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }
}
