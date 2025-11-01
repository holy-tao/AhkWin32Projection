#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT�RadialControllerConfiguration object and provides access to RadialControllerConfiguration members for customizing a RadialController menu.
 * @see https://docs.microsoft.com/windows/win32/api//radialcontrollerinterop/nn-radialcontrollerinterop-iradialcontrollerconfigurationinterop
 * @namespace Windows.Win32.UI.Input.Radial
 * @version v4.0.30319
 */
class IRadialControllerConfigurationInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerConfigurationInterop
     * @type {Guid}
     */
    static IID => Guid("{787cdaac-3186-476d-87e4-b9374a7b9970}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/radialcontrollerinterop/nf-radialcontrollerinterop-iradialcontrollerconfigurationinterop-getforwindow
     */
    GetForWindow(hwnd, riid, ppv) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
