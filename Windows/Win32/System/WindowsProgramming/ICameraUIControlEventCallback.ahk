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
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnStartupComplete() {
        ComCall(3, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnSuspendComplete() {
        ComCall(4, this)
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {String} Nothing - always returns an empty string
     */
    OnItemCaptured(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ComCall(5, this, "ptr", pszPath)
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {String} Nothing - always returns an empty string
     */
    OnItemDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        ComCall(6, this, "ptr", pszPath)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnClosed() {
        ComCall(7, this)
        return result
    }
}
