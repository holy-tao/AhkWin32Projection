#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Allows a format converter to be initialized with a planar source.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicplanarformatconverter
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPlanarFormatConverter extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICPlanarFormatConverter
     * @type {Guid}
     */
    static IID => Guid("{bebee9cb-83b0-4dcc-8132-b0aaa55eac96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CanConvert"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IWICBitmapSource>} ppPlanes 
     * @param {Integer} cPlanes 
     * @param {Pointer<Guid>} dstFormat 
     * @param {Integer} dither 
     * @param {IWICPalette} pIPalette 
     * @param {Float} alphaThresholdPercent 
     * @param {Integer} paletteTranslate 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(ppPlanes, cPlanes, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate) {
        result := ComCall(8, this, "ptr*", ppPlanes, "uint", cPlanes, "ptr", dstFormat, "int", dither, "ptr", pIPalette, "double", alphaThresholdPercent, "int", paletteTranslate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSrcPixelFormats 
     * @param {Integer} cSrcPlanes 
     * @param {Pointer<Guid>} dstPixelFormat 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicplanarformatconverter-canconvert
     */
    CanConvert(pSrcPixelFormats, cSrcPlanes, dstPixelFormat) {
        result := ComCall(9, this, "ptr", pSrcPixelFormats, "uint", cSrcPlanes, "ptr", dstPixelFormat, "int*", &pfCanConvert := 0, "HRESULT")
        return pfCanConvert
    }
}
