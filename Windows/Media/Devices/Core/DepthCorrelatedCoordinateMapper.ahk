#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDepthCorrelatedCoordinateMapper.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Maps 2D points in a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to 3D space or to a frame from a different **MediaFrameSource** using data from a [DepthMediaFrame](../windows.media.capture.frames/depthmediaframe.md).
 * @remarks
 * Get an instance of this class by calling the [TryCreateCoordinateMapper](../windows.media.capture.frames/depthmediaframe_trycreatecoordinatemapper_1923171226.md) of a [DepthMediaFrame](../windows.media.capture.frames/depthmediaframe.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.depthcorrelatedcoordinatemapper
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class DepthCorrelatedCoordinateMapper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDepthCorrelatedCoordinateMapper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDepthCorrelatedCoordinateMapper.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Unprojects a 2D point from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to a point in 3D space, using depth information from the [DepthMediaFrame](../windows.media.capture.frames/depthmediaframe.md) from which the coordinate mapper was created with a call to [TryCreateCoordinateMapper](../windows.media.capture.frames/depthmediaframe_trycreatecoordinatemapper_1923171226.md).
     * @param {POINT} sourcePoint The 2D source point within the [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to map.
     * @param {SpatialCoordinateSystem} targetCoordinateSystem The coordinate system to which the point is unprojected.
     * @returns {Vector3} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.depthcorrelatedcoordinatemapper.unprojectpoint
     */
    UnprojectPoint(sourcePoint, targetCoordinateSystem) {
        if (!this.HasProp("__IDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthCorrelatedCoordinateMapper := IDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IDepthCorrelatedCoordinateMapper.UnprojectPoint(sourcePoint, targetCoordinateSystem)
    }

    /**
     * Unprojects an array of 2D points from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to a point in 3D space, using depth information from the [DepthMediaFrame](../windows.media.capture.frames/depthmediaframe.md) from which the coordinate mapper was created with a call to [TryCreateCoordinateMapper](../windows.media.capture.frames/depthmediaframe_trycreatecoordinatemapper_1923171226.md).
     * @param {Integer} sourcePoints_length 
     * @param {Pointer<POINT>} sourcePoints The array of 2D source points within the [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to map.
     * @param {SpatialCoordinateSystem} targetCoordinateSystem The coordinate system to which the points are unprojected.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector3>>} results An array of points in 3D space.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.depthcorrelatedcoordinatemapper.unprojectpoints
     */
    UnprojectPoints(sourcePoints_length, sourcePoints, targetCoordinateSystem, results_length, results) {
        if (!this.HasProp("__IDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthCorrelatedCoordinateMapper := IDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IDepthCorrelatedCoordinateMapper.UnprojectPoints(sourcePoints_length, sourcePoints, targetCoordinateSystem, results_length, results)
    }

    /**
     * Maps a point from one [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to another, using depth information from the [DepthMediaFrame](../windows.media.capture.frames/depthmediaframe.md) from which the coordinate mapper was created with a call to [TryCreateCoordinateMapper](../windows.media.capture.frames/depthmediaframe_trycreatecoordinatemapper_1923171226.md).
     * @param {POINT} sourcePoint The source point to be mapped to the coordinate system of a different media frame source, which is specified in the *targetCoordinateSystem* parameter.
     * @param {SpatialCoordinateSystem} targetCoordinateSystem The coordinate system of the target media frame source to which the point is mapped.
     * @param {CameraIntrinsics} targetCameraIntrinsics The camera intrinsics describing the projection and distortion models of the media frame source to which the point is mapped.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.depthcorrelatedcoordinatemapper.mappoint
     */
    MapPoint(sourcePoint, targetCoordinateSystem, targetCameraIntrinsics) {
        if (!this.HasProp("__IDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthCorrelatedCoordinateMapper := IDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IDepthCorrelatedCoordinateMapper.MapPoint(sourcePoint, targetCoordinateSystem, targetCameraIntrinsics)
    }

    /**
     * Maps an array of points from one [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) to another, using depth information from the [DepthMediaFrame](../windows.media.capture.frames/depthmediaframe.md) from which the coordinate mapper was created with a call to [TryCreateCoordinateMapper](../windows.media.capture.frames/depthmediaframe_trycreatecoordinatemapper_1923171226.md).
     * @param {Integer} sourcePoints_length 
     * @param {Pointer<POINT>} sourcePoints An array of source points to be mapped to the coordinate system of a different media frame source, which is specified in the *targetCoordinateSystem* parameter.
     * @param {SpatialCoordinateSystem} targetCoordinateSystem The coordinate system of the target media frame source to which the points are mapped.
     * @param {CameraIntrinsics} targetCameraIntrinsics The camera intrinsics describing the projection and distortion models of the media frame source to which the points are mapped.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results An array mapped points.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.depthcorrelatedcoordinatemapper.mappoints
     */
    MapPoints(sourcePoints_length, sourcePoints, targetCoordinateSystem, targetCameraIntrinsics, results_length, results) {
        if (!this.HasProp("__IDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDepthCorrelatedCoordinateMapper := IDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IDepthCorrelatedCoordinateMapper.MapPoints(sourcePoints_length, sourcePoints, targetCoordinateSystem, targetCameraIntrinsics, results_length, results)
    }

    /**
     * Disposes of the object and associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [DepthCorrelatedCoordinateMapper](depthcorrelatedcoordinatemapper.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.depthcorrelatedcoordinatemapper.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
