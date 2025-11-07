#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a region within a window (referred to as a viewport) that is able to receive and process input from user interactions.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationviewport
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationViewport extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enable", "Disable", "SetContact", "ReleaseContact", "ReleaseAllContacts", "GetStatus", "GetTag", "SetTag", "GetViewportRect", "SetViewportRect", "ZoomToRect", "SetViewportTransform", "SyncDisplayTransform", "GetPrimaryContent", "AddContent", "RemoveContent", "SetViewportOptions", "AddConfiguration", "RemoveConfiguration", "ActivateConfiguration", "SetManualGesture", "SetChaining", "AddEventHandler", "RemoveEventHandler", "SetInputMode", "SetUpdateMode", "Stop", "Abandon"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-disable
     */
    Disable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact
     */
    SetContact(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releasecontact
     */
    ReleaseContact(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releaseallcontacts
     */
    ReleaseAllContacts() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} object 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-gettag
     */
    GetTag(riid, object, id) {
        objectMarshal := object is VarRef ? "ptr*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", riid, objectMarshal, object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-settag
     */
    SetTag(object, id) {
        result := ComCall(10, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getviewportrect
     */
    GetViewportRect() {
        viewport := RECT()
        result := ComCall(11, this, "ptr", viewport, "HRESULT")
        return viewport
    }

    /**
     * 
     * @param {Pointer<RECT>} viewport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportrect
     */
    SetViewportRect(viewport) {
        result := ComCall(12, this, "ptr", viewport, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-zoomtorect
     */
    ZoomToRect(left, top, right, bottom, animate) {
        result := ComCall(13, this, "float", left, "float", top, "float", right, "float", bottom, "int", animate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewporttransform
     */
    SetViewportTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} matrix 
     * @param {Integer} pointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-syncdisplaytransform
     */
    SyncDisplayTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(15, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getprimarycontent
     */
    GetPrimaryContent(riid) {
        result := ComCall(16, this, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }

    /**
     * 
     * @param {IDirectManipulationContent} content 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addcontent
     */
    AddContent(content) {
        result := ComCall(17, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectManipulationContent} content 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removecontent
     */
    RemoveContent(content) {
        result := ComCall(18, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions
     */
    SetViewportOptions(options) {
        result := ComCall(19, this, "int", options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration
     */
    AddConfiguration(configuration) {
        result := ComCall(20, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration
     */
    RemoveConfiguration(configuration) {
        result := ComCall(21, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration
     */
    ActivateConfiguration(configuration) {
        result := ComCall(22, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture
     */
    SetManualGesture(configuration) {
        result := ComCall(23, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enabledTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setchaining
     */
    SetChaining(enabledTypes) {
        result := ComCall(24, this, "int", enabledTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} window 
     * @param {IDirectManipulationViewportEventHandler} eventHandler 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler
     */
    AddEventHandler(window, eventHandler) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(25, this, "ptr", window, "ptr", eventHandler, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeeventhandler
     */
    RemoveEventHandler(cookie) {
        result := ComCall(26, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setinputmode
     */
    SetInputMode(mode) {
        result := ComCall(27, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setupdatemode
     */
    SetUpdateMode(mode) {
        result := ComCall(28, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-stop
     */
    Stop() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-abandon
     */
    Abandon() {
        result := ComCall(30, this, "HRESULT")
        return result
    }
}
