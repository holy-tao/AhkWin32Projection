#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutputDuplication.ahk
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
     * Allows specifying a list of supported formats for fullscreen surfaces that can be returned by the IDXGIOutputDuplication object.
     * @param {IUnknown} pDevice Type: <b>IUnknown*</b>
     * 
     * A pointer to the Direct3D device interface that you can use to process the desktop image. This device must be created from the adapter to which the output is connected.
     * @param {Integer} Flags Type: <b>UINT</b>
     * 
     * Reserved for future use; must be zero.
     * @param {Integer} SupportedFormatsCount Type: <b>UINT</b>
     * 
     * Specifies the number of supported formats.
     * @param {Pointer<Integer>} pSupportedFormats Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>*</b>
     * 
     * Specifies an array, of length  <i>SupportedFormatsCount</i> of  <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> entries.
     * @returns {IDXGIOutputDuplication} Type: <b>IDXGIOutputDuplication**</b>
     * 
     * A pointer to a variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nf-dxgi1_5-idxgioutput5-duplicateoutput1
     */
    DuplicateOutput1(pDevice, Flags, SupportedFormatsCount, pSupportedFormats) {
        pSupportedFormatsMarshal := pSupportedFormats is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "ptr", pDevice, "uint", Flags, "uint", SupportedFormatsCount, pSupportedFormatsMarshal, pSupportedFormats, "ptr*", &ppOutputDuplication := 0, "HRESULT")
        return IDXGIOutputDuplication(ppOutputDuplication)
    }
}
