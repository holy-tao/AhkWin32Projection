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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumConnectInfo 
     * @param {Pointer<DDVIDEOPORTCONNECT>} pddVPConnectInfo 
     * @returns {HRESULT} 
     */
    GetConnectInfo(pdwNumConnectInfo, pddVPConnectInfo) {
        result := ComCall(3, this, "uint*", pdwNumConnectInfo, "ptr", pddVPConnectInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChosenEntry 
     * @returns {HRESULT} 
     */
    SetConnectInfo(dwChosenEntry) {
        result := ComCall(4, this, "uint", dwChosenEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMVPDATAINFO>} pamvpDataInfo 
     * @returns {HRESULT} 
     */
    GetVPDataInfo(pamvpDataInfo) {
        result := ComCall(5, this, "ptr", pamvpDataInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMVPSIZE>} pamvpSize 
     * @param {Pointer<UInt32>} pdwMaxPixelsPerSecond 
     * @returns {HRESULT} 
     */
    GetMaxPixelRate(pamvpSize, pdwMaxPixelsPerSecond) {
        result := ComCall(6, this, "ptr", pamvpSize, "uint*", pdwMaxPixelsPerSecond, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} pDDPixelFormats 
     * @returns {HRESULT} 
     */
    InformVPInputFormats(dwNumFormats, pDDPixelFormats) {
        result := ComCall(7, this, "uint", dwNumFormats, "ptr", pDDPixelFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} pddPixelFormats 
     * @returns {HRESULT} 
     */
    GetVideoFormats(pdwNumFormats, pddPixelFormats) {
        result := ComCall(8, this, "uint*", pdwNumFormats, "ptr", pddPixelFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChosenEntry 
     * @returns {HRESULT} 
     */
    SetVideoFormat(dwChosenEntry) {
        result := ComCall(9, this, "uint", dwChosenEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetInvertPolarity() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} ppddOverlaySurface 
     * @returns {HRESULT} 
     */
    GetOverlaySurface(ppddOverlaySurface) {
        result := ComCall(11, this, "ptr", ppddOverlaySurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwDDKernelHandle 
     * @returns {HRESULT} 
     */
    SetDirectDrawKernelHandle(dwDDKernelHandle) {
        result := ComCall(12, this, "ptr", dwDDKernelHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwVideoPortID 
     * @returns {HRESULT} 
     */
    SetVideoPortID(dwVideoPortID) {
        result := ComCall(13, this, "uint", dwVideoPortID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cHandles 
     * @param {Pointer<UIntPtr>} rgDDKernelHandles 
     * @returns {HRESULT} 
     */
    SetDDSurfaceKernelHandles(cHandles, rgDDKernelHandles) {
        result := ComCall(14, this, "uint", cHandles, "ptr*", rgDDKernelHandles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPitch 
     * @param {Integer} dwXOrigin 
     * @param {Integer} dwYOrigin 
     * @returns {HRESULT} 
     */
    SetSurfaceParameters(dwPitch, dwXOrigin, dwYOrigin) {
        result := ComCall(15, this, "uint", dwPitch, "uint", dwXOrigin, "uint", dwYOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
