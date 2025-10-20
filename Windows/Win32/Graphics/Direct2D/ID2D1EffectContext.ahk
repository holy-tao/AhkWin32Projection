#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Single>} dpiX 
     * @param {Pointer<Single>} dpiY 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDpi(dpiX, dpiY) {
        ComCall(3, this, "float*", dpiX, "float*", dpiY)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} effectId 
     * @param {Pointer<ID2D1Effect>} effect 
     * @returns {HRESULT} 
     */
    CreateEffect(effectId, effect) {
        result := ComCall(4, this, "ptr", effectId, "ptr", effect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} featureLevels 
     * @param {Integer} featureLevelsCount 
     * @param {Pointer<Int32>} maximumSupportedFeatureLevel 
     * @returns {HRESULT} 
     */
    GetMaximumSupportedFeatureLevel(featureLevels, featureLevelsCount, maximumSupportedFeatureLevel) {
        result := ComCall(5, this, "int*", featureLevels, "uint", featureLevelsCount, "int*", maximumSupportedFeatureLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Effect>} effect 
     * @param {Pointer<ID2D1TransformNode>} transformNode 
     * @returns {HRESULT} 
     */
    CreateTransformNodeFromEffect(effect, transformNode) {
        result := ComCall(6, this, "ptr", effect, "ptr", transformNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} numInputs 
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} blendDescription 
     * @param {Pointer<ID2D1BlendTransform>} transform 
     * @returns {HRESULT} 
     */
    CreateBlendTransform(numInputs, blendDescription, transform) {
        result := ComCall(7, this, "uint", numInputs, "ptr", blendDescription, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} extendModeX 
     * @param {Integer} extendModeY 
     * @param {Pointer<ID2D1BorderTransform>} transform 
     * @returns {HRESULT} 
     */
    CreateBorderTransform(extendModeX, extendModeY, transform) {
        result := ComCall(8, this, "int", extendModeX, "int", extendModeY, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} offset 
     * @param {Pointer<ID2D1OffsetTransform>} transform 
     * @returns {HRESULT} 
     */
    CreateOffsetTransform(offset, transform) {
        result := ComCall(9, this, "ptr", offset, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} outputRectangle 
     * @param {Pointer<ID2D1BoundsAdjustmentTransform>} transform 
     * @returns {HRESULT} 
     */
    CreateBoundsAdjustmentTransform(outputRectangle, transform) {
        result := ComCall(10, this, "ptr", outputRectangle, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @param {Pointer<Byte>} shaderBuffer 
     * @param {Integer} shaderBufferCount 
     * @returns {HRESULT} 
     */
    LoadPixelShader(shaderId, shaderBuffer, shaderBufferCount) {
        result := ComCall(11, this, "ptr", shaderId, "char*", shaderBuffer, "uint", shaderBufferCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<Byte>} shaderBuffer 
     * @param {Integer} shaderBufferCount 
     * @returns {HRESULT} 
     */
    LoadVertexShader(resourceId, shaderBuffer, shaderBufferCount) {
        result := ComCall(12, this, "ptr", resourceId, "char*", shaderBuffer, "uint", shaderBufferCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<Byte>} shaderBuffer 
     * @param {Integer} shaderBufferCount 
     * @returns {HRESULT} 
     */
    LoadComputeShader(resourceId, shaderBuffer, shaderBufferCount) {
        result := ComCall(13, this, "ptr", resourceId, "char*", shaderBuffer, "uint", shaderBufferCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} shaderId 
     * @returns {BOOL} 
     */
    IsShaderLoaded(shaderId) {
        result := ComCall(14, this, "ptr", shaderId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<D2D1_RESOURCE_TEXTURE_PROPERTIES>} resourceTextureProperties 
     * @param {Pointer<Byte>} data 
     * @param {Pointer<UInt32>} strides 
     * @param {Integer} dataSize 
     * @param {Pointer<ID2D1ResourceTexture>} resourceTexture 
     * @returns {HRESULT} 
     */
    CreateResourceTexture(resourceId, resourceTextureProperties, data, strides, dataSize, resourceTexture) {
        result := ComCall(15, this, "ptr", resourceId, "ptr", resourceTextureProperties, "char*", data, "uint*", strides, "uint", dataSize, "ptr", resourceTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<ID2D1ResourceTexture>} resourceTexture 
     * @returns {HRESULT} 
     */
    FindResourceTexture(resourceId, resourceTexture) {
        result := ComCall(16, this, "ptr", resourceId, "ptr", resourceTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_VERTEX_BUFFER_PROPERTIES>} vertexBufferProperties 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<D2D1_CUSTOM_VERTEX_BUFFER_PROPERTIES>} customVertexBufferProperties 
     * @param {Pointer<ID2D1VertexBuffer>} buffer 
     * @returns {HRESULT} 
     */
    CreateVertexBuffer(vertexBufferProperties, resourceId, customVertexBufferProperties, buffer) {
        result := ComCall(17, this, "ptr", vertexBufferProperties, "ptr", resourceId, "ptr", customVertexBufferProperties, "ptr", buffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} resourceId 
     * @param {Pointer<ID2D1VertexBuffer>} buffer 
     * @returns {HRESULT} 
     */
    FindVertexBuffer(resourceId, buffer) {
        result := ComCall(18, this, "ptr", resourceId, "ptr", buffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} space 
     * @param {Pointer<Byte>} profile 
     * @param {Integer} profileSize 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContext(space, profile, profileSize, colorContext) {
        result := ComCall(19, this, "int", space, "char*", profile, "uint", profileSize, "ptr", colorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContextFromFilename(filename, colorContext) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(20, this, "ptr", filename, "ptr", colorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICColorContext>} wicColorContext 
     * @param {Pointer<ID2D1ColorContext>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContextFromWicColorContext(wicColorContext, colorContext) {
        result := ComCall(21, this, "ptr", wicColorContext, "ptr", colorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} feature 
     * @param {Pointer} featureSupportData 
     * @param {Integer} featureSupportDataSize 
     * @returns {HRESULT} 
     */
    CheckFeatureSupport(feature, featureSupportData, featureSupportDataSize) {
        result := ComCall(22, this, "int", feature, "ptr", featureSupportData, "uint", featureSupportDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bufferPrecision 
     * @returns {BOOL} 
     */
    IsBufferPrecisionSupported(bufferPrecision) {
        result := ComCall(23, this, "int", bufferPrecision, "int")
        return result
    }
}
