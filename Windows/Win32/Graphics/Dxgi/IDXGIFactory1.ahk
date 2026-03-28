#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory.ahk

/**
 * The IDXGIFactory1 interface implements methods for generating DXGI objects.
 * @remarks
 * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
 *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
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
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgifactory1
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
     * Enumerates both adapters (video cards) with or without outputs.
     * @remarks
     * This method is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * 
     * When you create a factory, the factory enumerates the set of adapters that are available in the system. Therefore, if you change the adapters in a system, you must destroy 
     *       and recreate the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> object. The number of adapters in a system changes when you add or remove a display card, or dock or undock a laptop. 
     * 
     * When the <b>EnumAdapters1</b> method succeeds and fills the <i>ppAdapter</i> parameter with the address of the pointer to the adapter interface, <b>EnumAdapters1</b> increments the adapter interface's reference count. When you finish using the 
     *       adapter interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method to decrement the reference count before you destroy the pointer.
     * 
     * <b>EnumAdapters1</b> first returns the adapter with the output on which the desktop primary is displayed. This adapter corresponds with an index of zero. <b>EnumAdapters1</b> next returns other adapters with outputs. <b>EnumAdapters1</b> finally returns adapters without outputs.
     * @param {Integer} _Adapter 
     * @param {Pointer<IDXGIAdapter1>} ppAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter1">IDXGIAdapter1</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter1">IDXGIAdapter1</a> interface at the position specified by the <i>Adapter</i> parameter.  
     *           This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_FOUND</a> if the index is greater than or equal to the number of adapters in the local 
     *       system, or <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a> if <i>ppAdapter</i> parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1
     */
    EnumAdapters1(_Adapter, ppAdapter) {
        result := ComCall(12, this, "uint", _Adapter, "ptr*", ppAdapter, "int")
        return result
    }

    /**
     * Informs an application of the possible need to re-enumerate adapters.
     * @remarks
     * This method is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>FALSE</b>, if a new adapter is becoming available or the current adapter is going away.
     *     <b>TRUE</b>, no adapter changes.
     * 
     * <b>IsCurrent</b> returns <b>FALSE</b> to inform the calling application to re-enumerate adapters.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory1-iscurrent
     */
    IsCurrent() {
        result := ComCall(13, this, "int")
        return result
    }
}
