#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISurfaceImageSourceManagerNative extends IUnknown{
    /**
     * The interface identifier for ISurfaceImageSourceManagerNative
     * @type {Guid}
     */
    static IID => Guid("{4c8798b7-1d88-4a0f-b59b-b93f600de8c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} device 
     * @returns {HRESULT} 
     */
    FlushAllSurfacesWithDevice(device) {
        result := ComCall(3, this, "ptr", device, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
