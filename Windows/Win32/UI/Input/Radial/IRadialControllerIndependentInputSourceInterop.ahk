#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Win32.UI.Input.Radial
 * @version v4.0.30319
 */
class IRadialControllerIndependentInputSourceInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerIndependentInputSourceInterop
     * @type {Guid}
     */
    static IID => Guid("{3d577eff-4cee-11e6-b535-001bdc06ab3b}")

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
     */
    CreateForWindow(hwnd, riid) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
