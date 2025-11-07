#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositorDesktopInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositorDesktopInterop
     * @type {Guid}
     */
    static IID => Guid("{29e691fa-4567-4dca-b319-d0f207eb6807}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDesktopWindowTarget", "EnsureOnThread"]

    /**
     * 
     * @param {HWND} hwndTarget 
     * @param {BOOL} isTopmost 
     * @returns {Pointer<DesktopWindowTarget>} 
     */
    CreateDesktopWindowTarget(hwndTarget, isTopmost) {
        hwndTarget := hwndTarget is Win32Handle ? NumGet(hwndTarget, "ptr") : hwndTarget

        result := ComCall(3, this, "ptr", hwndTarget, "int", isTopmost, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    EnsureOnThread(threadId) {
        result := ComCall(4, this, "uint", threadId, "HRESULT")
        return result
    }
}
