#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDXGIDevice>} dxgiDevice 
     * @param {Pointer<ID2D1Device>} d2dDevice 
     * @returns {HRESULT} 
     */
    CreateDevice(dxgiDevice, d2dDevice) {
        result := ComCall(17, this, "ptr", dxgiDevice, "ptr", d2dDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_STROKE_STYLE_PROPERTIES1>} strokeStyleProperties 
     * @param {Pointer<Single>} dashes 
     * @param {Integer} dashesCount 
     * @param {Pointer<ID2D1StrokeStyle1>} strokeStyle 
     * @returns {HRESULT} 
     */
    CreateStrokeStyle(strokeStyleProperties, dashes, dashesCount, strokeStyle) {
        result := ComCall(18, this, "ptr", strokeStyleProperties, "float*", dashes, "uint", dashesCount, "ptr", strokeStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1PathGeometry1>} pathGeometry 
     * @returns {HRESULT} 
     */
    CreatePathGeometry(pathGeometry) {
        result := ComCall(19, this, "ptr", pathGeometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} drawingStateDescription 
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams 
     * @param {Pointer<ID2D1DrawingStateBlock1>} drawingStateBlock 
     * @returns {HRESULT} 
     */
    CreateDrawingStateBlock(drawingStateDescription, textRenderingParams, drawingStateBlock) {
        result := ComCall(20, this, "ptr", drawingStateDescription, "ptr", textRenderingParams, "ptr", drawingStateBlock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} metafileStream 
     * @param {Pointer<ID2D1GdiMetafile>} metafile 
     * @returns {HRESULT} 
     */
    CreateGdiMetafile(metafileStream, metafile) {
        result := ComCall(21, this, "ptr", metafileStream, "ptr", metafile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} classId 
     * @param {Pointer<IStream>} propertyXml 
     * @param {Pointer<D2D1_PROPERTY_BINDING>} bindings 
     * @param {Integer} bindingsCount 
     * @param {Pointer<PD2D1_EFFECT_FACTORY>} effectFactory 
     * @returns {HRESULT} 
     */
    RegisterEffectFromStream(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        result := ComCall(22, this, "ptr", classId, "ptr", propertyXml, "ptr", bindings, "uint", bindingsCount, "ptr", effectFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} classId 
     * @param {PWSTR} propertyXml 
     * @param {Pointer<D2D1_PROPERTY_BINDING>} bindings 
     * @param {Integer} bindingsCount 
     * @param {Pointer<PD2D1_EFFECT_FACTORY>} effectFactory 
     * @returns {HRESULT} 
     */
    RegisterEffectFromString(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        propertyXml := propertyXml is String ? StrPtr(propertyXml) : propertyXml

        result := ComCall(23, this, "ptr", classId, "ptr", propertyXml, "ptr", bindings, "uint", bindingsCount, "ptr", effectFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} classId 
     * @returns {HRESULT} 
     */
    UnregisterEffect(classId) {
        result := ComCall(24, this, "ptr", classId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effects 
     * @param {Integer} effectsCount 
     * @param {Pointer<UInt32>} effectsReturned 
     * @param {Pointer<UInt32>} effectsRegistered 
     * @returns {HRESULT} 
     */
    GetRegisteredEffects(effects, effectsCount, effectsReturned, effectsRegistered) {
        result := ComCall(25, this, "ptr", effects, "uint", effectsCount, "uint*", effectsReturned, "uint*", effectsRegistered, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effectId 
     * @param {Pointer<ID2D1Properties>} properties 
     * @returns {HRESULT} 
     */
    GetEffectProperties(effectId, properties) {
        result := ComCall(26, this, "ptr", effectId, "ptr", properties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
