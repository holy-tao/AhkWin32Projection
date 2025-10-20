#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a region within a window (referred to as a viewport) that is able to receive and process input from user interactions.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationviewport
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationViewport extends IUnknown{
    /**
     * The interface identifier for IDirectManipulationViewport
     * @type {Guid}
     */
    static IID => Guid("{28b85a3d-60a0-48bd-9ba1-5ce8d9ea3a6d}")

    /**
     * The class identifier for DirectManipulationViewport
     * @type {Guid}
     */
    static CLSID => Guid("{34e211b6-3650-4f75-8334-fa359598e1c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Enable() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disable() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    SetContact(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    ReleaseContact(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseAllContacts() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} status 
     * @returns {HRESULT} 
     */
    GetStatus(status) {
        result := ComCall(8, this, "int*", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} object 
     * @param {Pointer<UInt32>} id 
     * @returns {HRESULT} 
     */
    GetTag(riid, object, id) {
        result := ComCall(9, this, "ptr", riid, "ptr", object, "uint*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    SetTag(object, id) {
        result := ComCall(10, this, "ptr", object, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} viewport 
     * @returns {HRESULT} 
     */
    GetViewportRect(viewport) {
        result := ComCall(11, this, "ptr", viewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} viewport 
     * @returns {HRESULT} 
     */
    SetViewportRect(viewport) {
        result := ComCall(12, this, "ptr", viewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @param {BOOL} animate 
     * @returns {HRESULT} 
     */
    ZoomToRect(left, top, right, bottom, animate) {
        result := ComCall(13, this, "float", left, "float", top, "float", right, "float", bottom, "int", animate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    SetViewportTransform(matrix, pointCount) {
        result := ComCall(14, this, "float*", matrix, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     */
    SyncDisplayTransform(matrix, pointCount) {
        result := ComCall(15, this, "float*", matrix, "uint", pointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} object 
     * @returns {HRESULT} 
     */
    GetPrimaryContent(riid, object) {
        result := ComCall(16, this, "ptr", riid, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectManipulationContent>} content 
     * @returns {HRESULT} 
     */
    AddContent(content) {
        result := ComCall(17, this, "ptr", content, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectManipulationContent>} content 
     * @returns {HRESULT} 
     */
    RemoveContent(content) {
        result := ComCall(18, this, "ptr", content, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetViewportOptions(options) {
        result := ComCall(19, this, "int", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     */
    AddConfiguration(configuration) {
        result := ComCall(20, this, "int", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     */
    RemoveConfiguration(configuration) {
        result := ComCall(21, this, "int", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     */
    ActivateConfiguration(configuration) {
        result := ComCall(22, this, "int", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     */
    SetManualGesture(configuration) {
        result := ComCall(23, this, "int", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enabledTypes 
     * @returns {HRESULT} 
     */
    SetChaining(enabledTypes) {
        result := ComCall(24, this, "int", enabledTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} window 
     * @param {Pointer<IDirectManipulationViewportEventHandler>} eventHandler 
     * @param {Pointer<UInt32>} cookie 
     * @returns {HRESULT} 
     */
    AddEventHandler(window, eventHandler, cookie) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(25, this, "ptr", window, "ptr", eventHandler, "uint*", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     */
    RemoveEventHandler(cookie) {
        result := ComCall(26, this, "uint", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetInputMode(mode) {
        result := ComCall(27, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetUpdateMode(mode) {
        result := ComCall(28, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(29, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abandon() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
