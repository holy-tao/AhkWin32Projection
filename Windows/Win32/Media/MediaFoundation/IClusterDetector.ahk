#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IClusterDetector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClusterDetector
     * @type {Guid}
     */
    static IID => Guid("{3f07f7b7-c680-41d9-9423-915107ec9ff9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Detect"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} wBaseEntryLevel 
     * @param {Integer} wClusterEntryLevel 
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
    Initialize(wBaseEntryLevel, wClusterEntryLevel) {
        result := ComCall(3, this, "ushort", wBaseEntryLevel, "ushort", wClusterEntryLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxNumClusters 
     * @param {Float} fMinClusterDuration 
     * @param {Float} fMaxClusterDuration 
     * @param {IToc} pSrcToc 
     * @param {Pointer<IToc>} ppDstToc 
     * @returns {HRESULT} 
     */
    Detect(dwMaxNumClusters, fMinClusterDuration, fMaxClusterDuration, pSrcToc, ppDstToc) {
        result := ComCall(4, this, "uint", dwMaxNumClusters, "float", fMinClusterDuration, "float", fMaxClusterDuration, "ptr", pSrcToc, "ptr*", ppDstToc, "HRESULT")
        return result
    }
}
