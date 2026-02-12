#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include .\MapCamera.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapBillboard extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapBillboard
     * @type {Guid}
     */
    static IID => Guid("{1694259d-0ae2-4f42-a02e-292ca835d39d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Location", "put_Location", "get_NormalizedAnchorPoint", "put_NormalizedAnchorPoint", "get_Image", "put_Image", "get_CollisionBehaviorDesired", "put_CollisionBehaviorDesired", "get_ReferenceCamera"]

    /**
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * @type {POINT} 
     */
    NormalizedAnchorPoint {
        get => this.get_NormalizedAnchorPoint()
        set => this.put_NormalizedAnchorPoint(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * @type {Integer} 
     */
    CollisionBehaviorDesired {
        get => this.get_CollisionBehaviorDesired()
        set => this.put_CollisionBehaviorDesired(value)
    }

    /**
     * @type {MapCamera} 
     */
    ReferenceCamera {
        get => this.get_ReferenceCamera()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_NormalizedAnchorPoint() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_NormalizedAnchorPoint(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollisionBehaviorDesired() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_CollisionBehaviorDesired(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_ReferenceCamera() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }
}
