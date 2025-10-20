#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-isurfaceimagesourcemanagernative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISurfaceImageSourceManagerNative extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FlushAllSurfacesWithDevice"]

    /**
     * 
     * @param {IUnknown} device 
     * @returns {HRESULT} 
     */
    FlushAllSurfacesWithDevice(device) {
        result := ComCall(3, this, "ptr", device, "HRESULT")
        return result
    }
}
