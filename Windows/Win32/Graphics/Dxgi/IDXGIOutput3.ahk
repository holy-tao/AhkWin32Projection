#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput2.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput3 interface exposes a method to check for overlay support.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgioutput3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput3 extends IDXGIOutput2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput3
     * @type {Guid}
     */
    static IID => Guid("{8a6bb301-7e7e-41f4-a8e0-5b32f7f99b18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckOverlaySupport"]

    /**
     * 
     * @param {Integer} EnumFormat 
     * @param {IUnknown} pConcernedDevice 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgioutput3-checkoverlaysupport
     */
    CheckOverlaySupport(EnumFormat, pConcernedDevice) {
        result := ComCall(24, this, "int", EnumFormat, "ptr", pConcernedDevice, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }
}
