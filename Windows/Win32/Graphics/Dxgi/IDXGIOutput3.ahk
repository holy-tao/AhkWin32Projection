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
     * 
     * @param {Integer} EnumFormat 
     * @param {Pointer<IUnknown>} pConcernedDevice 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    CheckOverlaySupport(EnumFormat, pConcernedDevice, pFlags) {
        result := ComCall(24, this, "int", EnumFormat, "ptr", pConcernedDevice, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
