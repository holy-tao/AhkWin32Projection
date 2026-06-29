#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The default tracking interface sets reference default tracking options.
 * @remarks
 * These APIs require the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11refdefaulttrackingoptions
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11RefDefaultTrackingOptions extends IUnknown {
    /**
     * The interface identifier for ID3D11RefDefaultTrackingOptions
     * @type {Guid}
     */
    static IID := Guid("{03916615-c644-418c-9bf4-75db5be63ca0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11RefDefaultTrackingOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTrackingOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11RefDefaultTrackingOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets graphics processing unit (GPU) debug reference default tracking options for specific resource types.
     * @remarks
     * This API requires the Windows Software Development Kit (SDK) for Windows 8.
     * @param {Integer} ResourceTypeFlags A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_resource_type">D3D11_SHADER_TRACKING_RESOURCE_TYPE</a>-typed value that specifies the type of resource to track.
     * @param {Integer} Options A combination of <a href="https://docs.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_options">D3D11_SHADER_TRACKING_OPTIONS</a>-typed flags that are combined by using a bitwise <b>OR</b> operation. The resulting value identifies tracking options. If a flag is present, the tracking option that the flag represents is set to "on"; otherwise the tracking option is set to "off."
     * @returns {HRESULT} This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11refdefaulttrackingoptions-settrackingoptions
     */
    SetTrackingOptions(ResourceTypeFlags, Options) {
        result := ComCall(3, this, "uint", ResourceTypeFlags, "uint", Options, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11RefDefaultTrackingOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTrackingOptions := CallbackCreate(GetMethod(implObj, "SetTrackingOptions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTrackingOptions)
    }
}
