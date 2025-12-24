#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory2.ahk

/**
 * Enables creating Microsoft DirectX Graphics Infrastructure (DXGI) objects.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgifactory3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory3 extends IDXGIFactory2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory3
     * @type {Guid}
     */
    static IID => Guid("{25483823-cd46-4c7d-86ca-47aa95b837bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCreationFlags"]

    /**
     * Gets the flags that were used when a Microsoft DirectX Graphics Infrastructure (DXGI) object was created.
     * @returns {Integer} The creation flags.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgifactory3-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(25, this, "uint")
        return result
    }
}
