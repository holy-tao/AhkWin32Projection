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
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {ID2D1Device} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createdevice
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
     * 
     * @returns {ID2D1PathGeometry1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-createpathgeometry
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
     * 
     * @param {IStream} metafileStream 
     * @returns {ID2D1GdiMetafile} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-creategdimetafile
     */
    CreateGdiMetafile(metafileStream) {
        result := ComCall(21, this, "ptr", metafileStream, "ptr*", &metafile := 0, "HRESULT")
        return ID2D1GdiMetafile(metafile)
    }

    /**
     * 
     * @param {Pointer<Guid>} classId 
     * @param {IStream} propertyXml 
     * @param {Pointer<D2D1_PROPERTY_BINDING>} bindings 
     * @param {Integer} bindingsCount 
     * @param {Pointer<PD2D1_EFFECT_FACTORY>} effectFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstream
     */
    RegisterEffectFromStream(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        result := ComCall(22, this, "ptr", classId, "ptr", propertyXml, "ptr", bindings, "uint", bindingsCount, "ptr", effectFactory, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring
     */
    RegisterEffectFromString(classId, propertyXml, bindings, bindingsCount, effectFactory) {
        propertyXml := propertyXml is String ? StrPtr(propertyXml) : propertyXml

        result := ComCall(23, this, "ptr", classId, "ptr", propertyXml, "ptr", bindings, "uint", bindingsCount, "ptr", effectFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} classId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-unregistereffect
     */
    UnregisterEffect(classId) {
        result := ComCall(24, this, "ptr", classId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effects 
     * @param {Integer} effectsCount 
     * @param {Pointer<Integer>} effectsReturned 
     * @param {Pointer<Integer>} effectsRegistered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-getregisteredeffects
     */
    GetRegisteredEffects(effects, effectsCount, effectsReturned, effectsRegistered) {
        effectsReturnedMarshal := effectsReturned is VarRef ? "uint*" : "ptr"
        effectsRegisteredMarshal := effectsRegistered is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr", effects, "uint", effectsCount, effectsReturnedMarshal, effectsReturned, effectsRegisteredMarshal, effectsRegistered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effectId 
     * @returns {ID2D1Properties} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1factory1-geteffectproperties
     */
    GetEffectProperties(effectId) {
        result := ComCall(26, this, "ptr", effectId, "ptr*", &properties := 0, "HRESULT")
        return ID2D1Properties(properties)
    }
}
