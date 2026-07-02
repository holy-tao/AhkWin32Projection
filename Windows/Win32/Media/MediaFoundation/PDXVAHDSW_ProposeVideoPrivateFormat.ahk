#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gets a private surface format from a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * This function is called when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface">IDXVAHD_Device::CreateVideoSurface</a>  if  the following conditions are true:
 * 
 * <ul>
 * <li>The type of input surface is <b>DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE</b>.</li>
 * <li>The Direct3D device does not support the surface format requested by the application natively.</li>
 * </ul>
 * This function enables the plug-in device to propose an alternate format with an equivalent memory layout. For example, if the application requests AYUV, the plug-in device might allocate a surface of type <b>D3DFMT_A8R8G8B8</b>.
 * 
 * If the function succeeds, the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface">CreateVideoSurface</a> method attempts to create a surface with the format returned in <i>pFormat</i>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_proposevideoprivateformat
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_ProposeVideoPrivateFormat {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_ProposeVideoPrivateFormat) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDevice A handle to the plug-in DXVA-HD device.
     * @param {Pointer<D3DFORMAT>} pFormat A pointer to a <b>D3DFORMAT</b> value. On input, specifies the surface format that is requested by the application. On output, specifies the private surface format that the plug-in device proposes.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hDevice, pFormat) {
        pFormatMarshal := pFormat is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hDevice, pFormatMarshal, pFormat, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_ProposeVideoPrivateFormat that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_ProposeVideoPrivateFormat {
        /**
         * Creates a PDXVAHDSW_ProposeVideoPrivateFormat pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
