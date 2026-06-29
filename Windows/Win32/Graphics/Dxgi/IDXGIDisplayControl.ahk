#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDXGIDisplayControl interface exposes methods to indicate user preference for the operating system's stereoscopic 3D display behavior and to set stereoscopic 3D display status to enable or disable.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgidisplaycontrol
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDisplayControl extends IUnknown {
    /**
     * The interface identifier for IDXGIDisplayControl
     * @type {Guid}
     */
    static IID := Guid("{ea9dbf1a-c88e-4486-854a-98aa0138f30c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDisplayControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsStereoEnabled  : IntPtr
        SetStereoEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDisplayControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a Boolean value that indicates whether the operating system's stereoscopic 3D display behavior is enabled.
     * @remarks
     * You pass a Boolean value to the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidisplaycontrol-setstereoenabled">IDXGIDisplayControl::SetStereoEnabled</a> method to either enable or disable the operating system's stereoscopic 3D display behavior. TRUE enables the operating system's stereoscopic 3D display behavior and FALSE disables it.
     * @returns {BOOL} <b>IsStereoEnabled</b> returns TRUE when the operating system's stereoscopic 3D display behavior is enabled and FALSE when this behavior is disabled.
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>IsStereoEnabled</b> always returns FALSE because stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidisplaycontrol-isstereoenabled
     */
    IsStereoEnabled() {
        result := ComCall(3, this, BOOL)
        return result
    }

    /**
     * Set a Boolean value to either enable or disable the operating system's stereoscopic 3D display behavior.
     * @remarks
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>SetStereoEnabled</b> doesn't change stereoscopic 3D display behavior because stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @param {BOOL} enabled A Boolean value that either enables or disables the operating system's stereoscopic 3D display behavior. TRUE enables the operating system's stereoscopic 3D display behavior and FALSE disables it.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidisplaycontrol-setstereoenabled
     */
    SetStereoEnabled(enabled) {
        ComCall(4, this, BOOL, enabled)
    }

    Query(iid) {
        if (IDXGIDisplayControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsStereoEnabled := CallbackCreate(GetMethod(implObj, "IsStereoEnabled"), flags, 1)
        this.vtbl.SetStereoEnabled := CallbackCreate(GetMethod(implObj, "SetStereoEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsStereoEnabled)
        CallbackFree(this.vtbl.SetStereoEnabled)
    }
}
