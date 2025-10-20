#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDXGIDisplayControl interface exposes methods to indicate user preference for the operating system's stereoscopic 3D display behavior and to set stereoscopic 3D display status to enable or disable.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  The <b>IDXGIDisplayControl</b> interface is only used by the <b>Display</b> app of the operating system's Control Panel or by control applets from third party graphics vendors. This interface is not meant for developers of end-user apps.
  *         </div>
  * <div> </div>
  * <div class="alert"><b>Note</b>  The <b>IDXGIDisplayControl</b> interface does not exist for Windows Store apps.
  *         </div>
  * <div> </div>
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from a factory object (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgifactory2">IDXGIFactory2</a>) to retrieve the <b>IDXGIDisplayControl</b> interface. The following code shows how.
  *         
  * 
  * 
  * ```
  * IDXGIDisplayControl * pDXGIDisplayControl;
  * hr = g_pDXGIFactory->QueryInterface(__uuidof(IDXGIDisplayControl), (void **)&pDXGIDisplayControl);
  * ```
  * 
  * 
  * The operating system processes changes to stereo-enabled configuration asynchronously. Therefore, these changes might not be immediately visible in every process that calls <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidisplaycontrol-isstereoenabled">IDXGIDisplayControl::IsStereoEnabled</a> to query for stereo configuration.  Control applets can use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatusevent">IDXGIFactory2::RegisterStereoStatusEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatuswindow">IDXGIFactory2::RegisterStereoStatusWindow</a> method to register for notifications of all stereo configuration changes.
  *         
  * 
  * <b>Platform Update for Windows 7:  </b>Stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgidisplaycontrol
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDisplayControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDisplayControl
     * @type {Guid}
     */
    static IID => Guid("{ea9dbf1a-c88e-4486-854a-98aa0138f30c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsStereoEnabled", "SetStereoEnabled"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidisplaycontrol-isstereoenabled
     */
    IsStereoEnabled() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} enabled 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidisplaycontrol-setstereoenabled
     */
    SetStereoEnabled(enabled) {
        ComCall(4, this, "int", enabled)
    }
}
