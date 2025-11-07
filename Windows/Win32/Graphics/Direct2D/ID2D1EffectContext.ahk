#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Effect.ahk
#Include .\ID2D1TransformNode.ahk
#Include .\ID2D1BlendTransform.ahk
#Include .\ID2D1BorderTransform.ahk
#Include .\ID2D1OffsetTransform.ahk
#Include .\ID2D1BoundsAdjustmentTransform.ahk
#Include .\ID2D1ResourceTexture.ahk
#Include .\ID2D1VertexBuffer.ahk
#Include .\ID2D1ColorContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides factory methods and other state management for effect and transform authors.
 * @remarks
 * 
 * This interface  is passed to an effect implementation through the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize">ID2D1EffectImpl::Initialize</a> method. In order to prevent applications casually gaining access to this interface, and to separate reference counts between the public and private interfaces, it is not possible to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> between the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> and the <b>ID2D1EffectContext</b>.
 * 
 * Each call to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize">ID2D1Effect::Initialize</a> will be provided a different <b>ID2D1EffectContext</b> interface. This interface tracks resource allocations for the effect. When the effect is released, the corresponding allocations will also be released.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1effectcontext
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1EffectContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1EffectContext
     * @type {Guid}
     */
    static IID => Guid("{3d9f916b-27dc-4ad7-b4f1-64945340f563}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDpi", "CreateEffect", "GetMaximumSupportedFeatureLevel", "CreateTransformNodeFromEffect", "CreateBlendTransform", "CreateBorderTransform", "CreateOffsetTransform", "CreateBoundsAdjustmentTransform", "LoadPixelShader", "LoadVertexShader", "LoadComputeShader", "IsShaderLoaded", "CreateResourceTexture", "FindResourceTexture", "CreateVertexBuffer", "FindVertexBuffer", "CreateColorContext", "CreateColorContextFromFilename", "CreateColorContextFromWicColorContext", "CheckFeatureSupport", "IsBufferPrecisionSupported"]

    /**
     * 
     * @param {Pointer<Float>} dpiX 
     * @param {Pointer<Float>} dpiY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(3, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * 
     * @param {Pointer<Guid>} effectId 
     * @returns {ID2D1Effect} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createeffect
     */
    CreateEffect(effectId) {
        result := ComCall(4, this, "ptr", effectId, "ptr*", &effect := 0, "HRESULT")
        return ID2D1Effect(effect)
    }

    /**
     * 
     * @param {Pointer<Integer>} featureLevels 
     * @param {Integer} featureLevelsCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-getmaximumsupportedfeaturelevel
     */
    GetMaximumSupportedFeatureLevel(featureLevels, featureLevelsCount) {
        featureLevelsMarshal := featureLevels is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, featureLevelsMarshal, featureLevels, "uint", featureLevelsCount, "int*", &maximumSupportedFeatureLevel := 0, "HRESULT")
        return maximumSupportedFeatureLevel
    }

    /**
     * 
     * @param {ID2D1Effect} effect 
     * @returns {ID2D1TransformNode} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createtransformnodefromeffect
     */
    CreateTransformNodeFromEffect(effect) {
        result := ComCall(6, this, "ptr", effect, "ptr*", &transformNode := 0, "HRESULT")
        return ID2D1TransformNode(transformNode)
    }

    /**
     * 
     * @param {Integer} numInputs 
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} blendDescription 
     * @returns {ID2D1BlendTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createblendtransform
     */
    CreateBlendTransform(numInputs, blendDescription) {
        result := ComCall(7, this, "uint", numInputs, "ptr", blendDescription, "ptr*", &transform := 0, "HRESULT")
        return ID2D1BlendTransform(transform)
    }

    /**
     * 
     * @param {Integer} extendModeX 
     * @param {Integer} extendModeY 
     * @returns {ID2D1BorderTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createbordertransform
     */
    CreateBorderTransform(extendModeX, extendModeY) {
        result := ComCall(8, this, "int", extendModeX, "int", extendModeY, "ptr*", &transform := 0, "HRESULT")
        return ID2D1BorderTransform(transform)
    }

    /**
     * 
     * @param {POINT} offset 
     * @returns {ID2D1OffsetTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createoffsettransform
     */
    CreateOffsetTransform(offset) {
        result := ComCall(9, this, "ptr", offset, "ptr*", &transform := 0, "HRESULT")
        return ID2D1OffsetTransform(transform)
    }

    /**
     * 
     * @param {Pointer<RECT>} outputRectangle 
     * @returns {ID2D1BoundsAdjustmentTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createboundsadjustmenttransform
     */
    CreateBoundsAdjustmentTransform(outputRectangle) {
        result := ComCall(10, this, "ptr", outputRectangle, "ptr*", &transform := 0, "HRESULT")
        return ID2D1BoundsAdjustmentTransform(transform)
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @param {Pointer<Integer>} shaderBuffer 
     * @param {Integer} shaderBufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadpixelshader
     */
    LoadPixelShader(shaderId, shaderBuffer, shaderBufferCount) {
        shaderBufferMarshal := shaderBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "ptr", shaderId, shaderBufferMarshal, shaderBuffer, "uint", shaderBufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<Integer>} shaderBuffer 
     * @param {Integer} shaderBufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadvertexshader
     */
    LoadVertexShader(resourceId, shaderBuffer, shaderBufferCount) {
        shaderBufferMarshal := shaderBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, "ptr", resourceId, shaderBufferMarshal, shaderBuffer, "uint", shaderBufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<Integer>} shaderBuffer 
     * @param {Integer} shaderBufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-loadcomputeshader
     */
    LoadComputeShader(resourceId, shaderBuffer, shaderBufferCount) {
        shaderBufferMarshal := shaderBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "ptr", resourceId, shaderBufferMarshal, shaderBuffer, "uint", shaderBufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-isshaderloaded
     */
    IsShaderLoaded(shaderId) {
        result := ComCall(14, this, "ptr", shaderId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<D2D1_RESOURCE_TEXTURE_PROPERTIES>} resourceTextureProperties 
     * @param {Pointer<Integer>} data 
     * @param {Pointer<Integer>} strides 
     * @param {Integer} dataSize 
     * @returns {ID2D1ResourceTexture} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createresourcetexture
     */
    CreateResourceTexture(resourceId, resourceTextureProperties, data, strides, dataSize) {
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", resourceId, "ptr", resourceTextureProperties, dataMarshal, data, stridesMarshal, strides, "uint", dataSize, "ptr*", &resourceTexture := 0, "HRESULT")
        return ID2D1ResourceTexture(resourceTexture)
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @returns {ID2D1ResourceTexture} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-findresourcetexture
     */
    FindResourceTexture(resourceId) {
        result := ComCall(16, this, "ptr", resourceId, "ptr*", &resourceTexture := 0, "HRESULT")
        return ID2D1ResourceTexture(resourceTexture)
    }

    /**
     * 
     * @param {Pointer<D2D1_VERTEX_BUFFER_PROPERTIES>} vertexBufferProperties 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES>} customVertexBufferProperties 
     * @returns {ID2D1VertexBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createvertexbuffer
     */
    CreateVertexBuffer(vertexBufferProperties, resourceId, customVertexBufferProperties) {
        result := ComCall(17, this, "ptr", vertexBufferProperties, "ptr", resourceId, "ptr", customVertexBufferProperties, "ptr*", &buffer := 0, "HRESULT")
        return ID2D1VertexBuffer(buffer)
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @returns {ID2D1VertexBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-findvertexbuffer
     */
    FindVertexBuffer(resourceId) {
        result := ComCall(18, this, "ptr", resourceId, "ptr*", &buffer := 0, "HRESULT")
        return ID2D1VertexBuffer(buffer)
    }

    /**
     * 
     * @param {Integer} space 
     * @param {Pointer<Integer>} profile 
     * @param {Integer} profileSize 
     * @returns {ID2D1ColorContext} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createcolorcontext
     */
    CreateColorContext(space, profile, profileSize) {
        profileMarshal := profile is VarRef ? "char*" : "ptr"

        result := ComCall(19, this, "int", space, profileMarshal, profile, "uint", profileSize, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @returns {ID2D1ColorContext} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createcolorcontextfromfilename
     */
    CreateColorContextFromFilename(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(20, this, "ptr", filename, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * 
     * @param {IWICColorContext} wicColorContext 
     * @returns {ID2D1ColorContext} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-createcolorcontextfromwiccolorcontext
     */
    CreateColorContextFromWicColorContext(wicColorContext) {
        result := ComCall(21, this, "ptr", wicColorContext, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * 
     * @param {Integer} feature 
     * @param {Pointer} featureSupportData 
     * @param {Integer} featureSupportDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-checkfeaturesupport
     */
    CheckFeatureSupport(feature, featureSupportData, featureSupportDataSize) {
        result := ComCall(22, this, "int", feature, "ptr", featureSupportData, "uint", featureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bufferPrecision 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-isbufferprecisionsupported
     */
    IsBufferPrecisionSupported(bufferPrecision) {
        result := ComCall(23, this, "int", bufferPrecision, "int")
        return result
    }
}
