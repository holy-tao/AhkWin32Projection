#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory.ahk

/**
 * The IDXGIFactory1 interface implements methods for generating DXGI objects.
 * @remarks
 * 
 * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
 *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/kb/971644">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
 * 
 * To create a factory, call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a> function.
 * 
 * Because you can create a Direct3D device without creating a swap chain, you might need to retrieve the factory that is used to create the device in order to create a swap chain.
 * You can request the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice1">IDXGIDevice1</a> interface from the Direct3D device and then use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getparent">IDXGIObject::GetParent</a> method to locate 
 * the factory.  The following code shows how.
 * 
 * 
 * ```
 * IDXGIDevice1 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice1), (void **)&pDXGIDevice);
 *       
 * IDXGIAdapter * pDXGIAdapter;
 * hr = pDXGIDevice->GetParent(__uuidof(IDXGIAdapter), (void **)&pDXGIAdapter);
 * 
 * IDXGIFactory1 * pIDXGIFactory;
 * pDXGIAdapter->GetParent(__uuidof(IDXGIFactory1), (void **)&pIDXGIFactory);
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgifactory1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory1 extends IDXGIFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory1
     * @type {Guid}
     */
    static IID => Guid("{770aae78-f26f-4dba-a829-253c83d1b387}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAdapters1", "IsCurrent"]

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<IDXGIAdapter1>} ppAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1
     */
    EnumAdapters1(Adapter, ppAdapter) {
        result := ComCall(12, this, "uint", Adapter, "ptr*", ppAdapter, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory1-iscurrent
     */
    IsCurrent() {
        result := ComCall(13, this, "int")
        return result
    }
}
