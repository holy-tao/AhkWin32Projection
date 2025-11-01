#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput3.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput4 interface exposes a method to check for overlay color space support.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nn-dxgi1_4-idxgioutput4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput4 extends IDXGIOutput3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput4
     * @type {Guid}
     */
    static IID => Guid("{dc7dca35-2196-414d-9f53-617884032a60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckOverlayColorSpaceSupport"]

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} ColorSpace 
     * @param {IUnknown} pConcernedDevice 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgioutput4-checkoverlaycolorspacesupport
     */
    CheckOverlayColorSpaceSupport(Format, ColorSpace, pConcernedDevice, pFlags) {
        result := ComCall(25, this, "int", Format, "int", ColorSpace, "ptr", pConcernedDevice, "uint*", pFlags, "HRESULT")
        return result
    }
}
