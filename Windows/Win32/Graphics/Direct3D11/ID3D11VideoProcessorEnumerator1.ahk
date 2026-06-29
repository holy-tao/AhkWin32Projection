#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\ID3D11VideoProcessorEnumerator.ahk" { ID3D11VideoProcessorEnumerator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Enumerates the video processor capabilities of a Microsoft Direct3D 11 device. (ID3D11VideoProcessorEnumerator1)
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11videoprocessorenumerator1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoProcessorEnumerator1 extends ID3D11VideoProcessorEnumerator {
    /**
     * The interface identifier for ID3D11VideoProcessorEnumerator1
     * @type {Guid}
     */
    static IID := Guid("{465217f2-5568-43cf-b5b9-f61d54531ca1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoProcessorEnumerator1 interfaces
    */
    struct Vtbl extends ID3D11VideoProcessorEnumerator.Vtbl {
        CheckVideoProcessorFormatConversion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoProcessorEnumerator1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates whether the driver supports the specified combination of format and colorspace conversions.
     * @param {DXGI_FORMAT} InputFormat Type: <b>DXGI_FORMAT</b>
     * 
     * The format of the video processor input.
     * @param {DXGI_COLOR_SPACE_TYPE} InputColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * The colorspace of the video processor input.
     * @param {DXGI_FORMAT} OutputFormat Type: <b>DXGI_FORMAT</b>
     * 
     * The format of the video processor output.
     * @param {DXGI_COLOR_SPACE_TYPE} OutputColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * The colorspace of the video processor output.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer to a boolean that is set by the driver to indicate if the specified combination of format and colorspace conversions is supported. True if the conversion is supported; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videoprocessorenumerator1-checkvideoprocessorformatconversion
     */
    CheckVideoProcessorFormatConversion(InputFormat, InputColorSpace, OutputFormat, OutputColorSpace) {
        result := ComCall(13, this, DXGI_FORMAT, InputFormat, DXGI_COLOR_SPACE_TYPE, InputColorSpace, DXGI_FORMAT, OutputFormat, DXGI_COLOR_SPACE_TYPE, OutputColorSpace, BOOL.Ptr, &pSupported := 0, "HRESULT")
        return pSupported
    }

    Query(iid) {
        if (ID3D11VideoProcessorEnumerator1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckVideoProcessorFormatConversion := CallbackCreate(GetMethod(implObj, "CheckVideoProcessorFormatConversion"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckVideoProcessorFormatConversion)
    }
}
