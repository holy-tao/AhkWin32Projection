#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies result flags for the ReclaimResources1 method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_RECLAIM_RESOURCE_RESULTS extends Win32Enum{

    /**
     * The surface was successfully reclaimed and has valid content. This result is identical to the <i>false</i> value returned by the older <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources">ReclaimResources</a> API.
     * @type {Integer (Int32)}
     */
    static DXGI_RECLAIM_RESOURCE_RESULT_OK => 0

    /**
     * The surface was reclaimed, but the old content was lost and must be regenerated. This result is identical to the <i>true</i> value returned by the older <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources">ReclaimResources</a> API.
     * @type {Integer (Int32)}
     */
    static DXGI_RECLAIM_RESOURCE_RESULT_DISCARDED => 1

    /**
     * Both the surface and its contents are lost and invalid. The surface must be 
     * recreated and the content regenerated in order to be used. All future use of that resource is invalid. Attempts to bind it to the pipeline or map a resource which returns this value will never succeed, and the resource cannot be reclaimed again.
     * @type {Integer (Int32)}
     */
    static DXGI_RECLAIM_RESOURCE_RESULT_NOT_COMMITTED => 2
}
