#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDeviceSubObject.ahk

/**
 * Represents a keyed mutex, which allows exclusive access to a shared resource that is used by multiple devices.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> is required to create a resource capable of supporting the <b>IDXGIKeyedMutex</b> interface.
  * 
  * An <b>IDXGIKeyedMutex</b> should be retrieved for each device sharing a resource. In Direct3D 10.1, such a resource that is shared between two or more devices is created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_misc_flag">D3D10_RESOURCE_MISC_SHARED_KEYEDMUTEX</a>  flag. In Direct3D 11, such a resource that is shared between two or more devices is created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX</a>  flag.
  * 
  * For information about creating a keyed mutex, see the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-acquiresync">IDXGIKeyedMutex::AcquireSync</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgikeyedmutex
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIKeyedMutex extends IDXGIDeviceSubObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIKeyedMutex
     * @type {Guid}
     */
    static IID => Guid("{9d8e1289-d7b3-465f-8126-250e349af85d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireSync", "ReleaseSync"]

    /**
     * 
     * @param {Integer} Key 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgikeyedmutex-acquiresync
     */
    AcquireSync(Key, dwMilliseconds) {
        result := ComCall(8, this, "uint", Key, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgikeyedmutex-releasesync
     */
    ReleaseSync(Key) {
        result := ComCall(9, this, "uint", Key, "HRESULT")
        return result
    }
}
