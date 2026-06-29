#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIOutput4.ahk" { IDXGIOutput4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIOutputDuplication.ahk" { IDXGIOutputDuplication }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput5 interface exposes a single method to specify a list of supported formats for fullscreen surfaces.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nn-dxgi1_5-idxgioutput5
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIOutput5 extends IDXGIOutput4 {
    /**
     * The interface identifier for IDXGIOutput5
     * @type {Guid}
     */
    static IID := Guid("{80a07424-ab52-42eb-833c-0c42fd282d98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIOutput5 interfaces
    */
    struct Vtbl extends IDXGIOutput4.Vtbl {
        DuplicateOutput1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIOutput5.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Pointer<DXGI_FORMAT>} pSupportedFormats Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>*</b>
     * 
     * Specifies an array, of length  <i>SupportedFormatsCount</i> of  <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> entries.
     * @returns {IDXGIOutputDuplication} Type: <b>IDXGIOutputDuplication**</b>
     * 
     * A pointer to a variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgioutput5-duplicateoutput1
     */
    DuplicateOutput1(pDevice, Flags, SupportedFormatsCount, pSupportedFormats) {
        pSupportedFormatsMarshal := pSupportedFormats is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "ptr", pDevice, "uint", Flags, "uint", SupportedFormatsCount, pSupportedFormatsMarshal, pSupportedFormats, "ptr*", &ppOutputDuplication := 0, "HRESULT")
        return IDXGIOutputDuplication(ppOutputDuplication)
    }

    Query(iid) {
        if (IDXGIOutput5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DuplicateOutput1 := CallbackCreate(GetMethod(implObj, "DuplicateOutput1"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DuplicateOutput1)
    }
}
