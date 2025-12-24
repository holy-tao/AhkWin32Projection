#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontCollection.ahk
#Include .\IDWriteFontFile.ahk
#Include .\IDWriteFontFace.ahk
#Include .\IDWriteRenderingParams.ahk
#Include .\IDWriteTextFormat.ahk
#Include .\IDWriteTypography.ahk
#Include .\IDWriteGdiInterop.ahk
#Include .\IDWriteTextLayout.ahk
#Include .\IDWriteInlineObject.ahk
#Include .\IDWriteTextAnalyzer.ahk
#Include .\IDWriteNumberSubstitution.ahk
#Include .\IDWriteGlyphRunAnalysis.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to create all subsequent DirectWrite objects. This interface is the root factory interface for all DirectWrite objects.
 * @remarks
 * 
 * Create an <b>IDWriteFactory</b> object by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-dwritecreatefactory">DWriteCreateFactory</a> function.  
 * 
 * 
 * ```cpp
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = DWriteCreateFactory(
 *         DWRITE_FACTORY_TYPE_SHARED,
 *         __uuidof(IDWriteFactory),
 *         reinterpret_cast<IUnknown**>(&pDWriteFactory_)
 *         );
 * }
 * 
 * 
 * ```
 * 
 * 
 * An <b>IDWriteFactory</b> object holds state information, such as font loader registration and cached font data.  This state can be shared or isolated.  Shared is recommended for most applications because it saves memory.  However, isolated can be useful in situations where you want to have a separate state for some objects.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefactory
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFactory
     * @type {Guid}
     */
    static IID => Guid("{b859ee5a-d838-4b5b-a2e8-1adc7d93db48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemFontCollection", "CreateCustomFontCollection", "RegisterFontCollectionLoader", "UnregisterFontCollectionLoader", "CreateFontFileReference", "CreateCustomFontFileReference", "CreateFontFace", "CreateRenderingParams", "CreateMonitorRenderingParams", "CreateCustomRenderingParams", "RegisterFontFileLoader", "UnregisterFontFileLoader", "CreateTextFormat", "CreateTypography", "GetGdiInterop", "CreateTextLayout", "CreateGdiCompatibleTextLayout", "CreateEllipsisTrimmingSign", "CreateTextAnalyzer", "CreateNumberSubstitution", "CreateGlyphRunAnalysis"]

    /**
     * Gets an object which represents the set of installed fonts.
     * @param {BOOL} checkForUpdates Type: <b>BOOL</b>
     * 
     * If this parameter is nonzero, the function performs an immediate check for changes to the set of
     *     installed fonts. If this parameter is <b>FALSE</b>, the function will still detect changes if the font cache service is running, but
     *      there may be some latency. For example, an application might specify <b>TRUE</b> if it has itself just installed a font and wants to 
     *      be sure the font collection contains that font.
     * @returns {IDWriteFontCollection} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the system font collection object, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-getsystemfontcollection
     */
    GetSystemFontCollection(checkForUpdates) {
        result := ComCall(3, this, "ptr*", &fontCollection := 0, "int", checkForUpdates, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * Creates a font collection using a custom font collection loader.
     * @param {IDWriteFontCollectionLoader} collectionLoader Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollectionloader">IDWriteFontCollectionLoader</a>*</b>
     * 
     * An application-defined font collection loader, which must have been previously
     *      registered using <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-registerfontcollectionloader">RegisterFontCollectionLoader</a>.
     * @param {Pointer} collectionKey Type: <b>const void*</b>
     * 
     * The key used by the loader to identify a collection of font files.  The buffer allocated for this key should at least be the size of <i>collectionKeySize</i>.
     * @param {Integer} collectionKeySize Type: <b>UINT32</b>
     * 
     * The size, in bytes, of the collection key.
     * @returns {IDWriteFontCollection} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * Contains  an address of a pointer to the system font collection object if the method succeeds, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createcustomfontcollection
     */
    CreateCustomFontCollection(collectionLoader, collectionKey, collectionKeySize) {
        result := ComCall(4, this, "ptr", collectionLoader, "ptr", collectionKey, "uint", collectionKeySize, "ptr*", &fontCollection := 0, "HRESULT")
        return IDWriteFontCollection(fontCollection)
    }

    /**
     * Registers a custom font collection loader with the factory object.
     * @param {IDWriteFontCollectionLoader} fontCollectionLoader Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollectionloader">IDWriteFontCollectionLoader</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollectionloader">IDWriteFontCollectionLoader</a> object to be registered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-registerfontcollectionloader
     */
    RegisterFontCollectionLoader(fontCollectionLoader) {
        result := ComCall(5, this, "ptr", fontCollectionLoader, "HRESULT")
        return result
    }

    /**
     * Unregisters a custom font collection loader that was previously registered using RegisterFontCollectionLoader.
     * @param {IDWriteFontCollectionLoader} fontCollectionLoader Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollectionloader">IDWriteFontCollectionLoader</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollectionloader">IDWriteFontCollectionLoader</a> object to be unregistered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-unregisterfontcollectionloader
     */
    UnregisterFontCollectionLoader(fontCollectionLoader) {
        result := ComCall(6, this, "ptr", fontCollectionLoader, "HRESULT")
        return result
    }

    /**
     * Creates a font file reference object from a local font file.
     * @param {PWSTR} filePath Type: <b>const WCHAR*</b>
     * 
     * An array of characters that contains the absolute file path for the font file. Subsequent operations on the constructed object may fail
     *      if the user provided <i>filePath</i> doesn't correspond to a valid file on the disk.
     * @param {Pointer<FILETIME>} lastWriteTime Type: <b>const FILETIME*</b>
     * 
     * The last modified time of the input file path. If the parameter is omitted,
     *      the function will access the font file to obtain its last write time. You should specify this value
     *      to avoid extra disk access. Subsequent operations on the constructed object may fail
     *      if the user provided <i>lastWriteTime</i> doesn't match the file on the disk.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created font file reference object, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createfontfilereference
     */
    CreateFontFileReference(filePath, lastWriteTime) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(7, this, "ptr", filePath, "ptr", lastWriteTime, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * Creates a reference to an application-specific font file resource.
     * @param {Pointer} fontFileReferenceKey Type: <b>const void*</b>
     * 
     * A font file reference key that uniquely identifies the font file resource
     *      during the lifetime of <i>fontFileLoader</i>.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * The size of the font file reference key in bytes.
     * @param {IDWriteFontFileLoader} fontFileLoader Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileloader">IDWriteFontFileLoader</a>*</b>
     * 
     * The font file loader that will be used by the font system to load data from the file identified by
     *      <i>fontFileReferenceKey</i>.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * Contains an address of a pointer to the newly created font file object when this method succeeds, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createcustomfontfilereference
     */
    CreateCustomFontFileReference(fontFileReferenceKey, fontFileReferenceKeySize, fontFileLoader) {
        result := ComCall(8, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", fontFileLoader, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * Creates an object that represents a font face.
     * @param {Integer} fontFaceType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_face_type">DWRITE_FONT_FACE_TYPE</a></b>
     * 
     * A value that indicates the type of file format of the font face.
     * @param {Integer} numberOfFiles Type: <b>UINT32</b>
     * 
     * The number of font files, in element count, required to represent the font face.
     * @param {Pointer<IDWriteFontFile>} fontFiles Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>*</b>
     * 
     * A font file object representing the font face.  Because <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>maintains its own references
     *      to the input font file objects, you may release them after this call.
     * @param {Integer} faceIndex Type: <b>UINT32</b>
     * 
     * The zero-based index of a font face, in cases when the font files contain a collection of font faces.
     *      If the font files contain a single face, this value should be zero.
     * @param {Integer} fontFaceSimulationFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     * A value that indicates which, if any, font face simulation flags for algorithmic means of making text bold or italic are applied to the current font face.
     * @returns {IDWriteFontFace} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created font face object, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createfontface
     */
    CreateFontFace(fontFaceType, numberOfFiles, fontFiles, faceIndex, fontFaceSimulationFlags) {
        result := ComCall(9, this, "int", fontFaceType, "uint", numberOfFiles, "ptr*", fontFiles, "uint", faceIndex, "int", fontFaceSimulationFlags, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace(fontFace)
    }

    /**
     * Creates a rendering parameters object with default settings for the primary monitor. Different monitors may have different rendering parameters, for more information see the How to Add Support for Multiple Monitors topic.
     * @returns {IDWriteRenderingParams} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created  rendering parameters object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createrenderingparams
     */
    CreateRenderingParams() {
        result := ComCall(10, this, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams(renderingParams)
    }

    /**
     * Creates a rendering parameters object with default settings for the specified monitor. In most cases, this is the preferred way to create a rendering parameters object.
     * @param {HMONITOR} monitor Type: <b>HMONITOR</b>
     * 
     * A handle for the specified monitor.
     * @returns {IDWriteRenderingParams} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the rendering parameters object created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createmonitorrenderingparams
     */
    CreateMonitorRenderingParams(monitor) {
        monitor := monitor is Win32Handle ? NumGet(monitor, "ptr") : monitor

        result := ComCall(11, this, "ptr", monitor, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams(renderingParams)
    }

    /**
     * Creates a rendering parameters object with the specified properties.
     * @param {Float} gamma Type: <b>FLOAT</b>
     * 
     * The gamma level to be set for the new rendering parameters object.
     * @param {Float} enhancedContrast Type: <b>FLOAT</b>
     * 
     * The enhanced contrast level to be set for the new rendering parameters object.
     * @param {Float} clearTypeLevel Type: <b>FLOAT</b>
     * 
     * The ClearType level to be set for the new rendering parameters object.
     * @param {Integer} pixelGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     * Represents the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
     * @param {Integer} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a></b>
     * 
     * A value that represents the method (for example, ClearType natural quality) for rendering glyphs.
     * @returns {IDWriteRenderingParams} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created rendering parameters object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, clearTypeLevel, pixelGeometry, renderingMode) {
        result := ComCall(12, this, "float", gamma, "float", enhancedContrast, "float", clearTypeLevel, "int", pixelGeometry, "int", renderingMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams(renderingParams)
    }

    /**
     * Registers a font file loader with DirectWrite.
     * @param {IDWriteFontFileLoader} fontFileLoader Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileloader">IDWriteFontFileLoader</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileloader">IDWriteFontFileLoader</a> object for a particular file resource type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-registerfontfileloader
     */
    RegisterFontFileLoader(fontFileLoader) {
        result := ComCall(13, this, "ptr", fontFileLoader, "HRESULT")
        return result
    }

    /**
     * Unregisters a font file loader that was previously registered with the DirectWrite font system using RegisterFontFileLoader.
     * @param {IDWriteFontFileLoader} fontFileLoader Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileloader">IDWriteFontFileLoader</a>*</b>
     * 
     * Pointer to the file loader that was previously registered with the DirectWrite font system using <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-registerfontfileloader">RegisterFontFileLoader</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-unregisterfontfileloader
     */
    UnregisterFontFileLoader(fontFileLoader) {
        result := ComCall(14, this, "ptr", fontFileLoader, "HRESULT")
        return result
    }

    /**
     * Creates a text format object used for text layout.
     * @param {PWSTR} fontFamilyName Type: <b>const WCHAR*</b>
     * 
     * An array of characters that contains the name of the font family
     * @param {IDWriteFontCollection} fontCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>*</b>
     * 
     * A pointer to a font collection object. When this is <b>NULL</b>, indicates the system font collection.
     * @param {Integer} fontWeight Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * A value that indicates the font weight for the text object created by this method.
     * @param {Integer} fontStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * A value that indicates the font style for the text object created by this method.
     * @param {Integer} fontStretch Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value that indicates the font stretch for the text object created by this method.
     * @param {Float} fontSize Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIP ("device-independent pixel") units. A DIP equals 1/96 inch.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * An array of characters that contains the locale name.
     * @returns {IDWriteTextFormat} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to a  newly created text format object, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createtextformat
     */
    CreateTextFormat(fontFamilyName, fontCollection, fontWeight, fontStyle, fontStretch, fontSize, localeName) {
        fontFamilyName := fontFamilyName is String ? StrPtr(fontFamilyName) : fontFamilyName
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(15, this, "ptr", fontFamilyName, "ptr", fontCollection, "int", fontWeight, "int", fontStyle, "int", fontStretch, "float", fontSize, "ptr", localeName, "ptr*", &textFormat := 0, "HRESULT")
        return IDWriteTextFormat(textFormat)
    }

    /**
     * Creates a typography object for use in a text layout.
     * @returns {IDWriteTypography} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetypography">IDWriteTypography</a>**</b>
     * 
     * When this method returns, contains the address of  a pointer to a newly created typography object, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createtypography
     */
    CreateTypography() {
        result := ComCall(16, this, "ptr*", &typography := 0, "HRESULT")
        return IDWriteTypography(typography)
    }

    /**
     * Creates an object that is used for interoperability with GDI.
     * @returns {IDWriteGdiInterop} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritegdiinterop">IDWriteGdiInterop</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to a GDI interop object if successful, or <b>NULL</b> in case of failure.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-getgdiinterop
     */
    GetGdiInterop() {
        result := ComCall(17, this, "ptr*", &gdiInterop := 0, "HRESULT")
        return IDWriteGdiInterop(gdiInterop)
    }

    /**
     * Takes a string, text format, and associated constraints, and produces an object that represents the fully analyzed and formatted result.
     * @param {PWSTR} string Type: <b>const WCHAR*</b>
     * 
     * An array of characters that contains the string to create a new <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> object from. This array must be of length <i>stringLength</i> and can contain embedded <b>NULL</b> characters.
     * @param {Integer} stringLength Type: <b>UINT32</b>
     * 
     * The number of characters in  the string.
     * @param {IDWriteTextFormat} textFormat Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a>*</b>
     * 
     * A pointer to an object that indicates the format to apply to the string.
     * @param {Float} maxWidth Type: <b>FLOAT</b>
     * 
     * The width of the layout box.
     * @param {Float} maxHeight Type: <b>FLOAT</b>
     * 
     * The height of the layout box.
     * @returns {IDWriteTextLayout} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the resultant text layout object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createtextlayout
     */
    CreateTextLayout(string, stringLength, textFormat, maxWidth, maxHeight) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(18, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", maxWidth, "float", maxHeight, "ptr*", &textLayout := 0, "HRESULT")
        return IDWriteTextLayout(textLayout)
    }

    /**
     * Takes a string, format, and associated constraints, and produces an object representing the result, formatted for a particular display resolution and measuring mode.
     * @param {PWSTR} string Type: <b>const WCHAR*</b>
     * 
     * An array of characters that contains the string to create a new <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> object from. This array must be of length <i>stringLength</i> and can contain embedded <b>NULL</b> characters.
     * @param {Integer} stringLength Type: <b>UINT32</b>
     * 
     * The length of the string, in character count.
     * @param {IDWriteTextFormat} textFormat Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a>*</b>
     * 
     * The text formatting object to apply to the string.
     * @param {Float} layoutWidth Type: <b>FLOAT</b>
     * 
     * The width of the layout box.
     * @param {Float} layoutHeight Type: <b>FLOAT</b>
     * 
     * The height of the layout box.
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * The number of physical pixels per DIP (device independent pixel). For example, if rendering onto a 96 DPI device <i>pixelsPerDip</i>is 1. If rendering onto a 120 DPI device <i>pixelsPerDip</i> is 1.25 (120/96).
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * An optional transform applied to the glyphs and their positions. This transform is applied after the
     *      scaling specifies the font size and pixels per DIP.
     * @param {BOOL} useGdiNatural Type: <b>BOOL</b>
     * 
     *  Instructs the text layout to use the same metrics as GDI bi-level text when set to <b>FALSE</b>.
     *      When set to <b>TRUE</b>, instructs the text layout to use the same metrics as text measured by GDI using a font
     *      created with <b>CLEARTYPE_NATURAL_QUALITY</b>.
     * @returns {IDWriteTextLayout} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a>**</b>
     * 
     * When this method returns, contains an address to the pointer of the resultant text layout object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-creategdicompatibletextlayout
     */
    CreateGdiCompatibleTextLayout(string, stringLength, textFormat, layoutWidth, layoutHeight, pixelsPerDip, transform, useGdiNatural) {
        string := string is String ? StrPtr(string) : string

        result := ComCall(19, this, "ptr", string, "uint", stringLength, "ptr", textFormat, "float", layoutWidth, "float", layoutHeight, "float", pixelsPerDip, "ptr", transform, "int", useGdiNatural, "ptr*", &textLayout := 0, "HRESULT")
        return IDWriteTextLayout(textLayout)
    }

    /**
     * Creates an inline object for trimming, using an ellipsis as the omission sign.
     * @param {IDWriteTextFormat} textFormat Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a>*</b>
     * 
     * A text format object, created with <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createtextformat">CreateTextFormat</a>, used for text layout.
     * @returns {IDWriteInlineObject} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteinlineobject">IDWriteInlineObject</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the omission (that is, ellipsis trimming) sign created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createellipsistrimmingsign
     */
    CreateEllipsisTrimmingSign(textFormat) {
        result := ComCall(20, this, "ptr", textFormat, "ptr*", &trimmingSign := 0, "HRESULT")
        return IDWriteInlineObject(trimmingSign)
    }

    /**
     * Returns an interface for performing text analysis.
     * @returns {IDWriteTextAnalyzer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextanalyzer">IDWriteTextAnalyzer</a>**</b>
     * 
     * When this method returns, contains an address of  a pointer to the newly created text analyzer object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createtextanalyzer
     */
    CreateTextAnalyzer() {
        result := ComCall(21, this, "ptr*", &textAnalyzer := 0, "HRESULT")
        return IDWriteTextAnalyzer(textAnalyzer)
    }

    /**
     * Creates a number substitution object using a locale name, substitution method, and an indicator whether to ignore user overrides (use NLS defaults for the given culture instead).
     * @param {Integer} substitutionMethod Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_number_substitution_method">DWRITE_NUMBER_SUBSTITUTION_METHOD</a></b>
     * 
     * A value that specifies how to apply number substitution on digits and related punctuation.
     * @param {PWSTR} localeName Type: <b>const WCHAR*</b>
     * 
     * The name of the locale to be used in the <i>numberSubstitution</i> object.
     * @param {BOOL} ignoreUserOverride Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether to ignore user overrides.
     * @returns {IDWriteNumberSubstitution} Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritenumbersubstitution">IDWriteNumberSubstitution</a>**</b>
     * 
     * When this method returns, contains an address to  a pointer to the number substitution object created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createnumbersubstitution
     */
    CreateNumberSubstitution(substitutionMethod, localeName, ignoreUserOverride) {
        localeName := localeName is String ? StrPtr(localeName) : localeName

        result := ComCall(22, this, "int", substitutionMethod, "ptr", localeName, "int", ignoreUserOverride, "ptr*", &numberSubstitution := 0, "HRESULT")
        return IDWriteNumberSubstitution(numberSubstitution)
    }

    /**
     * Creates a glyph run analysis object, which encapsulates information used to render a glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * A structure that contains the properties of the glyph run (font face, advances, and so on).
     * @param {Float} pixelsPerDip Type: <b>FLOAT</b>
     * 
     * Number of physical pixels per DIP (device independent pixel). For example, if rendering onto a 96 DPI bitmap then <i>pixelsPerDip</i>is 1. If rendering onto a 120 DPI bitmap then <i>pixelsPerDip</i> is 1.25.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * Optional transform applied to the glyphs and their positions. This transform is applied after the scaling specified the <i>emSize</i> and <i>pixelsPerDip</i>.
     * @param {Integer} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a></b>
     * 
     * A value that specifies the rendering mode, which must be one of the raster rendering modes (that is, not default
     *      and not outline).
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Specifies the measuring mode to use with glyphs.
     * @param {Float} baselineOriginX Type: <b>FLOAT</b>
     * 
     * The horizontal position (X-coordinate) of the baseline origin, in DIPs.
     * @param {Float} baselineOriginY Type: <b>FLOAT</b>
     * 
     * Vertical position (Y-coordinate) of the baseline origin, in DIPs.
     * @returns {IDWriteGlyphRunAnalysis} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriteglyphrunanalysis">IDWriteGlyphRunAnalysis</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created glyph run analysis object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefactory-createglyphrunanalysis
     */
    CreateGlyphRunAnalysis(glyphRun, pixelsPerDip, transform, renderingMode, measuringMode, baselineOriginX, baselineOriginY) {
        result := ComCall(23, this, "ptr", glyphRun, "float", pixelsPerDip, "ptr", transform, "int", renderingMode, "int", measuringMode, "float", baselineOriginX, "float", baselineOriginY, "ptr*", &glyphRunAnalysis := 0, "HRESULT")
        return IDWriteGlyphRunAnalysis(glyphRunAnalysis)
    }
}
