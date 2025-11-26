#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext3.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext4 adds new methods to those in ID3D11DeviceContext3.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11devicecontext4
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext4 extends ID3D11DeviceContext3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11DeviceContext4
     * @type {Guid}
     */
    static IID => Guid("{917600da-f58c-4c33-98d8-3e15b390fa24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 147

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Signal", "Wait"]

    /**
     * Updates a fence to a specified value after all previous work has completed.
     * @param {ID3D11Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> object.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value to set the fence to.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/win32/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11devicecontext4-signal
     */
    Signal(pFence, Value) {
        result := ComCall(147, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    /**
     * Waits until the specified fence reaches or exceeds the specified value before future work can begin.
     * @param {ID3D11Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> object.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value that the device context is waiting for the fence to reach or exceed.  So when  <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-getcompletedvalue">ID3D11Fence::GetCompletedValue</a> is greater than or equal to <i>Value</i>, the wait is terminated.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/win32/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11devicecontext4-wait
     */
    Wait(pFence, Value) {
        result := ComCall(148, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }
}
