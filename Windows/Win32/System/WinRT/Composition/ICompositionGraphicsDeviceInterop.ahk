#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiongraphicsdeviceinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionGraphicsDeviceInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGraphicsDeviceInterop
     * @type {Guid}
     */
    static IID => Guid("{a116ff71-f8bf-4c8a-9c98-70779a32a9c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRenderingDevice", "SetRenderingDevice"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiongraphicsdeviceinterop-getrenderingdevice
     */
    GetRenderingDevice() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IUnknown(value)
    }

    /**
     * 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiongraphicsdeviceinterop-setrenderingdevice
     */
    SetRenderingDevice(value) {
        result := ComCall(4, this, "ptr", value, "HRESULT")
        return result
    }
}
