#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\D2D1_CREATION_PROPERTIES.ahk" { D2D1_CREATION_PROPERTIES }
#Import ".\ID2D1Device.ahk" { ID2D1Device }
#Import ".\D2D1_FACTORY_TYPE.ahk" { D2D1_FACTORY_TYPE }
#Import ".\D2D1_COLOR_SPACE.ahk" { D2D1_COLOR_SPACE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import "..\Dxgi\IDXGISurface.ahk" { IDXGISurface }
#Import ".\ID2D1DeviceContext.ahk" { ID2D1DeviceContext }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import ".\D2D1_FACTORY_OPTIONS.ahk" { D2D1_FACTORY_OPTIONS }

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */

;@region Functions
/**
 * D2D1CreateFactory(D2D1_FACTORY_TYPE,REFIID,D2D1_FACTORY_OPTIONS*,void**) creates a factory object that can be used to create Direct2D resources.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> interface provides the starting point for Direct2D. In general, an object created from a single instance of a factory object can be used with other resources created from that instance, but not with resources created by other factory instances.
 * @param {D2D1_FACTORY_TYPE} factoryType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_factory_type">D2D1_FACTORY_TYPE</a></b>
 * 
 * The threading model of the factory and the resources it creates.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * A reference to the IID of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> that is obtained by using `__uuidof(ID2D1Factory)`.
 * @param {Pointer<D2D1_FACTORY_OPTIONS>} pFactoryOptions Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_factory_options">D2D1_FACTORY_OPTIONS</a>*</b>
 * 
 * The level of detail provided to the debugging layer.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * When this method returns, contains the address to a pointer to the new factory.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1createfactory
 * @since windows6.1
 */
export D2D1CreateFactory(factoryType, riid, pFactoryOptions) {
    result := DllCall("d2d1.dll\D2D1CreateFactory", D2D1_FACTORY_TYPE, factoryType, Guid.Ptr, riid, D2D1_FACTORY_OPTIONS.Ptr, pFactoryOptions, "ptr*", &ppIFactory := 0, "HRESULT")
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
 * @param {Pointer<D2D_MATRIX_3X2_F>} _matrix Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
 * 
 * When this method returns, contains the new rotation transformation. You must allocate storage for this parameter.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1makerotatematrix
 * @since windows6.1
 */
export D2D1MakeRotateMatrix(angle, center, _matrix) {
    DllCall("d2d1.dll\D2D1MakeRotateMatrix", "float", angle, D2D_POINT_2F, center, D2D_MATRIX_3X2_F.Ptr, _matrix)
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
 * @param {Pointer<D2D_MATRIX_3X2_F>} _matrix Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
 * 
 * When this method returns, contains the rotation transformation. You must allocate storage for this parameter.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1makeskewmatrix
 * @since windows6.1
 */
export D2D1MakeSkewMatrix(angleX, angleY, center, _matrix) {
    DllCall("d2d1.dll\D2D1MakeSkewMatrix", "float", angleX, "float", angleY, D2D_POINT_2F, center, D2D_MATRIX_3X2_F.Ptr, _matrix)
}

/**
 * Indicates whether the specified matrix is invertible.
 * @param {Pointer<D2D_MATRIX_3X2_F>} _matrix Type: <b>const <a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
 * 
 * The matrix to test.
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * <b>true</b> if the matrix was inverted; otherwise, <b>false</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1ismatrixinvertible
 * @since windows6.1
 */
export D2D1IsMatrixInvertible(_matrix) {
    result := DllCall("d2d1.dll\D2D1IsMatrixInvertible", D2D_MATRIX_3X2_F.Ptr, _matrix, BOOL)
    return result
}

/**
 * Tries to invert the specified matrix.
 * @param {Pointer<D2D_MATRIX_3X2_F>} _matrix Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
 * 
 * The matrix to invert.
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * <b>true</b> if the matrix was inverted; otherwise, <b>false</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1invertmatrix
 * @since windows6.1
 */
export D2D1InvertMatrix(_matrix) {
    result := DllCall("d2d1.dll\D2D1InvertMatrix", D2D_MATRIX_3X2_F.Ptr, _matrix, BOOL)
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
export D2D1CreateDevice(dxgiDevice, creationProperties) {
    result := DllCall("d2d1.dll\D2D1CreateDevice", "ptr", dxgiDevice, D2D1_CREATION_PROPERTIES.Ptr, creationProperties, "ptr*", &d2dDevice := 0, "HRESULT")
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
export D2D1CreateDeviceContext(dxgiSurface, creationProperties) {
    result := DllCall("d2d1.dll\D2D1CreateDeviceContext", "ptr", dxgiSurface, D2D1_CREATION_PROPERTIES.Ptr, creationProperties, "ptr*", &d2dDeviceContext := 0, "HRESULT")
    return ID2D1DeviceContext(d2dDeviceContext)
}

/**
 * Converts the given color from one colorspace to another.
 * @param {D2D1_COLOR_SPACE} sourceColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
 * 
 * The source color space.
 * @param {D2D1_COLOR_SPACE} destinationColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
 * 
 * The destination color space.
 * @param {Pointer<D2D1_COLOR_F>} _color Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a>*</b>
 * 
 * The source color.
 * @returns {D2D1_COLOR_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a></b>
 * 
 * The converted color.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-d2d1convertcolorspace
 */
export D2D1ConvertColorSpace(sourceColorSpace, destinationColorSpace, _color) {
    result := DllCall("d2d1.dll\D2D1ConvertColorSpace", D2D1_COLOR_SPACE, sourceColorSpace, D2D1_COLOR_SPACE, destinationColorSpace, D2D1_COLOR_F.Ptr, _color, D2D1_COLOR_F)
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
export D2D1SinCos(angle, s, c) {
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
export D2D1Tan(angle) {
    result := DllCall("d2d1.dll\D2D1Tan", "float", angle, Float32)
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
export D2D1Vec3Length(x, y, z) {
    result := DllCall("d2d1.dll\D2D1Vec3Length", "float", x, "float", y, "float", z, Float32)
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
 * @param {Pointer<D2D_MATRIX_3X2_F>} _matrix The input transform matrix.
 * @returns {Float} The scale factor.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-d2d1computemaximumscalefactor
 * @since windows8.1
 */
export D2D1ComputeMaximumScaleFactor(_matrix) {
    result := DllCall("d2d1.dll\D2D1ComputeMaximumScaleFactor", D2D_MATRIX_3X2_F.Ptr, _matrix, Float32)
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
export D2D1GetGradientMeshInteriorPointsFromCoonsPatch(pPoint0, pPoint1, pPoint2, pPoint3, pPoint4, pPoint5, pPoint6, pPoint7, pPoint8, pPoint9, pPoint10, pPoint11, pTensorPoint11, pTensorPoint12, pTensorPoint21, pTensorPoint22) {
    DllCall("d2d1.dll\D2D1GetGradientMeshInteriorPointsFromCoonsPatch", D2D_POINT_2F.Ptr, pPoint0, D2D_POINT_2F.Ptr, pPoint1, D2D_POINT_2F.Ptr, pPoint2, D2D_POINT_2F.Ptr, pPoint3, D2D_POINT_2F.Ptr, pPoint4, D2D_POINT_2F.Ptr, pPoint5, D2D_POINT_2F.Ptr, pPoint6, D2D_POINT_2F.Ptr, pPoint7, D2D_POINT_2F.Ptr, pPoint8, D2D_POINT_2F.Ptr, pPoint9, D2D_POINT_2F.Ptr, pPoint10, D2D_POINT_2F.Ptr, pPoint11, D2D_POINT_2F.Ptr, pTensorPoint11, D2D_POINT_2F.Ptr, pTensorPoint12, D2D_POINT_2F.Ptr, pTensorPoint21, D2D_POINT_2F.Ptr, pTensorPoint22)
}

;@endregion Functions
