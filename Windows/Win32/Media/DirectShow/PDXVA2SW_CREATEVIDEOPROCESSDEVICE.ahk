#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\MediaFoundation\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_CREATEVIDEOPROCESSDEVICE {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_CREATEVIDEOPROCESSDEVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirect3DDevice9} pD3DD9 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {D3DFORMAT} RenderTargetFormat 
     * @param {Integer} MaxSubStreams 
     * @returns {HANDLE} 
     */
    Call(pD3DD9, pVideoDesc, RenderTargetFormat, MaxSubStreams) {
        phDevice := HANDLE.Owned()
        result := DllCall(this.value, "ptr", pD3DD9, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, UInt32, MaxSubStreams, HANDLE.Ptr, phDevice, "HRESULT")
        return phDevice
    }

    /**
     * A PDXVA2SW_CREATEVIDEOPROCESSDEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_CREATEVIDEOPROCESSDEVICE {
        /**
         * Creates a PDXVA2SW_CREATEVIDEOPROCESSDEVICE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DXVA2_VideoDesc, D3DFORMAT, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DXVA2_VideoDesc.Ptr, D3DFORMAT, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
