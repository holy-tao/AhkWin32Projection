#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput4.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput5 interface exposes a single method to specify a list of supported formats for fullscreen surfaces.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nn-dxgi1_5-idxgioutput5
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput5 extends IDXGIOutput4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput5
     * @type {Guid}
     */
    static IID => Guid("{80a07424-ab52-42eb-833c-0c42fd282d98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DuplicateOutput1"]

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Integer} Flags 
     * @param {Integer} SupportedFormatsCount 
     * @param {Pointer<Integer>} pSupportedFormats 
     * @param {Pointer<IDXGIOutputDuplication>} ppOutputDuplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgioutput5-duplicateoutput1
     */
    DuplicateOutput1(pDevice, Flags, SupportedFormatsCount, pSupportedFormats, ppOutputDuplication) {
        pSupportedFormatsMarshal := pSupportedFormats is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "ptr", pDevice, "uint", Flags, "uint", SupportedFormatsCount, pSupportedFormatsMarshal, pSupportedFormats, "ptr*", ppOutputDuplication, "HRESULT")
        return result
    }
}
