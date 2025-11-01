#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT HolographicSpace object and provides access to HolographicSpace members for representing a holographic scene.
 * @see https://docs.microsoft.com/windows/win32/api//holographicspaceinterop/nn-holographicspaceinterop-iholographicspaceinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IHolographicSpaceInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpaceInterop
     * @type {Guid}
     */
    static IID => Guid("{5c4ee536-6a98-4b86-a170-587013d6fd4b}")

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
     * @param {HWND} window 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} holographicSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/holographicspaceinterop/nf-holographicspaceinterop-iholographicspaceinterop-createforwindow
     */
    CreateForWindow(window, riid, holographicSpace) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", riid, "ptr*", holographicSpace, "HRESULT")
        return result
    }
}
