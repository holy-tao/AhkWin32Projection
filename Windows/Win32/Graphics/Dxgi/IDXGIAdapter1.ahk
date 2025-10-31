#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIAdapter.ahk

/**
 * The IDXGIAdapter1 interface represents a display sub-system (including one or more GPU's, DACs and video memory).
 * @remarks
 * 
  * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on
  *             Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/kb/971644">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
  *           
  * 
  * A display sub-system is often referred to as a video card, however, on some machines the display sub-system is part of the mother board.
  * 
  * To enumerate the display sub-systems, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1">IDXGIFactory1::EnumAdapters1</a>. To get an interface to the adapter for a
  *             particular device, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-getadapter">IDXGIDevice::GetAdapter</a>. To create a software adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createsoftwareadapter">IDXGIFactory::CreateSoftwareAdapter</a>.
  *           
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgiadapter1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIAdapter1 extends IDXGIAdapter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIAdapter1
     * @type {Guid}
     */
    static IID => Guid("{29038f61-3839-4626-91fd-086879011a05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1"]

    /**
     * 
     * @param {Pointer<DXGI_ADAPTER_DESC1>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiadapter1-getdesc1
     */
    GetDesc1(pDesc) {
        result := ComCall(10, this, "ptr", pDesc, "HRESULT")
        return result
    }
}
