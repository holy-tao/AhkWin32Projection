#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device.ahk
#Include .\ID2D1StrokeStyle1.ahk
#Include .\ID2D1PathGeometry1.ahk
#Include .\ID2D1DrawingStateBlock1.ahk
#Include .\ID2D1GdiMetafile.ahk
#Include .\ID2D1Properties.ahk
#Include .\ID2D1Factory.ahk

/**
 * Creates Direct2D resources.
 * @remarks
 * 
 * The <b>ID2D1Factory1</b> interface is used to create devices, register and unregister effects, and enumerate effects properties. Effects are registered and unregistered globally. The registration APIs are placed on this interface for convenience.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1factory1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory1 extends ID2D1Factory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory1
     * @type {Guid}
     */
    static IID => Guid("{bb12d362-daee-4b9a-aa1d-14ba401cfa1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice", "CreateStrokeStyle", "CreatePathGeometry", "CreateDrawingStateBlock", "CreateGdiMetafile", "RegisterEffectFromStream", "RegisterEffectFromString", "UnregisterEffect", "GetRegisteredEffects", "GetEffectProperties"]

    /**
     * Creates a ID2D1Device object.
     * @param {IDXGIDevice} dxgiDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> object used when creating  the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>.
     * @returns {ID2D1Device} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>**</b>
     * 
     * The requested <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-createdevice
     */
    CreateDevice(dxgiDevice) {
        result := ComCall(17, this, "ptr", dxgiDevice, "ptr*", &d2dDevice := 0, "HRESULT")
        return ID2D1Device(d2dDevice)
    }

    /**
     * 
     * @param {Pointer<D2D1_STROKE_STYLE_PROPERTIES1>} strokeStyleProperties 
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @returns {ID2D1StrokeStyle1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createstrokestyle(constd2d1_stroke_style_properties1_constfloat_uint32_id2d1strokestyle1)
     */
    CreateStrokeStyle(strokeStyleProperties, dashes, dashesCount) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, "ptr", strokeStyleProperties, dashesMarshal, dashes, "uint", dashesCount, "ptr*", &strokeStyle := 0, "HRESULT")
        return ID2D1StrokeStyle1(strokeStyle)
    }

    /**
     * Creates an ID2D1PathGeometry1 object.
     * @returns {ID2D1PathGeometry1} Type: <b>const **</b>
     * 
     * When this method returns, contains the address of a pointer to the newly created path geometry.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-createpathgeometry
     */
    CreatePathGeometry() {
        result := ComCall(19, this, "ptr*", &pathGeometry := 0, "HRESULT")
        return ID2D1PathGeometry1(pathGeometry)
    }

    /**
     * 
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} drawingStateDescription 
     * @param {IDWriteRenderingParams} textRenderingParams 
     * @returns {ID2D1DrawingStateBlock1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createdrawingstateblock(constd2d1_drawing_state_description1_idwriterenderingparams_id2d1drawingstateblock1)
     */
    CreateDrawingStateBlock(drawingStateDescription, textRenderingParams) {
        result := ComCall(20, this, "ptr", drawingStateDescription, "ptr", textRenderingParams, "ptr*", &drawingStateBlock := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-creategdimetafile
     */
    CreateGdiMetafile(metafileStream) {
        result := ComCall(21, this, "ptr", metafileStream, "ptr*", &metafile := 0, "HRESULT")
        return ID2D1GdiMetafile(metafile)
    }

    /**
     * Registers an effect within the factory instance with the property XML specified as a stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstream
     */
    RegisterEffectFromStream(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        result := ComCall(22, this, "ptr", classId, "ptr", propertyXml, "ptr", bindings, "uint", bindingsCount, "ptr", effectFactory, "HRESULT")
        return result
    }

    /**
     * Registers an effect within the factory instance with the property XML specified as a string.
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring
     */
    RegisterEffectFromString(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        propertyXml := propertyXml is String ? StrPtr(propertyXml) : propertyXml

        result := ComCall(23, this, "ptr", classId, "ptr", propertyXml, "ptr", bindings, "uint", bindingsCount, "ptr", effectFactory, "HRESULT")
        return result
    }

    /**
     * Unregisters an effect within the factory instance that corresponds to the classId provided.
     * @param {Pointer<Guid>} classId Type: <b>REFCLSID</b>
     * 
     * The identifier of the effect to be unregistered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * D2DERR_EFFECT_IS_NOT_REGISTERED if the effect is not registered, S_OK otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-unregistereffect
     */
    UnregisterEffect(classId) {
        result := ComCall(24, this, "ptr", classId, "HRESULT")
        return result
    }

    /**
     * Returns the class IDs of the currently registered effects and global effects on this factory.
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-getregisteredeffects
     */
    GetRegisteredEffects(effects, effectsCount, effectsReturned, effectsRegistered) {
        effectsReturnedMarshal := effectsReturned is VarRef ? "uint*" : "ptr"
        effectsRegisteredMarshal := effectsRegistered is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr", effects, "uint", effectsCount, effectsReturnedMarshal, effectsReturned, effectsRegisteredMarshal, effectsRegistered, "HRESULT")
        return result
    }

    /**
     * Retrieves the properties of an effect.
     * @param {Pointer<Guid>} effectId Type: <b>REFCLSID</b>
     * 
     * The ID of the effect to retrieve properties from.
     * @returns {ID2D1Properties} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1properties">ID2D1Properties</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the property interface that can be used to query the metadata of the effect.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1factory1-geteffectproperties
     */
    GetEffectProperties(effectId) {
        result := ComCall(26, this, "ptr", effectId, "ptr*", &properties := 0, "HRESULT")
        return ID2D1Properties(properties)
    }
}
