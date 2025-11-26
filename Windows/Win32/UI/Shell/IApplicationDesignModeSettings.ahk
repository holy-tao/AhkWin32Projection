#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
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
     * Sets a spoofed native display size to be used for a Windows Store app running in design mode.
     * @param {SIZE} nativeDisplaySizePixels The native size of the display to spoof, as a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure. The specified size will be normalized to a landscape orientation. To spoof orientation, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setapplicationviewstate">SetApplicationViewState</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize">IInitializeWithWindow::Initialize</a> has not been called to set a proxy core window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_MONITOR_RESOLUTION_TOO_LOW </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot launch or switch to an immersive app when the resolution is this low. This is currently defined as any resolution below 800 horizontal or 600 vertical pixels when in landscape orientation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setnativedisplaysize
     */
    SetNativeDisplaySize(nativeDisplaySizePixels) {
        result := ComCall(3, this, "ptr", nativeDisplaySizePixels, "HRESULT")
        return result
    }

    /**
     * Sets a spoofed device scale factor to be used for a Windows Store app running in design mode.
     * @param {Integer} scaleFactor One of the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ne-shtypes-device_scale_factor">DEVICE_SCALE_FACTOR</a> enumeration values that indicates the device scale factor to spoof.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize">IInitializeWithWindow::Initialize</a> has not been called to set a proxy core window.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setscalefactor
     */
    SetScaleFactor(scaleFactor) {
        result := ComCall(4, this, "int", scaleFactor, "HRESULT")
        return result
    }

    /**
     * Sets a spoofed application view state (full-screen landscape, full-screen portrait, filled, or snapped) to be used for a Windows Store app running in design mode.
     * @param {Integer} viewState One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_state">APPLICATION_VIEW_STATE</a> enumeration values that indicates the application view state to spoof.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize">IInitializeWithWindow::Initialize</a> has not been called to set a proxy core window.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-setapplicationviewstate
     */
    SetApplicationViewState(viewState) {
        result := ComCall(5, this, "int", viewState, "HRESULT")
        return result
    }

    /**
     * Gets the size of the Windows Store app, based on the current set of spoofed settings.
     * @returns {SIZE} When this method returns successfully, receives a pointer to the size that the Windows Store app should occupy, based on the current set of spoofed settings.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-computeapplicationsize
     */
    ComputeApplicationSize() {
        applicationSizePixels := SIZE()
        result := ComCall(6, this, "ptr", applicationSizePixels, "HRESULT")
        return applicationSizePixels
    }

    /**
     * Determines whether a particular application view state is supported for specific spoofed display size and scale factor settings.
     * @param {Integer} viewState One of the enumeration values that indicates the application view state for which support is being determined.
     * @param {SIZE} nativeDisplaySizePixels The native size of the display to spoof.
     * @param {Integer} scaleFactor One of the enumeration values that indicates the device scale factor to spoof.
     * @returns {BOOL} When this method returns successfully, receives a pointer to a Boolean value which is set to <b>TRUE</b> if the application view state is supported for the given display size and scale factor, and <b>FALSE</b> if it is not.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-isapplicationviewstatesupported
     */
    IsApplicationViewStateSupported(viewState, nativeDisplaySizePixels, scaleFactor) {
        result := ComCall(7, this, "int", viewState, "ptr", nativeDisplaySizePixels, "int", scaleFactor, "int*", &supported := 0, "HRESULT")
        return supported
    }

    /**
     * Sends a spoofed edge gesture event to the proxy core window on the caller's thread. This gesture toggles the app's app bar, if the app supports one. The caller can specify the type of input that triggered the edge gesture.
     * @param {Integer} edgeGestureKind 
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize">IInitializeWithWindow::Initialize</a> has not been called to set a proxy core window.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationdesignmodesettings-triggeredgegesture
     */
    TriggerEdgeGesture(edgeGestureKind) {
        result := ComCall(8, this, "int", edgeGestureKind, "HRESULT")
        return result
    }
}
