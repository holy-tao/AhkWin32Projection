#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1DrawingStateBlock1.ahk" { ID2D1DrawingStateBlock1 }
#Import ".\ID2D1StrokeStyle1.ahk" { ID2D1StrokeStyle1 }
#Import ".\ID2D1Factory.ahk" { ID2D1Factory }
#Import "..\DirectWrite\IDWriteRenderingParams.ahk" { IDWriteRenderingParams }
#Import ".\ID2D1PathGeometry1.ahk" { ID2D1PathGeometry1 }
#Import ".\D2D1_PROPERTY_BINDING.ahk" { D2D1_PROPERTY_BINDING }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\ID2D1GdiMetafile.ahk" { ID2D1GdiMetafile }
#Import ".\ID2D1Device.ahk" { ID2D1Device }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ID2D1Properties.ahk" { ID2D1Properties }
#Import ".\D2D1_DRAWING_STATE_DESCRIPTION1.ahk" { D2D1_DRAWING_STATE_DESCRIPTION1 }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import ".\D2D1_STROKE_STYLE_PROPERTIES1.ahk" { D2D1_STROKE_STYLE_PROPERTIES1 }

/**
 * Creates Direct2D resources. (ID2D1Factory1)
 * @remarks
 * The <b>ID2D1Factory1</b> interface is used to create devices, register and unregister effects, and enumerate effects properties. Effects are registered and unregistered globally. The registration APIs are placed on this interface for convenience.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1factory1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Factory1 extends ID2D1Factory {
    /**
     * The interface identifier for ID2D1Factory1
     * @type {Guid}
     */
    static IID := Guid("{bb12d362-daee-4b9a-aa1d-14ba401cfa1f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Factory1 interfaces
    */
    struct Vtbl extends ID2D1Factory.Vtbl {
        CreateDevice             : IntPtr
        CreateStrokeStyle        : IntPtr
        CreatePathGeometry       : IntPtr
        CreateDrawingStateBlock  : IntPtr
        CreateGdiMetafile        : IntPtr
        RegisterEffectFromStream : IntPtr
        RegisterEffectFromString : IntPtr
        UnregisterEffect         : IntPtr
        GetRegisteredEffects     : IntPtr
        GetEffectProperties      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Factory1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a ID2D1Device object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> device defines a resource domain in which a set of Direct2D objects and Direct2D device contexts can be used together.  Each call to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-d2d1createdevice">CreateDevice</a> returns a unique <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> object, even if you pass the same <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> multiple times.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> object used when creating  the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>.
     * @returns {ID2D1Device} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>**</b>
     * 
     * The requested <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(17, this, "ptr", dxgiDevice, "ptr*", &d2dDevice := 0, "HRESULT")
        return ID2D1Device(d2dDevice)
    }

    /**
     * Creates a ID2D1StrokeStyle1 object. (overload 2/2)
     * @remarks
     * It is valid to specify a dash array only if D2D1_DASH_STYLE_CUSTOM is also specified.
     * @param {Pointer<D2D1_STROKE_STYLE_PROPERTIES1>} strokeStyleProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_stroke_style_properties1">D2D1_STROKE_STYLE_PROPERTIES1</a>*</b>
     * 
     * The stroke style properties to apply.
     * @param {Pointer<Float>} dashes Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-abcfloat">FLOAT</a>*</b>
     * 
     * An array of widths for the dashes and gaps.
     * @param {Integer} dashesCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint64_description">UINT</a></b>
     * 
     * The size of the dash array.
     * @returns {ID2D1StrokeStyle1} Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1strokestyle1">ID2D1StrokeStyle1</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the  newly created stroke style.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createstrokestyle(constd2d1_stroke_style_properties1_constfloat_uint32_id2d1strokestyle1)
     */
    CreateStrokeStyle(strokeStyleProperties, dashes, dashesCount) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, D2D1_STROKE_STYLE_PROPERTIES1.Ptr, strokeStyleProperties, dashesMarshal, dashes, "uint", dashesCount, "ptr*", &strokeStyle := 0, "HRESULT")
        return ID2D1StrokeStyle1(strokeStyle)
    }

    /**
     * Creates an ID2D1PathGeometry1 object.
     * @returns {ID2D1PathGeometry1} Type: <b>const **</b>
     * 
     * When this method returns, contains the address of a pointer to the newly created path geometry.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createpathgeometry
     */
    CreatePathGeometry() {
        result := ComCall(19, this, "ptr*", &pathGeometry := 0, "HRESULT")
        return ID2D1PathGeometry1(pathGeometry)
    }

    /**
     * Creates a new drawing state block, this can be used in subsequent SaveDrawingState and RestoreDrawingState operations on the render target. (overload 3/3)
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} drawingStateDescription Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_drawing_state_description1">D2D1_DRAWING_STATE_DESCRIPTION1</a>*</b>
     * 
     * The drawing state description structure.
     * @param {IDWriteRenderingParams} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * The DirectWrite rendering params interface.
     * @returns {ID2D1DrawingStateBlock1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1drawingstateblock1">ID2D1DrawingStateBlock1</a>**</b>
     * 
     * The address of the newly created drawing state block.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createdrawingstateblock(constd2d1_drawing_state_description1_idwriterenderingparams_id2d1drawingstateblock1)
     */
    CreateDrawingStateBlock(drawingStateDescription, textRenderingParams) {
        result := ComCall(20, this, D2D1_DRAWING_STATE_DESCRIPTION1.Ptr, drawingStateDescription, "ptr", textRenderingParams, "ptr*", &drawingStateBlock := 0, "HRESULT")
        return ID2D1DrawingStateBlock1(drawingStateBlock)
    }

    /**
     * Creates a new ID2D1GdiMetafile object that you can use to replay metafile content.
     * @param {IStream} metafileStream Type: <b>IStream*</b>
     * 
     * A stream object that has the metafile data.
     * @returns {ID2D1GdiMetafile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile">ID2D1GdiMetafile</a>**</b>
     * 
     * The address of the newly created GDI metafile object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-creategdimetafile
     */
    CreateGdiMetafile(metafileStream) {
        result := ComCall(21, this, "ptr", metafileStream, "ptr*", &_metafile := 0, "HRESULT")
        return ID2D1GdiMetafile(_metafile)
    }

    /**
     * Registers an effect within the factory instance with the property XML specified as a stream.
     * @remarks
     * Direct2D effects must define their properties at registration time via registration XML. An effect declares several required system properties, 
     *         and can also declare custom properties. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/custom-effects">Custom effects</a> 
     *         for more information about formatting the <i>propertyXml</i> parameter.
     *       
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring">RegisterEffect</a> is both atomic and reference counted. To unregister an effect, 
     *         call <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1factory1-unregistereffect">UnregisterEffect</a> with the  <i>classId</i> of the effect.
     *       
     * 
     * <div class="alert"><b>Important</b>  <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring">RegisterEffect</a> does not hold a reference to the DLL or executable file in which 
     *           the effect is contained. The application must independently  make sure that the lifetime of the DLL or executable file completely contains all instances of each registered and created effect.
     *         </div>
     * <div> </div>
     * Aside from the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/built-in-effects">built-in effects</a> that are globally registered, this API registers effects only for this factory, derived device, 
     *       and device context interfaces.
     * @param {Pointer<Guid>} classId Type: <b>REFCLSID</b>
     * 
     * The identifier of the effect to be registered.
     * @param {IStream} propertyXml Type: <b>IStream</b>
     * 
     * A list of the effect properties, types, and metadata.
     * @param {Pointer<D2D1_PROPERTY_BINDING>} bindings Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_property_binding">D2D1_PROPERTY_BINDING</a>*</b>
     * 
     * An array of properties and methods.
     * 
     * This binds a property by name to a particular method implemented by the effect author to handle the property. 
     *               The name must be found in the corresponding <i>propertyXml</i>.
     * @param {Integer} bindingsCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint32_description">UINT32</a></b>
     * 
     * The number of bindings in the binding array.
     * @param {Pointer<PD2D1_EFFECT_FACTORY>} effectFactory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nc-d2d1_1-pd2d1_effect_factory">PD2D1_EFFECT_FACTORY</a></b>
     * 
     * The static factory that is used to create the corresponding effect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *             
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.
     *                 </td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstream
     */
    RegisterEffectFromStream(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        result := ComCall(22, this, Guid.Ptr, classId, "ptr", propertyXml, D2D1_PROPERTY_BINDING.Ptr, bindings, "uint", bindingsCount, "ptr", effectFactory, "HRESULT")
        return result
    }

    /**
     * Registers an effect within the factory instance with the property XML specified as a string.
     * @remarks
     * Direct2D effects must define their properties at registration time via registration XML. An effect declares several required system properties, 
     *         and can also declare custom properties. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/custom-effects">Custom effects</a> 
     *         for more information about formatting the <i>propertyXml</i> parameter.
     *       
     * 
     * <b>RegisterEffect</b> is both atomic and reference counted. To unregister an effect, 
     *         call <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1factory1-unregistereffect">UnregisterEffect</a> with the  <i>classId</i> of the effect.
     *       
     * 
     * <div class="alert"><b>Important</b>  <b>RegisterEffect</b> does not hold a reference to the DLL or executable file in which 
     *           the effect is contained. The application must independently  make sure that the lifetime of the DLL or executable file completely contains all instances of each registered and created effect.
     *         </div>
     * <div> </div>
     * Aside from the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/built-in-effects">built-in effects</a> that are globally registered, this API registers effects only for 
     *       this factory and derived device and device context interfaces.
     * @param {Pointer<Guid>} classId Type: <b>REFCLSID</b>
     * 
     * The identifier of the effect to be registered.
     * @param {PWSTR} propertyXml Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/chstring/nf-chstring-chstring-chstring(lpcwstr)">PCWSTR</a></b>
     * 
     * A list of the effect properties, types, and metadata.
     * @param {Pointer<D2D1_PROPERTY_BINDING>} bindings Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_property_binding">D2D1_PROPERTY_BINDING</a>*</b>
     * 
     * An array of properties and methods.
     * 
     * This binds a property by name to a particular method implemented by the effect author to handle the property. 
     *               The name must be found in the corresponding <i>propertyXml</i>.
     * @param {Integer} bindingsCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint32_description">UINT32</a></b>
     * 
     * The number of bindings in the binding array.
     * @param {Pointer<PD2D1_EFFECT_FACTORY>} effectFactory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nc-d2d1_1-pd2d1_effect_factory">PD2D1_EFFECT_FACTORY</a></b>
     * 
     * The static factory that is used to create the corresponding effect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *             
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.
     *                 </td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring
     */
    RegisterEffectFromString(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        propertyXml := propertyXml is String ? StrPtr(propertyXml) : propertyXml

        result := ComCall(23, this, Guid.Ptr, classId, "ptr", propertyXml, D2D1_PROPERTY_BINDING.Ptr, bindings, "uint", bindingsCount, "ptr", effectFactory, "HRESULT")
        return result
    }

    /**
     * Unregisters an effect within the factory instance that corresponds to the classId provided.
     * @remarks
     * In order for the effect to be fully unloaded, you must call <b>UnregisterEffect</b> the same number of times that you have registered the effect.
     * 
     * The <b>UnregisterEffect</b> method unregisters only those effects that are registered on the same factory. It cannot be used to unregister a built-in effect.
     * @param {Pointer<Guid>} classId Type: <b>REFCLSID</b>
     * 
     * The identifier of the effect to be unregistered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * D2DERR_EFFECT_IS_NOT_REGISTERED if the effect is not registered, S_OK otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-unregistereffect
     */
    UnregisterEffect(classId) {
        result := ComCall(24, this, Guid.Ptr, classId, "HRESULT")
        return result
    }

    /**
     * Returns the class IDs of the currently registered effects and global effects on this factory.
     * @remarks
     * The set of class IDs will be atomically returned by the API. The set will not be interrupted by other threads registering or unregistering effects.
     * 
     * If <i>effectsRegistered</i> is larger than <i>effectCount</i>, the supplied array will still be filled to capacity with the current set of registered effects. This method returns the CLSIDs for all global effects and all effects registered to this factory.
     * @param {Pointer<Guid>} effects Type: <b><a href="https://docs.microsoft.com/windows/desktop/com/clsid">CLSID</a>*</b>
     * 
     * When this method returns, contains an array of effects. <b>NULL</b> if no effects are retrieved.
     * @param {Integer} effectsCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint32_description">UINT32</a></b>
     * 
     * The capacity of the <i>effects</i> array.
     * @param {Pointer<Integer>} effectsReturned Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint32_description">UINT32</a>*</b>
     * 
     * When this method returns, contains the  number of effects copied into <i>effects</i>.
     * @param {Pointer<Integer>} effectsRegistered Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_uint32_description">UINT32</a>*</b>
     * 
     * When this method returns, contains the number of effects currently registered in the system.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</td>
     * <td><i>effectsRegistered</i> is larger than <i>effectCount</i>.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-getregisteredeffects
     */
    GetRegisteredEffects(effects, effectsCount, effectsReturned, effectsRegistered) {
        effectsReturnedMarshal := effectsReturned is VarRef ? "uint*" : "ptr"
        effectsRegisteredMarshal := effectsRegistered is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, Guid.Ptr, effects, "uint", effectsCount, effectsReturnedMarshal, effectsReturned, effectsRegisteredMarshal, effectsRegistered, "HRESULT")
        return result
    }

    /**
     * Retrieves the properties of an effect.
     * @remarks
     * The returned effect properties will have all the mutable properties for the effect set to a default of <b>NULL</b>, or an  empty value. 
     * 
     * <ul>
     * <li>Value types will be zero-filled.</li>
     * <li>Blob and string types will be zero-length.</li>
     * <li>Array types will have length 1 and the element of the array will conform to the previous rules.</li>
     * </ul>
     * This method cannot be used to return the properties for any effect not visible to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect">ID2D1DeviceContext::CreateEffect</a>.
     * @param {Pointer<Guid>} effectId Type: <b>REFCLSID</b>
     * 
     * The ID of the effect to retrieve properties from.
     * @returns {ID2D1Properties} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1properties">ID2D1Properties</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the property interface that can be used to query the metadata of the effect.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-geteffectproperties
     */
    GetEffectProperties(effectId) {
        result := ComCall(26, this, Guid.Ptr, effectId, "ptr*", &_properties := 0, "HRESULT")
        return ID2D1Properties(_properties)
    }

    Query(iid) {
        if (ID2D1Factory1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDevice := CallbackCreate(GetMethod(implObj, "CreateDevice"), flags, 3)
        this.vtbl.CreateStrokeStyle := CallbackCreate(GetMethod(implObj, "CreateStrokeStyle"), flags, 5)
        this.vtbl.CreatePathGeometry := CallbackCreate(GetMethod(implObj, "CreatePathGeometry"), flags, 2)
        this.vtbl.CreateDrawingStateBlock := CallbackCreate(GetMethod(implObj, "CreateDrawingStateBlock"), flags, 4)
        this.vtbl.CreateGdiMetafile := CallbackCreate(GetMethod(implObj, "CreateGdiMetafile"), flags, 3)
        this.vtbl.RegisterEffectFromStream := CallbackCreate(GetMethod(implObj, "RegisterEffectFromStream"), flags, 6)
        this.vtbl.RegisterEffectFromString := CallbackCreate(GetMethod(implObj, "RegisterEffectFromString"), flags, 6)
        this.vtbl.UnregisterEffect := CallbackCreate(GetMethod(implObj, "UnregisterEffect"), flags, 2)
        this.vtbl.GetRegisteredEffects := CallbackCreate(GetMethod(implObj, "GetRegisteredEffects"), flags, 5)
        this.vtbl.GetEffectProperties := CallbackCreate(GetMethod(implObj, "GetEffectProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDevice)
        CallbackFree(this.vtbl.CreateStrokeStyle)
        CallbackFree(this.vtbl.CreatePathGeometry)
        CallbackFree(this.vtbl.CreateDrawingStateBlock)
        CallbackFree(this.vtbl.CreateGdiMetafile)
        CallbackFree(this.vtbl.RegisterEffectFromStream)
        CallbackFree(this.vtbl.RegisterEffectFromString)
        CallbackFree(this.vtbl.UnregisterEffect)
        CallbackFree(this.vtbl.GetRegisteredEffects)
        CallbackFree(this.vtbl.GetEffectProperties)
    }
}
