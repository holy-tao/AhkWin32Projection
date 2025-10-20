#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMShareable.ahk

/**
 * The base interface for path, canvas, and glyph interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMVisual extends IXpsOMShareable{
    /**
     * The interface identifier for IXpsOMVisual
     * @type {Guid}
     */
    static IID => Guid("{bc3e7333-fb0b-4af3-a819-0b4eaad0d2fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     */
    GetTransform(matrixTransform) {
        result := ComCall(5, this, "ptr", matrixTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     */
    GetTransformLocal(matrixTransform) {
        result := ComCall(6, this, "ptr", matrixTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     */
    SetTransformLocal(matrixTransform) {
        result := ComCall(7, this, "ptr", matrixTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     */
    GetTransformLookup(key) {
        result := ComCall(8, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(9, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} clipGeometry 
     * @returns {HRESULT} 
     */
    GetClipGeometry(clipGeometry) {
        result := ComCall(10, this, "ptr", clipGeometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} clipGeometry 
     * @returns {HRESULT} 
     */
    GetClipGeometryLocal(clipGeometry) {
        result := ComCall(11, this, "ptr", clipGeometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} clipGeometry 
     * @returns {HRESULT} 
     */
    SetClipGeometryLocal(clipGeometry) {
        result := ComCall(12, this, "ptr", clipGeometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     */
    GetClipGeometryLookup(key) {
        result := ComCall(13, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     */
    SetClipGeometryLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(14, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} opacity 
     * @returns {HRESULT} 
     */
    GetOpacity(opacity) {
        result := ComCall(15, this, "float*", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     */
    SetOpacity(opacity) {
        result := ComCall(16, this, "float", opacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} opacityMaskBrush 
     * @returns {HRESULT} 
     */
    GetOpacityMaskBrush(opacityMaskBrush) {
        result := ComCall(17, this, "ptr", opacityMaskBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} opacityMaskBrush 
     * @returns {HRESULT} 
     */
    GetOpacityMaskBrushLocal(opacityMaskBrush) {
        result := ComCall(18, this, "ptr", opacityMaskBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} opacityMaskBrush 
     * @returns {HRESULT} 
     */
    SetOpacityMaskBrushLocal(opacityMaskBrush) {
        result := ComCall(19, this, "ptr", opacityMaskBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     */
    GetOpacityMaskBrushLookup(key) {
        result := ComCall(20, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     */
    SetOpacityMaskBrushLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(21, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(22, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(23, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isHyperlink 
     * @returns {HRESULT} 
     */
    GetIsHyperlinkTarget(isHyperlink) {
        result := ComCall(24, this, "ptr", isHyperlink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isHyperlink 
     * @returns {HRESULT} 
     */
    SetIsHyperlinkTarget(isHyperlink) {
        result := ComCall(25, this, "int", isHyperlink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} hyperlinkUri 
     * @returns {HRESULT} 
     */
    GetHyperlinkNavigateUri(hyperlinkUri) {
        result := ComCall(26, this, "ptr", hyperlinkUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} hyperlinkUri 
     * @returns {HRESULT} 
     */
    SetHyperlinkNavigateUri(hyperlinkUri) {
        result := ComCall(27, this, "ptr", hyperlinkUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     */
    GetLanguage(language) {
        result := ComCall(28, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} language 
     * @returns {HRESULT} 
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(29, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
