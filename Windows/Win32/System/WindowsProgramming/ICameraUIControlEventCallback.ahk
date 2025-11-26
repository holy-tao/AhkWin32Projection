#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Callback interface for receiving events from the camera user interface control.
 * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nn-camerauicontrol-icamerauicontroleventcallback
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class ICameraUIControlEventCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraUIControlEventCallback
     * @type {Guid}
     */
    static IID => Guid("{1bfa0c2c-fbcd-4776-bda4-88bf974e74f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartupComplete", "OnSuspendComplete", "OnItemCaptured", "OnItemDeleted", "OnClosed"]

    /**
     * Occurs when startup for the camera UI control has completed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onstartupcomplete
     */
    OnStartupComplete() {
        ComCall(3, this)
    }

    /**
     * Occurs when the camera UI control has completed being suspended.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onsuspendcomplete
     */
    OnSuspendComplete() {
        ComCall(4, this)
    }

    /**
     * Occurs when an item is captured.
     * @param {PWSTR} pszPath The path to the captured item.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onitemcaptured
     */
    OnItemCaptured(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ComCall(5, this, "ptr", pszPath)
    }

    /**
     * Occurs when an item is deleted.
     * @param {PWSTR} pszPath The path to the deleted item.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onitemdeleted
     */
    OnItemDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ComCall(6, this, "ptr", pszPath)
    }

    /**
     * Occurs when the camera UI control is closed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontroleventcallback-onclosed
     */
    OnClosed() {
        ComCall(7, this)
    }
}
