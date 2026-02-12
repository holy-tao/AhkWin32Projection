#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapCamera.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapScene extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapScene
     * @type {Guid}
     */
    static IID => Guid("{8bba10a9-50e7-482c-9789-c688b178ac24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetCamera", "add_TargetCameraChanged", "remove_TargetCameraChanged"]

    /**
     * @type {MapCamera} 
     */
    TargetCamera {
        get => this.get_TargetCamera()
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_TargetCamera() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MapScene, MapTargetCameraChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TargetCameraChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TargetCameraChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
