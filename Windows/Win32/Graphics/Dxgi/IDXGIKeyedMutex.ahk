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
     * Using a key, acquires exclusive rendering access to a shared resource.
     * @param {Integer} Key Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * A value that indicates which device to give access to. This method will succeed when the device that currently owns the surface calls 
     *           the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-releasesync">IDXGIKeyedMutex::ReleaseSync</a> method using the same value. This value can be any UINT64 value.
     * @param {Integer} dwMilliseconds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The time-out interval, in milliseconds. This method will return if the interval elapses, and the keyed mutex has not been released  using the specified <i>Key</i>. 
     *           If this value is set to zero, the <b>AcquireSync</b> method will test to see if the keyed mutex has been released and returns immediately. 
     *           If this value is set to INFINITE, the time-out interval will never elapse.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Return S_OK if successful.
     * 
     * If the owning device attempted to create another keyed mutex on the same shared resource, <b>AcquireSync</b> returns E_FAIL.
     * 
     * <b>AcquireSync</b> can also return the following <a href="/windows/desktop/WinProg/windows-data-types">DWORD</a> constants. Therefore, you should explicitly check for these constants. If you only use the <a href="/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> macro on the return value to determine if  <b>AcquireSync</b> succeeded, you will not catch these constants.
     * 
     * <ul>
     * <li>WAIT_ABANDONED - The shared surface and keyed mutex are no longer in a consistent state. 
     *         If <b>AcquireSync</b> returns this value, you should release and recreate both the keyed mutex and the shared surface.</li>
     * <li>WAIT_TIMEOUT - The time-out interval elapsed before the specified key was released.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgikeyedmutex-acquiresync
     */
    AcquireSync(Key, dwMilliseconds) {
        result := ComCall(8, this, "uint", Key, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * Using a key, releases exclusive rendering access to a shared resource.
     * @param {Integer} Key Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * A value that indicates which device to give access to. This method succeeds when the device that currently owns the surface calls the <b>ReleaseSync</b> method using the same value. This value can be any UINT64 value.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful.
     * 
     * If the device attempted to release a keyed mutex that is not valid or owned by the device, <b>ReleaseSync</b> returns E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgikeyedmutex-releasesync
     */
    ReleaseSync(Key) {
        result := ComCall(9, this, "uint", Key, "HRESULT")
        return result
    }
}
