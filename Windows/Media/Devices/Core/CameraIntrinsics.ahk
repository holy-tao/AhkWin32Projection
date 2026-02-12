#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraIntrinsics.ahk
#Include .\ICameraIntrinsics2.ahk
#Include .\ICameraIntrinsicsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the intrinsics that describe the camera distortion model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class CameraIntrinsics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraIntrinsics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraIntrinsics.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs an instance of a CameraIntrinsics.
     * @param {Vector2} focalLength The focal length of the camera.
     * @param {Vector2} principalPoint The principal point of the camera.
     * @param {Vector3} radialDistortion The radial distortion coefficient of the camera.
     * @param {Vector2} tangentialDistortion The tangential distortion coefficient of the camera.
     * @param {Integer} imageWidth The image width of the camera, in pixels.
     * @param {Integer} imageHeight The image height of the camera, in pixels.
     * @returns {CameraIntrinsics} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.#ctor
     */
    static Create(focalLength, principalPoint, radialDistortion, tangentialDistortion, imageWidth, imageHeight) {
        if (!CameraIntrinsics.HasProp("__ICameraIntrinsicsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.Core.CameraIntrinsics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICameraIntrinsicsFactory.IID)
            CameraIntrinsics.__ICameraIntrinsicsFactory := ICameraIntrinsicsFactory(factoryPtr)
        }

        return CameraIntrinsics.__ICameraIntrinsicsFactory.Create(focalLength, principalPoint, radialDistortion, tangentialDistortion, imageWidth, imageHeight)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the focal length of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.focallength
     * @type {Vector2} 
     */
    FocalLength {
        get => this.get_FocalLength()
    }

    /**
     * Gets the principal point of the camera.
     * @remarks
     * The principal point is expressed in pixels, not in normalized coordinates. The origin [0,0] is the bottom, left corner of the image (+Y pointing up). Note that this differs from typical image coordinates which have the origin in the top, left corner of the image (+Y pointing down).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.principalpoint
     * @type {Vector2} 
     */
    PrincipalPoint {
        get => this.get_PrincipalPoint()
    }

    /**
     * Gets the radial distortion coefficient of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.radialdistortion
     * @type {Vector3} 
     */
    RadialDistortion {
        get => this.get_RadialDistortion()
    }

    /**
     * Gets the tangential distortion coefficient of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.tangentialdistortion
     * @type {Vector2} 
     */
    TangentialDistortion {
        get => this.get_TangentialDistortion()
    }

    /**
     * Gets the image width of the camera, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.imagewidth
     * @type {Integer} 
     */
    ImageWidth {
        get => this.get_ImageWidth()
    }

    /**
     * Gets the image height of the camera, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.imageheight
     * @type {Integer} 
     */
    ImageHeight {
        get => this.get_ImageHeight()
    }

    /**
     * Gets a matrix that transforms a 2D coordinate in meters on the image plane to video frame pixel coordinates without compensating for the distortion model of the camera. The 2D point resulting from this transformation will not accurately map to the pixel coordinate in a video frame unless the app applies its own distortion compensation.   This is useful for apps that choose to implement GPU-based distortion compensation instead of using [UndistortPoint](/uwp/api/windows.media.devices.core.cameraintrinsics#Windows_Media_Devices_Core_CameraIntrinsics_UndistortPoint_Windows_Foundation_Point_), which uses the CPU to compute the distortion compensation.
     * @remarks
     * The transform converts from a 2D coordinate in meters on the image plane (origin at the principal point, +X pointing to the right and +Y pointing up), to a 2D coordinate in pixels with the origin at the top-left corner of the image, and +X pointing to the right, and +Y pointing down. If the 2D coordinate is expressed as a vector with four components, Z must be set to 0 and W must set to 1.
     * 
     * To convert a 3D coordinate in the camera's coordinate system to pixel coordinates, the X and Y components of the coordinate must first be divided by the distance from the camera (i.e. the Z coordinate) to project them onto the image plane. Note that camera coordinate systems are right-handed by convention, with +X pointing right, +Y pointing up, and -Z pointing out from the camera through the center (principal point) of the image. In that convention, the Z coordinate must be negated when dividing into the X and Y components. For example:
     * 
     * ```cppwinrt
     * using namespace winrt::Windows::Foundation::Numerics;
     * winrt::Windows::Foundation::Point ProjectCameraCoordinateToPixelCoordinate(
     *     const winrt::Windows::Media::Devices::Core::CameraIntrinsics& cameraIntrinsics,
     *     const float3& cameraCoordinate)
     * {
     *     const float2 imagePlaneCoordinate = float2{ cameraCoordinate.x / -cameraCoordinate.z, cameraCoordinate.y / -cameraCoordinate.z };
     *     float2 pixelCoordinate = transform(imagePlaneCoordinate, cameraIntrinsics.UndistortedProjectionTransform());
     *     return winrt::Windows::Foundation::Point{ pixelCoordinate.x, pixelCoordinate.y };
     * }
     * ```
     * 
     * An equivalent result can be acheived using a vector with four components by setting the Z component to 1 and the W component to the distance from the camera. Note that the resulting X and Y components must be divided by the resulting W component to yield the final pixel coordinates:
     * 
     * ```cppwinrt
     * using namespace winrt::Windows::Foundation::Numerics;
     * winrt::Windows::Foundation::Point ProjectCameraCoordinateToPixelCoordinate(
     *     const winrt::Windows::Media::Devices::Core::CameraIntrinsics& cameraIntrinsics,
     *     const float3& cameraCoordinate)
     * {
     *     float4 cameraCoordinateVector{ cameraCoordinate.x, cameraCoordinate.y, 1, -cameraCoordinate.z };
     *     float4 pixelCoordinate = transform(cameraCoordinateVector, cameraIntrinsics.UndistortedProjectionTransform());
     *     return winrt::Windows::Foundation::Point{ pixelCoordinate.x / pixelCoordinate.w, pixelCoordinate.y / pixelCoordinate.w };
     * }
     * ```
     * 
     * If this transform will be applied to many 3D coordinates, it may be more convenient to adjust the matrix itself, rather than each input coordinate. This can be accomplished by swapping the third and fourth rows of the matrix, and using a homogeneous coordinate transform function like <a href="https://docs.microsoft.com/windows/win32/api/directxmath/nf-directxmath-xmvector3transformcoordstream">XMVector3TransformCoordStream</a>. Note that a right-handed-to-left-handed conversion is also applied as part of the transform so that the distance from the camera is a positive value:
     * 
     * ```cppwinrt
     * using namespace DirectX;
     * void ProjectCameraCoordinatesToPixelCoordinates(
     *     const winrt::Windows::Media::Devices::Core::CameraIntrinsics& cameraIntrinsics,
     *     const winrt::array_view<XMFLOAT3>& cameraCoordinates,
     *     winrt::array_view<winrt::Windows::Foundation::Point>& pixelCoordinates)
     * {
     *     XMMATRIX undistortedProjectionTransform = XMLoadFloat4x4(&cameraIntrinsics.UndistortedProjectionTransform());
     *     std::swap(undistortedProjectionTransform.r[2], undistortedProjectionTransform.r[3]);
     * 
     *     // convert right-handed coordinates (-Z forward) to right-handed coordinates (+Z forward) as part of the transform
     *     static const XMMATRIX rightToLeft = XMMatrixScaling(1, 1, -1);
     * 
     *     std::vector<XMFLOAT3> pixelCoordinateVectors(cameraCoordinates.size());
     *     XMVector3TransformCoordStream(
     *         pixelCoordinateVectors.data(), sizeof(pixelCoordinateVectors[0]),
     *         cameraCoordinates.data(), sizeof(cameraCoordinates[0]), cameraCoordinates.size(),
     *         rightToLeft * undistortedProjectionTransform);
     * 
     *     std::transform(pixelCoordinateVectors.begin(), pixelCoordinateVectors.end(), pixelCoordinates.begin(),
     *         [](const XMFLOAT3& v) { return winrt::Windows::Foundation::Point{ v.x, v.y }; });
     * }
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.undistortedprojectiontransform
     * @type {Matrix4x4} 
     */
    UndistortedProjectionTransform {
        get => this.get_UndistortedProjectionTransform()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_FocalLength() {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.get_FocalLength()
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_PrincipalPoint() {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.get_PrincipalPoint()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RadialDistortion() {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.get_RadialDistortion()
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_TangentialDistortion() {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.get_TangentialDistortion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageWidth() {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.get_ImageWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageHeight() {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.get_ImageHeight()
    }

    /**
     * Projects a camera space point into screen space pixel coordinates.
     * @remarks
     * The 3D coordinate must be expressed in meters, using a left-handed coordinate system, with +X pointing right, +Y pointing up, and +Z pointing forward out from the camera through the center (principal point) of the image. The resulting 2D coordinate will be expressed in pixels, with the origin in the top-left corner of the image; that is, +X pointing right, and +Y pointing down.
     * @param {Vector3} coordinate The camera space point to project into screen space.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.projectontoframe
     */
    ProjectOntoFrame(coordinate) {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.ProjectOntoFrame(coordinate)
    }

    /**
     * Unprojects pixel coordinates into a camera space ray from the camera origin, expressed as a X, Y coordinates on a plane one meter from the camera.
     * @remarks
     * The image coordinate must be expressed in pixels, with the origin in the top-left corner of the image; that is, +X pointing right, and +Y pointing down. The unprojected coordinate will be expressed in meters, with +X pointing right, and +Y pointing up, on a plane located at the center (principal point) of the image, one meter away from the camera.
     * @param {POINT} pixelCoordinate The pixel coordinates to unproject into camera space.
     * @returns {Vector2} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.unprojectatunitdepth
     */
    UnprojectAtUnitDepth(pixelCoordinate) {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.UnprojectAtUnitDepth(pixelCoordinate)
    }

    /**
     * Projects an array of camera space points into screen space pixel coordinates.
     * @remarks
     * The 3D coordinates must be expressed in meters, using a left-handed coordinate system, with +X pointing right, +Y pointing up, and +Z pointing forward out from the camera through the center (principal point) of the image. The resulting 2D coordinates will be expressed in pixels, with the origin in the top-left corner of the image; that is, +X pointing right, and +Y pointing down.
     * @param {Integer} coordinates_length 
     * @param {Pointer<Vector3>} coordinates The array of camera space points to project into screen space.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results The array of screen space pixel coordinates.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.projectmanyontoframe
     */
    ProjectManyOntoFrame(coordinates_length, coordinates, results_length, results) {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.ProjectManyOntoFrame(coordinates_length, coordinates, results_length, results)
    }

    /**
     * Unprojects an array of pixel coordinates into an array of camera space rays from the camera origin, expressed as a X, Y coordinates on a plane one meter from the camera.
     * @remarks
     * The image coordinates must be expressed in pixels, with the origin in the top-left corner of the image; that is, +X pointing right, and +Y pointing down. The unprojected coordinates will be expressed in meters, with +X pointing right, and +Y pointing up,on a plane located at the center (principal point) of the image, one meter away from the camera.
     * @param {Integer} pixelCoordinates_length 
     * @param {Pointer<POINT>} pixelCoordinates The array of pixel coordinates to unproject into camera space.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<Vector2>>} results The array of X, Y coordinates of the unprojected pixels on a plane one meter from the camera.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.unprojectpixelsatunitdepth
     */
    UnprojectPixelsAtUnitDepth(pixelCoordinates_length, pixelCoordinates, results_length, results) {
        if (!this.HasProp("__ICameraIntrinsics")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics := ICameraIntrinsics(outPtr)
        }

        return this.__ICameraIntrinsics.UnprojectPixelsAtUnitDepth(pixelCoordinates_length, pixelCoordinates, results_length, results)
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_UndistortedProjectionTransform() {
        if (!this.HasProp("__ICameraIntrinsics2")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics2 := ICameraIntrinsics2(outPtr)
        }

        return this.__ICameraIntrinsics2.get_UndistortedProjectionTransform()
    }

    /**
     * Applies the distortion model of the camera to an undistorted point so that the resulting point's location is distorted as if it were captured by the camera's lens.
     * @param {POINT} input_ The point to undestort.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.distortpoint
     */
    DistortPoint(input_) {
        if (!this.HasProp("__ICameraIntrinsics2")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics2 := ICameraIntrinsics2(outPtr)
        }

        return this.__ICameraIntrinsics2.DistortPoint(input_)
    }

    /**
     * Applies the distortion model of the camera to an array of undistorted points so that the resulting points' locations are distorted as if they were captured by the camera's lens.
     * @param {Integer} inputs_length 
     * @param {Pointer<POINT>} inputs The array of points to undestort.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results An array of undistorted points.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.distortpoints
     */
    DistortPoints(inputs_length, inputs, results_length, results) {
        if (!this.HasProp("__ICameraIntrinsics2")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics2 := ICameraIntrinsics2(outPtr)
        }

        return this.__ICameraIntrinsics2.DistortPoints(inputs_length, inputs, results_length, results)
    }

    /**
     * Transforms a point to compensate for the distortion model of the camera, resulting in an undistorted point.
     * @param {POINT} input_ The point to undistort.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.undistortpoint
     */
    UndistortPoint(input_) {
        if (!this.HasProp("__ICameraIntrinsics2")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics2 := ICameraIntrinsics2(outPtr)
        }

        return this.__ICameraIntrinsics2.UndistortPoint(input_)
    }

    /**
     * Transforms an array of points to compensate for the distortion model of the camera, resulting in an array of undistorted points.
     * @param {Integer} inputs_length 
     * @param {Pointer<POINT>} inputs The array of points to undistort.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results An array of undistorted points.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.cameraintrinsics.undistortpoints
     */
    UndistortPoints(inputs_length, inputs, results_length, results) {
        if (!this.HasProp("__ICameraIntrinsics2")) {
            if ((queryResult := this.QueryInterface(ICameraIntrinsics2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraIntrinsics2 := ICameraIntrinsics2(outPtr)
        }

        return this.__ICameraIntrinsics2.UndistortPoints(inputs_length, inputs, results_length, results)
    }

;@endregion Instance Methods
}
