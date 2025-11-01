#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput5.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput6 interface exposes methods to provide specific monitor capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nn-dxgi1_6-idxgioutput6
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput6 extends IDXGIOutput5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput6
     * @type {Guid}
     */
    static IID => Guid("{068346e8-aaec-4b84-add7-137f513f77a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1", "CheckHardwareCompositionSupport"]

    /**
     * 
     * @param {Pointer<DXGI_OUTPUT_DESC1>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgioutput6-getdesc1
     */
    GetDesc1(pDesc) {
        result := ComCall(27, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgioutput6-checkhardwarecompositionsupport
     */
    CheckHardwareCompositionSupport(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }
}
