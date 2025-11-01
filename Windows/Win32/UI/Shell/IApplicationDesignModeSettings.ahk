#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables development tool applications to dynamically spoof system and user states, such as native display resolution, device scale factor, and application view state, for the purpose of testing Windows Store apps running in design mode for a wide range of form factors without the need for the actual hardware. Also enables testing of changes in normally user-controlled state to test Windows Store apps under a variety of scenarios.
 * @remarks
 * 
  * This interface is acquired by cocreating CLSID_ApplicationDesignModeSettings.
  * 
  * Users will normally follow a usage pattern similar to the following:
  *             
  *                 
  * 
  * <ol>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with CLSID_ApplicationDesignModeSettings to create the application design mode settings object on a thread in the Windows Store app process.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the application design mode settings object to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iinitializewithwindow">IInitializeWithWindow</a> object.</li>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize">Initialize</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iinitializewithwindow">IInitializeWithWindow</a> object, passing in the HWND for the proxy core window. This must be done before any "set" methods are called and will only succeed once per process.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for <b>IApplicationDesignModeSettings</b> and spoof the necessary test state by calling its appropriate methods (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setnativedisplaysize">SetNativeDisplaySize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setscalefactor">SetScaleFactor</a>, etc.). These methods will trigger the appropriate Windows Runtime events to fire for the Windows Store app.</li>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-computeapplicationsize">ComputeApplicationSize</a> method to determine the proper size for the app, based on the currently spoofed state. All layout "set" methods must have already been called or this call will fail. The developer tool application is responsible for positioning and sizing the app windows, when appropriate.</li>
  * </ol>
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * Do not implement this interface; the implementation is supplied with Windows.
  * 
  * <h3><a id="When_to_use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to use</h3>
  * Use the methods of this interface to test your Windows Store app under various spoofed configurations and scenarios.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationDesignModeSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDesignModeSettings
     * @type {Guid}
     */
    static IID => Guid("{2a3dee9a-e31d-46d6-8508-bcc597db3557}")

    /**
     * The class identifier for ApplicationDesignModeSettings
     * @type {Guid}
     */
    static CLSID => Guid("{958a6fb5-dcb2-4faf-aafd-7fb054ad1a3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNativeDisplaySize", "SetScaleFactor", "SetApplicationViewState", "ComputeApplicationSize", "IsApplicationViewStateSupported", "TriggerEdgeGesture"]

    /**
     * 
     * @param {SIZE} nativeDisplaySizePixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setnativedisplaysize
     */
    SetNativeDisplaySize(nativeDisplaySizePixels) {
        result := ComCall(3, this, "ptr", nativeDisplaySizePixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scaleFactor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setscalefactor
     */
    SetScaleFactor(scaleFactor) {
        result := ComCall(4, this, "int", scaleFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} viewState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setapplicationviewstate
     */
    SetApplicationViewState(viewState) {
        result := ComCall(5, this, "int", viewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} applicationSizePixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-computeapplicationsize
     */
    ComputeApplicationSize(applicationSizePixels) {
        result := ComCall(6, this, "ptr", applicationSizePixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} viewState 
     * @param {SIZE} nativeDisplaySizePixels 
     * @param {Integer} scaleFactor 
     * @param {Pointer<BOOL>} supported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-isapplicationviewstatesupported
     */
    IsApplicationViewStateSupported(viewState, nativeDisplaySizePixels, scaleFactor, supported) {
        result := ComCall(7, this, "int", viewState, "ptr", nativeDisplaySizePixels, "int", scaleFactor, "ptr", supported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} edgeGestureKind 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-triggeredgegesture
     */
    TriggerEdgeGesture(edgeGestureKind) {
        result := ComCall(8, this, "int", edgeGestureKind, "HRESULT")
        return result
    }
}
