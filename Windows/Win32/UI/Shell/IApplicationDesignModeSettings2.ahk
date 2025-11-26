#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IApplicationDesignModeSettings.ahk

/**
 * Enables development tool applications to dynamically control system and user states, such as native display resolution, device scale factor, and application view layout, reported to Windows Store apps for the purpose of testing Windows Store apps running in design mode for a wide range of form factors without the need for the actual hardware. Also enables testing of changes in normally user-controlled state to test Windows Store apps under a variety of scenarios.
 * @remarks
 * 
 * This interface is acquired by cocreating CLSID_ApplicationDesignModeSettings. It is an extension of the original <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings">IApplicationDesignModeSettings</a> interface.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationDesignModeSettings2 extends IApplicationDesignModeSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDesignModeSettings2
     * @type {Guid}
     */
    static IID => Guid("{490514e1-675a-4d6e-a58d-e54901b4ca2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNativeDisplayOrientation", "SetApplicationViewOrientation", "SetAdjacentDisplayEdges", "SetIsOnLockScreen", "SetApplicationViewMinWidth", "GetApplicationSizeBounds", "GetApplicationViewOrientation"]

    /**
     * Sets the orientation of the emulated display for the design mode window.
     * @param {Integer} nativeDisplayOrientation Type: <b>NATIVE_DISPLAY_ORIENTATION</b>
     * 
     * The native orientation of the display to emulate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setnativedisplayorientation
     */
    SetNativeDisplayOrientation(nativeDisplayOrientation) {
        result := ComCall(9, this, "int", nativeDisplayOrientation, "HRESULT")
        return result
    }

    /**
     * Sets the window orientation used for the design mode window.
     * @param {Integer} viewOrientation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_orientation">APPLICATION_VIEW_ORIENTATION</a></b>
     * 
     * The orientation of the design mode window to use. Either <b>AVO_LANDSCAPE</b> or <b>AVO_PORTRAIT</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setapplicationvieworientation
     */
    SetApplicationViewOrientation(viewOrientation) {
        result := ComCall(10, this, "int", viewOrientation, "HRESULT")
        return result
    }

    /**
     * Sets whether the application window will be adjacent to the edge of the emulated display.
     * @param {Integer} adjacentDisplayEdges Type: <b>ADJACENT_DISPLAY_EDGES</b>
     * 
     * The edge which should be adjacent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setadjacentdisplayedges
     */
    SetAdjacentDisplayEdges(adjacentDisplayEdges) {
        result := ComCall(11, this, "int", adjacentDisplayEdges, "HRESULT")
        return result
    }

    /**
     * This method determines whether or not the application, in design mode, can display information on the Windows 8 lock screen.
     * @param {BOOL} isOnLockScreen Type: <b>BOOL</b>
     * 
     * When set to <b>TRUE</b>, the application will display information on the lock screen. When set to <b>FALSE</b>, information will not be displayed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setisonlockscreen
     */
    SetIsOnLockScreen(isOnLockScreen) {
        result := ComCall(12, this, "int", isOnLockScreen, "HRESULT")
        return result
    }

    /**
     * Sets the desired minimum width of the application design mode window.
     * @param {Integer} viewMinWidth Type: <b>APPLICATION_VIEW_MIN_WIDTH</b>
     * 
     * The minimum width value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-setapplicationviewminwidth
     */
    SetApplicationViewMinWidth(viewMinWidth) {
        result := ComCall(13, this, "int", viewMinWidth, "HRESULT")
        return result
    }

    /**
     * This methods retrieves the size bounds supported by the application.
     * @param {Pointer<SIZE>} minApplicationSizePixels Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * When this method returns successfully, receives a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that defines the minimum possible window size.
     * @param {Pointer<SIZE>} maxApplicationSizePixels Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * When this method returns successfully, receives a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that defines the maximum possible window size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-getapplicationsizebounds
     */
    GetApplicationSizeBounds(minApplicationSizePixels, maxApplicationSizePixels) {
        result := ComCall(14, this, "ptr", minApplicationSizePixels, "ptr", maxApplicationSizePixels, "HRESULT")
        return result
    }

    /**
     * Gets the orientation of the application design mode window.
     * @param {SIZE} applicationSizePixels Type: <b>SIZE</b>
     * 
     * The application window size.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_orientation">APPLICATION_VIEW_ORIENTATION</a>*</b>
     * 
     * When this method returns successfully, receives a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_orientation">APPLICATION_VIEW_ORIENTATION</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings2-getapplicationvieworientation
     */
    GetApplicationViewOrientation(applicationSizePixels) {
        result := ComCall(15, this, "ptr", applicationSizePixels, "int*", &viewOrientation := 0, "HRESULT")
        return viewOrientation
    }
}
