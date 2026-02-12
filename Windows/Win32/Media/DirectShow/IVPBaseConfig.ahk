#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\DDVIDEOPORTCONNECT.ahk
#Include ..\..\Graphics\DirectDraw\DDPIXELFORMAT.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDrawSurface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IVPBaseConfig is implemented on a filter that wraps a hardware device such as a decoder or capture device, if the device has a video port to the graphics adapter.
 * @remarks
 * Include Dvp.h and Vptype.h before Vpconfig.h.
 * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nn-vpconfig-ivpbaseconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPBaseConfig extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectInfo", "SetConnectInfo", "GetVPDataInfo", "GetMaxPixelRate", "InformVPInputFormats", "GetVideoFormats", "SetVideoFormat", "SetInvertPolarity", "GetOverlaySurface", "SetDirectDrawKernelHandle", "SetVideoPortID", "SetDDSurfaceKernelHandles", "SetSurfaceParameters"]

    /**
     * The GetConnectInfo method retrieves information about the connections supported by the VPE object.
     * @remarks
     * The client first calls this method with the value <b>NULL</b> for the <i>pddVPConnectInfo</i> parameter. The device returns the number of <b>DDVIDEOPORTCONNECT</b> structures in the <i>pdwNumConnectInfo</i> parameter. The client allocates an array of that size, and calls the method again, passing the address of the array in the <i>pddVPConnectInfo</i> parameter. The device copies the connection information into the buffer, and returns the actual number of copied structures in the <i>pdwNumConnectInfo</i> parameter.
     * 
     * The <b>DDVIDEOPORTCONNECT</b> structure is documented in the Windows DDK. The device can translate this method directly into an <i>DdVideoPortGetConnectInfo</i> call.
     * 
     * The client sets the connection information by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vpconfig/nf-vpconfig-ivpbaseconfig-setconnectinfo">IVPBaseConfig::SetConnectInfo</a> method with an index number, which references one of the connection structures returned by this method.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer<Integer>} pdwNumConnectInfo Pointer to a variable that specifies the number of <b>DDVIDEOPORTCONNECT</b> structures in the <i>pddVPConnectInfo</i> array. On input, specifies the size of the array (in number of array elements). On output, contains the actual number of <b>DDVIDEOPORTCONNECT</b> structures that were copied into the array. If <i>pddVPConnectInfo</i> is <b>NULL</b>, the method returns the required array size.
     * @returns {DDVIDEOPORTCONNECT} Pointer to an array of <b>DDVIDEOPORTCONNECT</b> structures, allocated by the caller. The device fills in the array with the connection information.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-getconnectinfo
     */
    GetConnectInfo(pdwNumConnectInfo) {
        pdwNumConnectInfoMarshal := pdwNumConnectInfo is VarRef ? "uint*" : "ptr"

        pddVPConnectInfo := DDVIDEOPORTCONNECT()
        result := ComCall(3, this, pdwNumConnectInfoMarshal, pdwNumConnectInfo, "ptr", pddVPConnectInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pddVPConnectInfo
    }

    /**
     * The SetConnectInfo method sets the video port connection parameters.
     * @remarks
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Integer} dwChosenEntry Specifies the index of connect information to pass to the driver. The value is a zero-based index into the array returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vpconfig/nf-vpconfig-ivpbaseconfig-getconnectinfo">IVPBaseConfig::GetConnectInfo</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setconnectinfo
     */
    SetConnectInfo(dwChosenEntry) {
        result := ComCall(4, this, "uint", dwChosenEntry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetVPDataInfo method retrieves the current video port data information.
     * @remarks
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer<AMVPDATAINFO>} pamvpDataInfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ns-vptype-amvpdatainfo">AMVPDATAINFO</a> structure allocated by the caller. The device fills in the structure with information about the video port.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-getvpdatainfo
     */
    GetVPDataInfo(pamvpDataInfo) {
        result := ComCall(5, this, "ptr", pamvpDataInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetMaxPixelRate method retrieves the maximum pixel rate the device will output for a given width and height.
     * @remarks
     * This method retrieves the maximum pixels per second expected for a given size. If the device does not support this size, then it returns the rate and the size that it supports.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer<AMVPSIZE>} pamvpSize Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ns-vptype-amvpsize">AMVPSIZE</a> structure containing the desired width and height.
     * @param {Pointer<Integer>} pdwMaxPixelsPerSecond Pointer to a variable that receives the maximum pixel rate, in pixels per second.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-getmaxpixelrate
     */
    GetMaxPixelRate(pamvpSize, pdwMaxPixelsPerSecond) {
        pdwMaxPixelsPerSecondMarshal := pdwMaxPixelsPerSecond is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pamvpSize, pdwMaxPixelsPerSecondMarshal, pdwMaxPixelsPerSecond, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The InformVPInputFormats method informs the device what video formats the video port supports.
     * @remarks
     * The supplied array of supported video port formats might determine what formats the device, in turn, proposes.
     * 
     * The <b>DDPIXELFORMAT</b> structure is documented in the Windows DDK.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Integer} dwNumFormats Number of video formats contained in the <i>pDDPixelFormats</i> parameter.
     * @param {Pointer<DDPIXELFORMAT>} pDDPixelFormats Pointer to an array of pixel format structures (<b>DDPIXELFORMAT</b>) to send to the device.
     * @returns {HRESULT} Returns S_FALSE if failure, or S_OK otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-informvpinputformats
     */
    InformVPInputFormats(dwNumFormats, pDDPixelFormats) {
        result := ComCall(7, this, "uint", dwNumFormats, "ptr", pDDPixelFormats, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetVideoFormats method retrieves the video formats the driver supports.
     * @remarks
     * The client first calls this method with the value <b>NULL</b> for the <i>pddPixelFormats</i> parameter. The device returns the number of <b>DDPIXELFORMAT</b> structures in the <i>pddPixelFormatso</i> parameter. The client allocates an array of that size, and calls the method again, passing the address of the array in the <i>pddPixelFormats</i> parameter. The device copies the format information into the buffer, and returns the actual number of copied structures in the <i>pddPixelFormats</i> parameter.
     * 
     * The <b>DDPIXELFORMAT</b> structure is documented in the Windows DDK.
     * 
     * The client sets the format by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vpconfig/nf-vpconfig-ivpbaseconfig-setvideoformat">IVPBaseConfig::SetVideoFormat</a> method with an index number, which references one of the format structures returned by this method.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer<Integer>} pdwNumFormats Pointer to a variable that specifies the number of <b>DDPIXELFORMAT</b> structures in the <i>pddPixelFormats</i> array. On input, specifies the size of the array (in number of array elements). On output, contains the actual number of <b>DDPIXELFORMAT</b> structures that were copied into the array. If <i>pddPixelFormat</i> is <b>NULL</b>, the method returns the required array size.
     * @returns {DDPIXELFORMAT} Pointer to an array of <b>DDPIXELFORMAT</b> structures, allocated by the caller. The device fills in the array with the format information.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-getvideoformats
     */
    GetVideoFormats(pdwNumFormats) {
        pdwNumFormatsMarshal := pdwNumFormats is VarRef ? "uint*" : "ptr"

        pddPixelFormats := DDPIXELFORMAT()
        result := ComCall(8, this, pdwNumFormatsMarshal, pdwNumFormats, "ptr", pddPixelFormats, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pddPixelFormats
    }

    /**
     * The SetVideoFormat method sets the video format.
     * @remarks
     * Retrieve the video formats by using <a href="https://docs.microsoft.com/windows/desktop/api/vpconfig/nf-vpconfig-ivpbaseconfig-getvideoformats">IVPBaseConfig::GetVideoFormats</a>.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Integer} dwChosenEntry Value specifying the index (zero-based) of the video pixel format to use.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setvideoformat
     */
    SetVideoFormat(dwChosenEntry) {
        result := ComCall(9, this, "uint", dwChosenEntry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetInvertPolarity method reverses the current polarity the device uses.
     * @remarks
     * Reversing polarity means asking the decoder or capture device to treat even fields as odd fields and vice versa.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setinvertpolarity
     */
    SetInvertPolarity() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetOverlaySurface method queries whether the caller should use the driver's overlay surface. If so, the method returns a pointer to the surface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> uses this function to determine if the driver requires the Overlay Mixer to use the driver's overlay surface. If this function returns <b>NULL</b>, then the Overlay Mixer allocates its own surface.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @returns {IDirectDrawSurface} Address of a pointer to the <b>IDirectDrawSurface</b> interface. If the caller should use the driver's overlay surface, it sets this variable equal to the <b>IDirectDrawSurface</b> interface for the overlay surface.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-getoverlaysurface
     */
    GetOverlaySurface() {
        result := ComCall(11, this, "ptr*", &ppddOverlaySurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawSurface(ppddOverlaySurface)
    }

    /**
     * The SetDirectDrawKernelHandle method sets the kernel-mode handle to the DirectDraw object. This handle enables the device's mini-driver to communicate with DirectDraw.
     * @remarks
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Pointer} dwDDKernelHandle Specifies the kernel-mode handle of the DirectDraw object.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setdirectdrawkernelhandle
     */
    SetDirectDrawKernelHandle(dwDDKernelHandle) {
        result := ComCall(12, this, "ptr", dwDDKernelHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetVideoPortID method specifies the ID of the hardware video port to use.
     * @remarks
     * This method sets the DirectDraw video port ID on the mini driver to enable it to communicate with the video port directly.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Integer} dwVideoPortID Specifies the video port ID. This value corresponds to the <b>dwVideoPortID</b> member of the <b>DDVIDEOPORTDESC</b> structure, which is documented in the Windows DDK.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setvideoportid
     */
    SetVideoPortID(dwVideoPortID) {
        result := ComCall(13, this, "uint", dwVideoPortID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetDDSurfaceKernelHandles method specifies the kernel-mode handles of the DirectDraw surfaces to be used for the overlay surface.
     * @remarks
     * This method sets the DirectDraw handles for the overlay surface. There may be more than one attached surface, so the array may contain more than one surface handle.
     * 
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Integer} cHandles Specifies the number of handles in the <i>rgDDKernelHandles</i> array.
     * @param {Pointer<Pointer>} rgDDKernelHandles Address of an array of kernel-mode handles.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setddsurfacekernelhandles
     */
    SetDDSurfaceKernelHandles(cHandles, rgDDKernelHandles) {
        rgDDKernelHandlesMarshal := rgDDKernelHandles is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "uint", cHandles, rgDDKernelHandlesMarshal, rgDDKernelHandles, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetSurfaceParameters method informs the device of the layout of the overlay surface. The downstream filter (the Overlay Mixer, VBI Surface Allocator, or Video Port Manager) calls this method after it creates the overlay surface.
     * @remarks
     * Include Dvp.h and Vptype.h before Vpconfig.h.
     * @param {Integer} dwPitch Specifies the stride of the surface (also called the <i>pitch</i>), in pixels.
     * @param {Integer} dwXOrigin Specifies the X-coordinate of the pixel at which valid data starts.
     * @param {Integer} dwYOrigin Specifies the Y-coordinate of the pixel at which valid data starts.
     * @returns {HRESULT} Returns S_OK if successful, or E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpconfig/nf-vpconfig-ivpbaseconfig-setsurfaceparameters
     */
    SetSurfaceParameters(dwPitch, dwXOrigin, dwYOrigin) {
        result := ComCall(15, this, "uint", dwPitch, "uint", dwXOrigin, "uint", dwYOrigin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
