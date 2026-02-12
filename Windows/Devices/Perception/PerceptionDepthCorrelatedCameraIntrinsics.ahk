#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionDepthCorrelatedCameraIntrinsics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides convenience methods to facilitate geometric math for a camera device, combining the intrinsic properties of that camera with correlated depth frames to provide screen-space pixel to camera-space coordinate projections.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcameraintrinsics
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionDepthCorrelatedCameraIntrinsics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionDepthCorrelatedCameraIntrinsics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionDepthCorrelatedCameraIntrinsics.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Unprojects a point in camera image space out into the coordinate frame of the camera device, using the corresponding depth from a correlated depth camera.
     * @param {POINT} pixelCoordinate A point, relative to the camera frame.
     * @param {PerceptionDepthFrame} depthFrame The depth frame containing the depth value to use when projecting the point into camera space. The pixelCoordinate will be mapped from camera image space to depth image space, and then used to look up the depth in depthFrame.
     * @returns {Vector3} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcameraintrinsics.unprojectpixelatcorrelateddepth
     */
    UnprojectPixelAtCorrelatedDepth(pixelCoordinate, depthFrame) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCameraIntrinsics := IPerceptionDepthCorrelatedCameraIntrinsics(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCameraIntrinsics.UnprojectPixelAtCorrelatedDepth(pixelCoordinate, depthFrame)
    }

    /**
     * Unprojects a set of points in camera image space out into the coordinate frame of the camera device, using the corresponding depth values from a correlated depth camera.
     * @param {Integer} sourceCoordinates_length 
     * @param {Pointer<POINT>} sourceCoordinates A set of points, relative to the camera frame.
     * @param {PerceptionDepthFrame} depthFrame The depth frame containing the depth value to use when projecting the points into camera space. The pixelCoordinate will be mapped from camera image space to depth image space, and then used to look up the depth in depthFrame.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results A set of coordinates, relative to the coordinate system of the camera device and with correlated depth values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcameraintrinsics.unprojectpixelsatcorrelateddepth
     */
    UnprojectPixelsAtCorrelatedDepth(sourceCoordinates_length, sourceCoordinates, depthFrame, results_length, results) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCameraIntrinsics := IPerceptionDepthCorrelatedCameraIntrinsics(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCameraIntrinsics.UnprojectPixelsAtCorrelatedDepth(sourceCoordinates_length, sourceCoordinates, depthFrame, results_length, results)
    }

    /**
     * Unprojects a region of pixels in an image from camera image space out into the coordinate frame of the camera device, using the corresponding depth values from a correlated depth camera.
     * @param {RECT} region_ The region of pixels to project from camera image space out into the coordinate frame of the camera device.
     * @param {PerceptionDepthFrame} depthFrame The depth frame containing the depth value to use when projecting the points into camera space. The pixelCoordinates will be mapped from camera image space to depth image space, and then used to look up the depth in depthFrame.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results A set of coordinates, relative to the coordinate system of the camera device and with correlated depth values.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcameraintrinsics.unprojectregionpixelsatcorrelateddepthasync
     */
    UnprojectRegionPixelsAtCorrelatedDepthAsync(region_, depthFrame, results_length, results) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCameraIntrinsics := IPerceptionDepthCorrelatedCameraIntrinsics(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCameraIntrinsics.UnprojectRegionPixelsAtCorrelatedDepthAsync(region_, depthFrame, results_length, results)
    }

    /**
     * Unprojects all pixels in an image from camera image space out into the coordinate frame of the camera device, using the corresponding depth values from a correlated depth camera.
     * @param {PerceptionDepthFrame} depthFrame The depth frame containing the depth value to use when projecting the points into camera space. The coordinates of each pixel in the image will be mapped from camera image space to depth image space, and then used to look up the depth in this depth frame.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results Returns a set of coordinates, relative to the coordinate system of the camera device and with correlated depth values.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcameraintrinsics.unprojectallpixelsatcorrelateddepthasync
     */
    UnprojectAllPixelsAtCorrelatedDepthAsync(depthFrame, results_length, results) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCameraIntrinsics := IPerceptionDepthCorrelatedCameraIntrinsics(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCameraIntrinsics.UnprojectAllPixelsAtCorrelatedDepthAsync(depthFrame, results_length, results)
    }

;@endregion Instance Methods
}
