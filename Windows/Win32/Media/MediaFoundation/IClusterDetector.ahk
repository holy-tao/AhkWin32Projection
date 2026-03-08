#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IToc.ahk
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
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(wBaseEntryLevel, wClusterEntryLevel) {
        result := ComCall(3, this, "ushort", wBaseEntryLevel, "ushort", wClusterEntryLevel, "HRESULT")
        return result
    }

    /**
     * The DetectAutoProxyUrl function (wininet.h) attempts to determine the location of a WPAD autoproxy script.
     * @remarks
     * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
     * <div> </div>
     * @param {Integer} dwMaxNumClusters 
     * @param {Float} fMinClusterDuration 
     * @param {Float} fMaxClusterDuration 
     * @param {IToc} pSrcToc 
     * @returns {IToc} 
     * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-detectautoproxyurl
     */
    Detect(dwMaxNumClusters, fMinClusterDuration, fMaxClusterDuration, pSrcToc) {
        result := ComCall(4, this, "uint", dwMaxNumClusters, "float", fMinClusterDuration, "float", fMaxClusterDuration, "ptr", pSrcToc, "ptr*", &ppDstToc := 0, "HRESULT")
        return IToc(ppDstToc)
    }
}
