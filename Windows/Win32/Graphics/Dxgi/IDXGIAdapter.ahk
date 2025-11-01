#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIObject.ahk

/**
 * The IDXGIAdapter interface represents a display subsystem (including one or more GPUs, DACs and video memory).
 * @remarks
 * 
  * A display subsystem is often referred to as a video card, however, on some machines the display subsystem is part of the motherboard.
  *           
  * 
  * To enumerate the display subsystems, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory::EnumAdapters</a>.
  *           
  * 
  * To get an interface to the adapter for a particular device, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-getadapter">IDXGIDevice::GetAdapter</a>.
  *           
  * 
  * To create a software adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createsoftwareadapter">IDXGIFactory::CreateSoftwareAdapter</a>.
  *           
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgiadapter
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIAdapter extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIAdapter
     * @type {Guid}
     */
    static IID => Guid("{2411e7e1-12ac-4ccf-bd14-9798e8534dc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumOutputs", "GetDesc", "CheckInterfaceSupport"]

    /**
     * 
     * @param {Integer} Output 
     * @param {Pointer<IDXGIOutput>} ppOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiadapter-enumoutputs
     */
    EnumOutputs(Output, ppOutput) {
        result := ComCall(7, this, "uint", Output, "ptr*", ppOutput, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_ADAPTER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiadapter-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(8, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} InterfaceName 
     * @param {Pointer<Integer>} pUMDVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiadapter-checkinterfacesupport
     */
    CheckInterfaceSupport(InterfaceName, pUMDVersion) {
        result := ComCall(9, this, "ptr", InterfaceName, "int64*", pUMDVersion, "HRESULT")
        return result
    }
}
