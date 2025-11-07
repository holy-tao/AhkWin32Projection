#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT�RadialController object and provides access to RadialController members for customizing the interaction experience.
 * @see https://docs.microsoft.com/windows/win32/api//radialcontrollerinterop/nn-radialcontrollerinterop-iradialcontrollerinterop
 * @namespace Windows.Win32.UI.Input.Radial
 * @version v4.0.30319
 */
class IRadialControllerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerInterop
     * @type {Guid}
     */
    static IID => Guid("{1b0535c9-57ad-45c1-9d79-ad5c34360513}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForWindow"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/radialcontrollerinterop/nf-radialcontrollerinterop-iradialcontrollerinterop-createforwindow
     */
    CreateForWindow(hwnd, riid) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
