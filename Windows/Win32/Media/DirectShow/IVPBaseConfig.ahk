#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IVPBaseConfig is implemented on a filter that wraps a hardware device such as a decoder or capture device, if the device has a video port to the graphics adapter.
 * @remarks
 * 
  * Include Dvp.h and Vptype.h before Vpconfig.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vpconfig/nn-vpconfig-ivpbaseconfig
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
     * 
     * @param {Pointer<Integer>} pdwNumConnectInfo 
     * @param {Pointer<DDVIDEOPORTCONNECT>} pddVPConnectInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-getconnectinfo
     */
    GetConnectInfo(pdwNumConnectInfo, pddVPConnectInfo) {
        result := ComCall(3, this, "uint*", pdwNumConnectInfo, "ptr", pddVPConnectInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChosenEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setconnectinfo
     */
    SetConnectInfo(dwChosenEntry) {
        result := ComCall(4, this, "uint", dwChosenEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMVPDATAINFO>} pamvpDataInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-getvpdatainfo
     */
    GetVPDataInfo(pamvpDataInfo) {
        result := ComCall(5, this, "ptr", pamvpDataInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMVPSIZE>} pamvpSize 
     * @param {Pointer<Integer>} pdwMaxPixelsPerSecond 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-getmaxpixelrate
     */
    GetMaxPixelRate(pamvpSize, pdwMaxPixelsPerSecond) {
        result := ComCall(6, this, "ptr", pamvpSize, "uint*", pdwMaxPixelsPerSecond, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} pDDPixelFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-informvpinputformats
     */
    InformVPInputFormats(dwNumFormats, pDDPixelFormats) {
        result := ComCall(7, this, "uint", dwNumFormats, "ptr", pDDPixelFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} pddPixelFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-getvideoformats
     */
    GetVideoFormats(pdwNumFormats, pddPixelFormats) {
        result := ComCall(8, this, "uint*", pdwNumFormats, "ptr", pddPixelFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChosenEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setvideoformat
     */
    SetVideoFormat(dwChosenEntry) {
        result := ComCall(9, this, "uint", dwChosenEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setinvertpolarity
     */
    SetInvertPolarity() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} ppddOverlaySurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-getoverlaysurface
     */
    GetOverlaySurface(ppddOverlaySurface) {
        result := ComCall(11, this, "ptr*", ppddOverlaySurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwDDKernelHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setdirectdrawkernelhandle
     */
    SetDirectDrawKernelHandle(dwDDKernelHandle) {
        result := ComCall(12, this, "ptr", dwDDKernelHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwVideoPortID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setvideoportid
     */
    SetVideoPortID(dwVideoPortID) {
        result := ComCall(13, this, "uint", dwVideoPortID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cHandles 
     * @param {Pointer<Pointer>} rgDDKernelHandles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setddsurfacekernelhandles
     */
    SetDDSurfaceKernelHandles(cHandles, rgDDKernelHandles) {
        result := ComCall(14, this, "uint", cHandles, "ptr*", rgDDKernelHandles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPitch 
     * @param {Integer} dwXOrigin 
     * @param {Integer} dwYOrigin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpconfig/nf-vpconfig-ivpbaseconfig-setsurfaceparameters
     */
    SetSurfaceParameters(dwPitch, dwXOrigin, dwYOrigin) {
        result := ComCall(15, this, "uint", dwPitch, "uint", dwXOrigin, "uint", dwYOrigin, "HRESULT")
        return result
    }
}
