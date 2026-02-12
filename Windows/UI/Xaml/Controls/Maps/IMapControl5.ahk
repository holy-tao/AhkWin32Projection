#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapStyleSheet.ahk
#Include ..\..\Thickness.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\MapElement.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControl5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControl5
     * @type {Guid}
     */
    static IID => Guid("{dd9b0ffd-7823-46a2-82c9-65ddac4f365f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MapProjection", "put_MapProjection", "get_StyleSheet", "put_StyleSheet", "get_ViewPadding", "put_ViewPadding", "add_MapContextRequested", "remove_MapContextRequested", "FindMapElementsAtOffsetWithRadius", "GetLocationFromOffsetWithReferenceSystem", "StartContinuousPan", "StopContinuousPan", "TryPanAsync", "TryPanToAsync"]

    /**
     * @type {Integer} 
     */
    MapProjection {
        get => this.get_MapProjection()
        set => this.put_MapProjection(value)
    }

    /**
     * @type {MapStyleSheet} 
     */
    StyleSheet {
        get => this.get_StyleSheet()
        set => this.put_StyleSheet(value)
    }

    /**
     * @type {Thickness} 
     */
    ViewPadding {
        get => this.get_ViewPadding()
        set => this.put_ViewPadding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapProjection() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MapProjection(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    get_StyleSheet() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(value)
    }

    /**
     * 
     * @param {MapStyleSheet} value 
     * @returns {HRESULT} 
     */
    put_StyleSheet(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_ViewPadding() {
        value := Thickness()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_ViewPadding(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapContextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapContextRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_MapContextRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} offset 
     * @param {Float} radius 
     * @returns {IVectorView<MapElement>} 
     */
    FindMapElementsAtOffsetWithRadius(offset, radius) {
        result := ComCall(14, this, "ptr", offset, "double", radius, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MapElement, result_)
    }

    /**
     * 
     * @param {POINT} offset 
     * @param {Integer} desiredReferenceSystem 
     * @param {Pointer<Geopoint>} location_ 
     * @returns {HRESULT} 
     */
    GetLocationFromOffsetWithReferenceSystem(offset, desiredReferenceSystem, location_) {
        result := ComCall(15, this, "ptr", offset, "int", desiredReferenceSystem, "ptr", location_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} horizontalPixelsPerSecond 
     * @param {Float} verticalPixelsPerSecond 
     * @returns {HRESULT} 
     */
    StartContinuousPan(horizontalPixelsPerSecond, verticalPixelsPerSecond) {
        result := ComCall(16, this, "double", horizontalPixelsPerSecond, "double", verticalPixelsPerSecond, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopContinuousPan() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} horizontalPixels 
     * @param {Float} verticalPixels 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryPanAsync(horizontalPixels, verticalPixels) {
        result := ComCall(18, this, "double", horizontalPixels, "double", verticalPixels, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryPanToAsync(location_) {
        result := ComCall(19, this, "ptr", location_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
