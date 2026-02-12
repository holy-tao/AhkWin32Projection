#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutputDuplication.ahk
#Include .\IDXGIOutput4.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput5 interface exposes a single method to specify a list of supported formats for fullscreen surfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_5/nn-dxgi1_5-idxgioutput5
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
     * @remarks
     * This method allows directly receiving the original back buffer format used by a running fullscreen application. For comparison, using the original <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-duplicateoutput">DuplicateOutput</a> function always converts the fullscreen surface to a 32-bit BGRA format. In cases where the current fullscreen application is using a different buffer format, a conversion to 32-bit BGRA incurs a performance penalty. Besides the performance benefit of being able to skip format conversion, using <b>DuplicateOutput1</b> also allows receiving the full gamut of colors in cases where a high-color format (such as R10G10B10A2) is being presented.
     * 
     * 
     * 
     * The <i>pSupportedFormats</i> array should only contain display scan-out formats. See <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-0-feature-level-hardware">Format Support for Direct3D Feature Level 11.0 Hardware</a> for  required scan-out formats at each feature level. If the current fullscreen buffer format is not contained in the <i>pSupportedFormats</i> array, DXGI will pick one of the supplied formats and convert the fullscreen buffer to that format before returning from <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe">IDXGIOutputDuplication::AcquireNextFrame</a>. The list of supported formats should always contain DXGI_FORMAT_B8G8R8A8_UNORM, as this is the most common format for the desktop.
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
     * @returns {Pointer<IDXGIOutputDuplication>} Type: <b>IDXGIOutputDuplication**</b>
     * 
     * A pointer to a variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_5/nf-dxgi1_5-idxgioutput5-duplicateoutput1
     */
    DuplicateOutput1(pDevice, Flags, SupportedFormatsCount, pSupportedFormats) {
        pSupportedFormatsMarshal := pSupportedFormats is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "ptr", pDevice, "uint", Flags, "uint", SupportedFormatsCount, pSupportedFormatsMarshal, pSupportedFormats, "ptr*", &ppOutputDuplication := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppOutputDuplication
    }
}
