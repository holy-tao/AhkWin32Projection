#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Exposes methods that transforms an IWICBitmapSource from one color context to another.
 * @remarks
 * 
 * A <b>IWICColorTransform</b> is an imaging pipeline component that knows how to pull pixels obtained from a given <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> through a color transform. The color transform is defined by mapping colors from the source color context to the destination color context in a given output pixel format.
 * 
 * Once initialized, a color transform cannot be reinitialized. Because of this, a color transform cannot be used with multiple sources or varying parameters.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwiccolortransform
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICColorTransform extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICColorTransform
     * @type {Guid}
     */
    static IID => Guid("{b66f034f-d0e2-40ab-b436-6de39e321a94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IWICBitmapSource} pIBitmapSource 
     * @param {IWICColorContext} pIContextSource 
     * @param {IWICColorContext} pIContextDest 
     * @param {Pointer<Guid>} pixelFmtDest 
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
    Initialize(pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest) {
        result := ComCall(8, this, "ptr", pIBitmapSource, "ptr", pIContextSource, "ptr", pIContextDest, "ptr", pixelFmtDest, "HRESULT")
        return result
    }
}
