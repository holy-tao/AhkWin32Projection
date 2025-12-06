#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device.ahk
#Include .\ID2D1DeviceContext.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class Direct2D {

;@region Constants

    /**
     * @type {Float}
     */
    static D2D1_DEFAULT_FLATTENING_TOLERANCE => 0.25

    /**
     * @type {Guid}
     */
    static CLSID_D2D12DAffineTransform => Guid("{6aa97485-6354-4cfc-908c-e4a74f62c96c}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D13DPerspectiveTransform => Guid("{c2844d0b-3d86-46e7-85ba-526c9240f3fb}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D13DTransform => Guid("{e8467b04-ec61-4b8a-b5de-d4d73debea5a}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1ArithmeticComposite => Guid("{fc151437-049a-4784-a24a-f1c4daf20987}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Atlas => Guid("{913e2be4-fdcf-4fe2-a5f0-2454f14ff408}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1BitmapSource => Guid("{5fb6c24d-c6dd-4231-9404-50f4d5c3252d}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Blend => Guid("{81c5b77b-13f8-4cdd-ad20-c890547ac65d}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Border => Guid("{2a2d49c0-4acf-43c7-8c6a-7c4a27874d27}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Brightness => Guid("{8cea8d1e-77b0-4986-b3b9-2f0c0eae7887}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1ColorManagement => Guid("{1a28524c-fdd6-4aa4-ae8f-837eb8267b37}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1ColorMatrix => Guid("{921f03d6-641c-47df-852d-b4bb6153ae11}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Composite => Guid("{48fc9f51-f6ac-48f1-8b58-3b28ac46f76d}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1ConvolveMatrix => Guid("{407f8c08-5533-4331-a341-23cc3877843e}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Crop => Guid("{e23f7110-0e9a-4324-af47-6a2c0c46f35b}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1DirectionalBlur => Guid("{174319a6-58e9-49b2-bb63-caf2c811a3db}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1DiscreteTransfer => Guid("{90866fcd-488e-454b-af06-e5041b66c36c}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1DisplacementMap => Guid("{edc48364-0417-4111-9450-43845fa9f890}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1DistantDiffuse => Guid("{3e7efd62-a32d-46d4-a83c-5278889ac954}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1DistantSpecular => Guid("{428c1ee5-77b8-4450-8ab5-72219c21abda}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1DpiCompensation => Guid("{6c26c5c7-34e0-46fc-9cfd-e5823706e228}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Flood => Guid("{61c23c20-ae69-4d8e-94cf-50078df638f2}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1GammaTransfer => Guid("{409444c4-c419-41a0-b0c1-8cd0c0a18e42}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1GaussianBlur => Guid("{1feb6d69-2fe6-4ac9-8c58-1d7f93e7a6a5}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Scale => Guid("{9daf9369-3846-4d0e-a44e-0c607934a5d7}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Histogram => Guid("{881db7d0-f7ee-4d4d-a6d2-4697acc66ee8}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1HueRotation => Guid("{0f4458ec-4b32-491b-9e85-bd73f44d3eb6}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1LinearTransfer => Guid("{ad47c8fd-63ef-4acc-9b51-67979c036c06}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1LuminanceToAlpha => Guid("{41251ab7-0beb-46f8-9da7-59e93fcce5de}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Morphology => Guid("{eae6c40d-626a-4c2d-bfcb-391001abe202}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1OpacityMetadata => Guid("{6c53006a-4450-4199-aa5b-ad1656fece5e}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1PointDiffuse => Guid("{b9e303c3-c08c-4f91-8b7b-38656bc48c20}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1PointSpecular => Guid("{09c3ca26-3ae2-4f09-9ebc-ed3865d53f22}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Premultiply => Guid("{06eab419-deed-4018-80d2-3e1d471adeb2}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Saturation => Guid("{5cb2d9cf-327d-459f-a0ce-40c0b2086bf7}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Shadow => Guid("{c67ea361-1863-4e69-89db-695d3e9a5b6b}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1SpotDiffuse => Guid("{818a1105-7932-44f4-aa86-08ae7b2f2c93}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1SpotSpecular => Guid("{edae421e-7654-4a37-9db8-71acc1beb3c1}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1TableTransfer => Guid("{5bf818c3-5e43-48cb-b631-868396d6a1d4}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Tile => Guid("{b0784138-3b76-4bc5-b13b-0fa2ad02659f}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Turbulence => Guid("{cf2bb6ae-889a-4ad7-ba29-a2fd732c9fc9}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1UnPremultiply => Guid("{fb9ac489-ad8d-41ed-9999-bb6347d110f7}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1YCbCr => Guid("{99503cc1-66c7-45c9-a875-8ad8a7914401}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Contrast => Guid("{b648a78a-0ed5-4f80-a94a-8e825aca6b77}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1RgbToHue => Guid("{23f3e5ec-91e8-4d3d-ad0a-afadc1004aa1}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1HueToRgb => Guid("{7b78a6bd-0141-4def-8a52-6356ee0cbdd5}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1ChromaKey => Guid("{74c01f5b-2a0d-408c-88e2-c7a3c7197742}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Emboss => Guid("{b1c5eb2b-0348-43f0-8107-4957cacba2ae}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Exposure => Guid("{b56c8cfa-f634-41ee-bee0-ffa617106004}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Grayscale => Guid("{36dde0eb-3725-42e0-836d-52fb20aee644}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Invert => Guid("{e0c3784d-cb39-4e84-b6fd-6b72f0810263}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Posterize => Guid("{2188945e-33a3-4366-b7bc-086bd02d0884}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Sepia => Guid("{3a1af410-5f1d-4dbe-84df-915da79b7153}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Sharpen => Guid("{c9b887cb-c5ff-4dc5-9779-273dcf417c7d}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Straighten => Guid("{4da47b12-79a3-4fb0-8237-bbc3b2a4de08}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1TemperatureTint => Guid("{89176087-8af9-4a08-aeb1-895f38db1766}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Vignette => Guid("{c00c40be-5e67-4ca3-95b4-f4b02c115135}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1EdgeDetection => Guid("{eff583ca-cb07-4aa9-ac5d-2cc44c76460f}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1HighlightsShadows => Guid("{cadc8384-323f-4c7e-a361-2e2b24df6ee4}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1LookupTable3D => Guid("{349e0eda-0088-4a79-9ca3-c7e300202020}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Opacity => Guid("{811d79a4-de28-4454-8094-c64685f8bd4c}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1AlphaMask => Guid("{c80ecff0-3fd5-4f05-8328-c5d1724b4f0a}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1CrossFade => Guid("{12f575e8-4db1-485f-9a84-03a07dd3829f}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1Tint => Guid("{36312b17-f7dd-4014-915d-ffca768cf211}")

    /**
     * @type {Float}
     */
    static D2D1_SCENE_REFERRED_SDR_WHITE_LEVEL => 80

    /**
     * @type {Guid}
     */
    static CLSID_D2D1WhiteLevelAdjustment => Guid("{44a1cadb-6cdd-4818-8ff4-26c1cfe95bdb}")

    /**
     * @type {Guid}
     */
    static CLSID_D2D1HdrToneMap => Guid("{7b0b748d-4610-4486-a90c-999d9a2e2b11}")

    /**
     * @type {Integer (UInt32)}
     */
    static D2D1_APPEND_ALIGNED_ELEMENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_D2D => 2201
;@endregion Constants

;@region Methods
    /**
     * D2D1CreateFactory(D2D1_FACTORY_TYPE,REFIID,D2D1_FACTORY_OPTIONS*,void**) creates a factory object that can be used to create Direct2D resources.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> interface provides the starting point for Direct2D. In general, an object created from a single instance of a factory object can be used with other resources created from that instance, but not with resources created by other factory instances.
     * @param {Integer} factoryType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_factory_type">D2D1_FACTORY_TYPE</a></b>
     * 
     * The threading model of the factory and the resources it creates.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> that is obtained by using `__uuidof(ID2D1Factory)`.
     * @param {Pointer<D2D1_FACTORY_OPTIONS>} pFactoryOptions Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_factory_options">D2D1_FACTORY_OPTIONS</a>*</b>
     * 
     * The level of detail provided to the debugging layer.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address to a pointer to the new factory.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1createfactory
     * @since windows6.1
     */
    static D2D1CreateFactory(factoryType, riid, pFactoryOptions) {
        result := DllCall("d2d1.dll\D2D1CreateFactory", "int", factoryType, "ptr", riid, "ptr", pFactoryOptions, "ptr*", &ppIFactory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppIFactory
    }

    /**
     * Creates a rotation transformation that rotates by the specified angle about the specified point.
     * @remarks
     * Rotation occurs in the plane of the 2-D surface.
     * @param {Float} angle Type: <b>FLOAT</b>
     * 
     * The clockwise rotation angle, in degrees.
     * @param {D2D_POINT_2F} center Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The point about which to rotate.
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this method returns, contains the new rotation transformation. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1makerotatematrix
     * @since windows6.1
     */
    static D2D1MakeRotateMatrix(angle, center, matrix) {
        DllCall("d2d1.dll\D2D1MakeRotateMatrix", "float", angle, "ptr", center, "ptr", matrix)
    }

    /**
     * Creates a skew transformation that has the specified x-axis angle, y-axis angle, and center point.
     * @param {Float} angleX Type: <b>FLOAT</b>
     * 
     * The x-axis skew angle, which is measured in degrees counterclockwise from the y-axis.
     * @param {Float} angleY Type: <b>FLOAT</b>
     * 
     * The y-axis skew angle, which is measured in degrees counterclockwise from the x-axis.
     * @param {D2D_POINT_2F} center Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The center point of the skew operation.
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this method returns, contains the rotation transformation. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1makeskewmatrix
     * @since windows6.1
     */
    static D2D1MakeSkewMatrix(angleX, angleY, center, matrix) {
        DllCall("d2d1.dll\D2D1MakeSkewMatrix", "float", angleX, "float", angleY, "ptr", center, "ptr", matrix)
    }

    /**
     * Indicates whether the specified matrix is invertible.
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The matrix to test.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>true</b> if the matrix was inverted; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1ismatrixinvertible
     * @since windows6.1
     */
    static D2D1IsMatrixInvertible(matrix) {
        result := DllCall("d2d1.dll\D2D1IsMatrixInvertible", "ptr", matrix, "int")
        return result
    }

    /**
     * Tries to invert the specified matrix.
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The matrix to invert.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>true</b> if the matrix was inverted; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1invertmatrix
     * @since windows6.1
     */
    static D2D1InvertMatrix(matrix) {
        result := DllCall("d2d1.dll\D2D1InvertMatrix", "ptr", matrix, "int")
        return result
    }

    /**
     * Creates a new Direct2D device associated with the provided DXGI device.
     * @remarks
     * This function will also create a new <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1factory1">ID2D1Factory1</a> that can be retrieved through <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1resource-getfactory">ID2D1Resource::GetFactory</a>.
     * 
     * If the creation properties are not specified, then <i>d2dDevice</i> will inherit its threading mode from <i>dxgiDevice</i> and debug tracing will not be enabled.
     * @param {IDXGIDevice} dxgiDevice The DXGI device the Direct2D device is associated with.
     * @param {Pointer<D2D1_CREATION_PROPERTIES>} creationProperties The properties to apply to the Direct2D device.
     * @returns {ID2D1Device} When this function returns, contains the address of a pointer to a Direct2D device.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1createdevice
     * @since windows8.0
     */
    static D2D1CreateDevice(dxgiDevice, creationProperties) {
        result := DllCall("d2d1.dll\D2D1CreateDevice", "ptr", dxgiDevice, "ptr", creationProperties, "ptr*", &d2dDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID2D1Device(d2dDevice)
    }

    /**
     * Creates a new Direct2D device context associated with a DXGI surface.
     * @remarks
     * This function will also create a new <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1factory1">ID2D1Factory1</a> that can be retrieved through <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1resource-getfactory">ID2D1Resource::GetFactory</a>.
     * 
     * This function will also create a new <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> that can be retrieved through <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getdevice">ID2D1DeviceContext::GetDevice</a>.
     * 
     * The DXGI device will be specified implicitly through <i>dxgiSurface</i>.
     * 
     * If <i>creationProperties</i> are not specified, the Direct2D device will inherit its threading mode from the DXGI device implied by <i>dxgiSurface</i> and debug tracing will not be enabled.
     * @param {IDXGISurface} dxgiSurface The DXGI surface the Direct2D device context is associated with.
     * @param {Pointer<D2D1_CREATION_PROPERTIES>} creationProperties The properties to apply to the Direct2D device context.
     * @returns {ID2D1DeviceContext} When this function returns, contains the address of a pointer to a Direct2D device context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1createdevicecontext
     * @since windows8.0
     */
    static D2D1CreateDeviceContext(dxgiSurface, creationProperties) {
        result := DllCall("d2d1.dll\D2D1CreateDeviceContext", "ptr", dxgiSurface, "ptr", creationProperties, "ptr*", &d2dDeviceContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID2D1DeviceContext(d2dDeviceContext)
    }

    /**
     * Converts the given color from one colorspace to another.
     * @param {Integer} sourceColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * The source color space.
     * @param {Integer} destinationColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * The destination color space.
     * @param {Pointer<D2D1_COLOR_F>} color Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a>*</b>
     * 
     * The source color.
     * @returns {D2D1_COLOR_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a></b>
     * 
     * The converted color.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1convertcolorspace
     */
    static D2D1ConvertColorSpace(sourceColorSpace, destinationColorSpace, color) {
        result := DllCall("d2d1.dll\D2D1ConvertColorSpace", "int", sourceColorSpace, "int", destinationColorSpace, "ptr", color, "ptr")
        return result
    }

    /**
     * Returns the sine and cosine of an angle.
     * @param {Float} angle Type: <b>FLOAT</b>
     * 
     * The angle to calculate.
     * @param {Pointer<Float>} s Type: <b>FLOAT*</b>
     * 
     * The sine of the angle.
     * @param {Pointer<Float>} c Type: <b>FLOAT*</b>
     * 
     * The cosine of the angle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1sincos
     */
    static D2D1SinCos(angle, s, c) {
        sMarshal := s is VarRef ? "float*" : "ptr"
        cMarshal := c is VarRef ? "float*" : "ptr"

        DllCall("d2d1.dll\D2D1SinCos", "float", angle, sMarshal, s, cMarshal, c)
    }

    /**
     * Returns the tangent of an angle.
     * @param {Float} angle Type: <b>FLOAT</b>
     * 
     * The angle to calculate the tangent for.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The tangent of the angle.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1tan
     */
    static D2D1Tan(angle) {
        result := DllCall("d2d1.dll\D2D1Tan", "float", angle, "float")
        return result
    }

    /**
     * Returns the length of a 3 dimensional vector.
     * @param {Float} x Type: <b>FLOAT</b>
     * 
     * The  x value of the vector.
     * @param {Float} y Type: <b>FLOAT</b>
     * 
     * The  y value of the vector.
     * @param {Float} z Type: <b>FLOAT</b>
     * 
     * The  z value of the vector.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The length of the vector.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1vec3length
     */
    static D2D1Vec3Length(x, y, z) {
        result := DllCall("d2d1.dll\D2D1Vec3Length", "float", x, "float", y, "float", z, "float")
        return result
    }

    /**
     * Computes the maximum factor by which a given transform can stretch any vector.
     * @remarks
     * Formally, if M is the input matrix, this method will return the maximum value of |V * M| / |V| for all vectors V, where |.| denotes length.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Since this describes how M affects vectors (rather than points), the translation components (_31 and _32) of M are ignored.</div>
     * <div> </div>
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix The input transform matrix.
     * @returns {Float} The scale factor.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-d2d1computemaximumscalefactor
     * @since windows8.1
     */
    static D2D1ComputeMaximumScaleFactor(matrix) {
        result := DllCall("d2d1.dll\D2D1ComputeMaximumScaleFactor", "ptr", matrix, "float")
        return result
    }

    /**
     * Returns the interior points for a gradient mesh patch based on the points defining a Coons patch.
     * @remarks
     * This function is called by the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3helper/nf-d2d1_3helper-gradientmeshpatchfromcoonspatch">GradientMeshPatchFromCoonsPatch</a> function and is not intended to be used directly.
     * @param {Pointer<D2D_POINT_2F>} pPoint0 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 0.
     * @param {Pointer<D2D_POINT_2F>} pPoint1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 1.
     * @param {Pointer<D2D_POINT_2F>} pPoint2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 2.
     * @param {Pointer<D2D_POINT_2F>} pPoint3 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 3.
     * @param {Pointer<D2D_POINT_2F>} pPoint4 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 4.
     * @param {Pointer<D2D_POINT_2F>} pPoint5 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 5.
     * @param {Pointer<D2D_POINT_2F>} pPoint6 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 6.
     * @param {Pointer<D2D_POINT_2F>} pPoint7 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 7.
     * @param {Pointer<D2D_POINT_2F>} pPoint8 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 8.
     * @param {Pointer<D2D_POINT_2F>} pPoint9 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 9.
     * @param {Pointer<D2D_POINT_2F>} pPoint10 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 10.
     * @param {Pointer<D2D_POINT_2F>} pPoint11 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The coordinate-space location of the control point at position 11.
     * @param {Pointer<D2D_POINT_2F>} pTensorPoint11 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * Returns the interior point for the gradient mesh corresponding to point11 in the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a> structure.
     * @param {Pointer<D2D_POINT_2F>} pTensorPoint12 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * Returns the interior point for the gradient mesh corresponding to point12 in the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a> structure.
     * @param {Pointer<D2D_POINT_2F>} pTensorPoint21 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * Returns the interior point for the gradient mesh corresponding to point21 in the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a> structure.
     * @param {Pointer<D2D_POINT_2F>} pTensorPoint22 Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * Returns the interior point for the gradient mesh corresponding to point22 in the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch">D2D1_GRADIENT_MESH_PATCH</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-d2d1getgradientmeshinteriorpointsfromcoonspatch
     * @since windows10.0.10240
     */
    static D2D1GetGradientMeshInteriorPointsFromCoonsPatch(pPoint0, pPoint1, pPoint2, pPoint3, pPoint4, pPoint5, pPoint6, pPoint7, pPoint8, pPoint9, pPoint10, pPoint11, pTensorPoint11, pTensorPoint12, pTensorPoint21, pTensorPoint22) {
        DllCall("d2d1.dll\D2D1GetGradientMeshInteriorPointsFromCoonsPatch", "ptr", pPoint0, "ptr", pPoint1, "ptr", pPoint2, "ptr", pPoint3, "ptr", pPoint4, "ptr", pPoint5, "ptr", pPoint6, "ptr", pPoint7, "ptr", pPoint8, "ptr", pPoint9, "ptr", pPoint10, "ptr", pPoint11, "ptr", pTensorPoint11, "ptr", pTensorPoint12, "ptr", pTensorPoint21, "ptr", pTensorPoint22)
    }

;@endregion Methods
}
