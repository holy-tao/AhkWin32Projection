#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationmanager
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationManager
     * @type {Guid}
     */
    static IID => Guid("{fbf5d3b4-70c7-4163-9322-5a6f660d6fbc}")

    /**
     * The class identifier for DirectManipulationManager
     * @type {Guid}
     */
    static CLSID => Guid("{54e211b6-3650-4f75-8334-fa359598e1c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "RegisterHitTestTarget", "ProcessInput", "GetUpdateManager", "CreateViewport", "CreateContent"]

    /**
     * 
     * @param {HWND} window 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-activate
     */
    Activate(window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(3, this, "ptr", window, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} window 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-deactivate
     */
    Deactivate(window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(4, this, "ptr", window, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} window 
     * @param {HWND} hitTestWindow 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-registerhittesttarget
     */
    RegisterHitTestTarget(window, hitTestWindow, type) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window
        hitTestWindow := hitTestWindow is Win32Handle ? NumGet(hitTestWindow, "ptr") : hitTestWindow

        result := ComCall(5, this, "ptr", window, "ptr", hitTestWindow, "int", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} message 
     * @param {Pointer<BOOL>} handled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-processinput
     */
    ProcessInput(message, handled) {
        result := ComCall(6, this, "ptr", message, "ptr", handled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-getupdatemanager
     */
    GetUpdateManager(riid, object) {
        result := ComCall(7, this, "ptr", riid, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectManipulationFrameInfoProvider} frameInfo 
     * @param {HWND} window 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createviewport
     */
    CreateViewport(frameInfo, window, riid, object) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(8, this, "ptr", frameInfo, "ptr", window, "ptr", riid, "ptr*", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectManipulationFrameInfoProvider} frameInfo 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createcontent
     */
    CreateContent(frameInfo, clsid, riid, object) {
        result := ComCall(9, this, "ptr", frameInfo, "ptr", clsid, "ptr", riid, "ptr*", object, "HRESULT")
        return result
    }
}
