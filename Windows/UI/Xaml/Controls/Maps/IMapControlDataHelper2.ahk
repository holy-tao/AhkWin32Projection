#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlDataHelper2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlDataHelper2
     * @type {Guid}
     */
    static IID => Guid("{59ce429e-562f-4c21-a674-0f11decf0fb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_BusinessLandmarkPointerEntered", "remove_BusinessLandmarkPointerEntered", "add_TransitFeaturePointerEntered", "remove_TransitFeaturePointerEntered", "add_BusinessLandmarkPointerExited", "remove_BusinessLandmarkPointerExited", "add_TransitFeaturePointerExited", "remove_TransitFeaturePointerExited"]

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlBusinessLandmarkPointerEnteredEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BusinessLandmarkPointerEntered(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_BusinessLandmarkPointerEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlTransitFeaturePointerEnteredEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TransitFeaturePointerEntered(value) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", value, "ptr", token, "int")
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
    remove_TransitFeaturePointerEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlBusinessLandmarkPointerExitedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BusinessLandmarkPointerExited(value) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", value, "ptr", token, "int")
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
    remove_BusinessLandmarkPointerExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlTransitFeaturePointerExitedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TransitFeaturePointerExited(value) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", value, "ptr", token, "int")
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
    remove_TransitFeaturePointerExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
