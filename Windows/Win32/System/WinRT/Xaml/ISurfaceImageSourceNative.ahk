#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISurfaceImageSourceNative extends IUnknown{
    /**
     * The interface identifier for ISurfaceImageSourceNative
     * @type {Guid}
     */
    static IID => Guid("{f2e9edc1-d307-4525-9886-0fafaa44163c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDXGIDevice>} device 
     * @returns {HRESULT} 
     */
    SetDevice(device) {
        result := ComCall(3, this, "ptr", device, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} updateRect 
     * @param {Pointer<IDXGISurface>} surface 
     * @param {Pointer<POINT>} offset 
     * @returns {HRESULT} 
     */
    BeginDraw(updateRect, surface, offset) {
        result := ComCall(4, this, "ptr", updateRect, "ptr", surface, "ptr", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDraw() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
