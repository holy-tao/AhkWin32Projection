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
     * 
     * @param {Integer} nativeDisplayOrientation 
     * @returns {HRESULT} 
     */
    SetNativeDisplayOrientation(nativeDisplayOrientation) {
        result := ComCall(9, this, "int", nativeDisplayOrientation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} viewOrientation 
     * @returns {HRESULT} 
     */
    SetApplicationViewOrientation(viewOrientation) {
        result := ComCall(10, this, "int", viewOrientation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} adjacentDisplayEdges 
     * @returns {HRESULT} 
     */
    SetAdjacentDisplayEdges(adjacentDisplayEdges) {
        result := ComCall(11, this, "int", adjacentDisplayEdges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isOnLockScreen 
     * @returns {HRESULT} 
     */
    SetIsOnLockScreen(isOnLockScreen) {
        result := ComCall(12, this, "int", isOnLockScreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} viewMinWidth 
     * @returns {HRESULT} 
     */
    SetApplicationViewMinWidth(viewMinWidth) {
        result := ComCall(13, this, "int", viewMinWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} minApplicationSizePixels 
     * @param {Pointer<SIZE>} maxApplicationSizePixels 
     * @returns {HRESULT} 
     */
    GetApplicationSizeBounds(minApplicationSizePixels, maxApplicationSizePixels) {
        result := ComCall(14, this, "ptr", minApplicationSizePixels, "ptr", maxApplicationSizePixels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SIZE} applicationSizePixels 
     * @param {Pointer<Int32>} viewOrientation 
     * @returns {HRESULT} 
     */
    GetApplicationViewOrientation(applicationSizePixels, viewOrientation) {
        result := ComCall(15, this, "ptr", applicationSizePixels, "int*", viewOrientation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
