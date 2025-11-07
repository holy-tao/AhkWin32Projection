#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Allows an app to get an instance of the ISystemMediaTransportControls interface.
 * @see https://docs.microsoft.com/windows/win32/api//systemmediatransportcontrolsinterop/nn-systemmediatransportcontrolsinterop-isystemmediatransportcontrolsinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ISystemMediaTransportControlsInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMediaTransportControlsInterop
     * @type {Guid}
     */
    static IID => Guid("{ddb0472d-c911-4a1f-86d9-dc3d71a95f5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/systemmediatransportcontrolsinterop/nf-systemmediatransportcontrolsinterop-isystemmediatransportcontrolsinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &mediaTransportControl := 0, "HRESULT")
        return mediaTransportControl
    }
}
