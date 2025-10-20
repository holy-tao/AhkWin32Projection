#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * Exposes methods that produce a clipped version of the input bitmap for a specified rectangular region of interest.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapclipper
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapClipper extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapClipper
     * @type {Guid}
     */
    static IID => Guid("{e4fbcf03-223d-4e81-9333-d635556dd1b5}")

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
     * @param {IWICBitmapSource} pISource 
     * @param {Pointer<WICRect>} prc 
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
    Initialize(pISource, prc) {
        result := ComCall(8, this, "ptr", pISource, "ptr", prc, "HRESULT")
        return result
    }
}
