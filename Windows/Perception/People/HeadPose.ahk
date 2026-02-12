#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHeadPose.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the user's head gaze in relation to their surroundings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.headpose
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class HeadPose extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHeadPose

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHeadPose.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the position of the user's head in the specified coordinate system.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.headpose.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the forward direction of the user's head gaze in the specified coordinate system, as a unit vector.
     * @remarks
     * >[!NOTE] On most Windows Mixed Reality devices, the forward direction vector is parallel to the ground when the user's head is in a neutral position looking forward. However, earlier versions of HoloLens 2 aligned the vector to be perpendicular to the display panels instead, which is tilted downward a few degrees relative to the ideal orientation. Newer versions of HoloLens 2 have corrected this to ensure semantic consistency across form factors.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.headpose.forwarddirection
     * @type {Vector3} 
     */
    ForwardDirection {
        get => this.get_ForwardDirection()
    }

    /**
     * Gets the up direction that orients the user's head gaze in the specified coordinate system, as a unit vector.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.headpose.updirection
     * @type {Vector3} 
     */
    UpDirection {
        get => this.get_UpDirection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IHeadPose")) {
            if ((queryResult := this.QueryInterface(IHeadPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadPose := IHeadPose(outPtr)
        }

        return this.__IHeadPose.get_Position()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_ForwardDirection() {
        if (!this.HasProp("__IHeadPose")) {
            if ((queryResult := this.QueryInterface(IHeadPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadPose := IHeadPose(outPtr)
        }

        return this.__IHeadPose.get_ForwardDirection()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_UpDirection() {
        if (!this.HasProp("__IHeadPose")) {
            if ((queryResult := this.QueryInterface(IHeadPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadPose := IHeadPose(outPtr)
        }

        return this.__IHeadPose.get_UpDirection()
    }

;@endregion Instance Methods
}
