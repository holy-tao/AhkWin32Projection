#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\SpatialLocation.ahk
#Include .\SpatialLocatorAttachedFrameOfReference.ahk
#Include .\SpatialStationaryFrameOfReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialLocator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialLocator
     * @type {Guid}
     */
    static IID => Guid("{f6478925-9e0c-3bb6-997e-b64ecca24cf4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Locatability", "add_LocatabilityChanged", "remove_LocatabilityChanged", "add_PositionalTrackingDeactivating", "remove_PositionalTrackingDeactivating", "TryLocateAtTimestamp", "CreateAttachedFrameOfReferenceAtCurrentHeading", "CreateAttachedFrameOfReferenceAtCurrentHeadingWithPosition", "CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientation", "CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientationAndRelativeHeading", "CreateStationaryFrameOfReferenceAtCurrentLocation", "CreateStationaryFrameOfReferenceAtCurrentLocationWithPosition", "CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientation", "CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientationAndRelativeHeading"]

    /**
     * @type {Integer} 
     */
    Locatability {
        get => this.get_Locatability()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Locatability() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialLocator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LocatabilityChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_LocatabilityChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialLocator, SpatialLocatorPositionalTrackingDeactivatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionalTrackingDeactivating(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PositionalTrackingDeactivating(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(10, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PerceptionTimestamp} timestamp_ 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialLocation} 
     */
    TryLocateAtTimestamp(timestamp_, coordinateSystem) {
        result := ComCall(11, this, "ptr", timestamp_, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocation(value)
    }

    /**
     * 
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     */
    CreateAttachedFrameOfReferenceAtCurrentHeading() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocatorAttachedFrameOfReference(value)
    }

    /**
     * 
     * @param {Vector3} relativePosition 
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     */
    CreateAttachedFrameOfReferenceAtCurrentHeadingWithPosition(relativePosition) {
        result := ComCall(13, this, "ptr", relativePosition, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocatorAttachedFrameOfReference(value)
    }

    /**
     * 
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     */
    CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientation(relativePosition, relativeOrientation) {
        result := ComCall(14, this, "ptr", relativePosition, "ptr", relativeOrientation, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocatorAttachedFrameOfReference(value)
    }

    /**
     * 
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @param {Float} relativeHeadingInRadians 
     * @returns {SpatialLocatorAttachedFrameOfReference} 
     */
    CreateAttachedFrameOfReferenceAtCurrentHeadingWithPositionAndOrientationAndRelativeHeading(relativePosition, relativeOrientation, relativeHeadingInRadians) {
        result := ComCall(15, this, "ptr", relativePosition, "ptr", relativeOrientation, "double", relativeHeadingInRadians, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocatorAttachedFrameOfReference(value)
    }

    /**
     * 
     * @returns {SpatialStationaryFrameOfReference} 
     */
    CreateStationaryFrameOfReferenceAtCurrentLocation() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialStationaryFrameOfReference(value)
    }

    /**
     * 
     * @param {Vector3} relativePosition 
     * @returns {SpatialStationaryFrameOfReference} 
     */
    CreateStationaryFrameOfReferenceAtCurrentLocationWithPosition(relativePosition) {
        result := ComCall(17, this, "ptr", relativePosition, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialStationaryFrameOfReference(value)
    }

    /**
     * 
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @returns {SpatialStationaryFrameOfReference} 
     */
    CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientation(relativePosition, relativeOrientation) {
        result := ComCall(18, this, "ptr", relativePosition, "ptr", relativeOrientation, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialStationaryFrameOfReference(value)
    }

    /**
     * 
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @param {Float} relativeHeadingInRadians 
     * @returns {SpatialStationaryFrameOfReference} 
     */
    CreateStationaryFrameOfReferenceAtCurrentLocationWithPositionAndOrientationAndRelativeHeading(relativePosition, relativeOrientation, relativeHeadingInRadians) {
        result := ComCall(19, this, "ptr", relativePosition, "ptr", relativeOrientation, "double", relativeHeadingInRadians, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialStationaryFrameOfReference(value)
    }
}
