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
     * Instantiates a HolographicSpace object and binds it to the current application.
     * @param {HWND} window Type: [HWND](/windows/desktop/winprog/windows-data-types)
     * 
     * Handle to the window of the active application.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The RUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example, __uuidof(IRadialController) will get the GUID of the interface to a buffer resource.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * Address of a pointer to a [HolographicSpace](/uwp/api/windows.graphics.holographic.holographicspace) object.
     * @see https://docs.microsoft.com/windows/win32/api//holographicspaceinterop/nf-holographicspaceinterop-iholographicspaceinterop-createforwindow
     */
    CreateForWindow(window, riid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", riid, "ptr*", &holographicSpace := 0, "HRESULT")
        return holographicSpace
    }
}
