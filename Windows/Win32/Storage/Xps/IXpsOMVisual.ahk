#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMBrush.ahk
#Include ..\..\System\Com\IUri.ahk
#Include .\IXpsOMShareable.ahk

/**
 * The base interface for path, canvas, and glyph interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMVisual extends IXpsOMShareable{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransform", "GetTransformLocal", "SetTransformLocal", "GetTransformLookup", "SetTransformLookup", "GetClipGeometry", "GetClipGeometryLocal", "SetClipGeometryLocal", "GetClipGeometryLookup", "SetClipGeometryLookup", "GetOpacity", "SetOpacity", "GetOpacityMaskBrush", "GetOpacityMaskBrushLocal", "SetOpacityMaskBrushLocal", "GetOpacityMaskBrushLookup", "SetOpacityMaskBrushLookup", "GetName", "SetName", "GetIsHyperlinkTarget", "SetIsHyperlinkTarget", "GetHyperlinkNavigateUri", "SetHyperlinkNavigateUri", "GetLanguage", "SetLanguage"]

    /**
     * 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gettransform
     */
    GetTransform() {
        result := ComCall(5, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IXpsOMMatrixTransform(matrixTransform)
    }

    /**
     * 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gettransformlocal
     */
    GetTransformLocal() {
        result := ComCall(6, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IXpsOMMatrixTransform(matrixTransform)
    }

    /**
     * 
     * @param {IXpsOMMatrixTransform} matrixTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal
     */
    SetTransformLocal(matrixTransform) {
        result := ComCall(7, this, "ptr", matrixTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gettransformlookup
     */
    GetTransformLookup() {
        result := ComCall(8, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(9, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getclipgeometry
     */
    GetClipGeometry() {
        result := ComCall(10, this, "ptr*", &clipGeometry := 0, "HRESULT")
        return IXpsOMGeometry(clipGeometry)
    }

    /**
     * 
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getclipgeometrylocal
     */
    GetClipGeometryLocal() {
        result := ComCall(11, this, "ptr*", &clipGeometry := 0, "HRESULT")
        return IXpsOMGeometry(clipGeometry)
    }

    /**
     * 
     * @param {IXpsOMGeometry} clipGeometry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal
     */
    SetClipGeometryLocal(clipGeometry) {
        result := ComCall(12, this, "ptr", clipGeometry, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getclipgeometrylookup
     */
    GetClipGeometryLookup() {
        result := ComCall(13, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup
     */
    SetClipGeometryLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(14, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacity
     */
    GetOpacity() {
        result := ComCall(15, this, "float*", &opacity := 0, "HRESULT")
        return opacity
    }

    /**
     * 
     * @param {Float} opacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacity
     */
    SetOpacity(opacity) {
        result := ComCall(16, this, "float", opacity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacitymaskbrush
     */
    GetOpacityMaskBrush() {
        result := ComCall(17, this, "ptr*", &opacityMaskBrush := 0, "HRESULT")
        return IXpsOMBrush(opacityMaskBrush)
    }

    /**
     * 
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacitymaskbrushlocal
     */
    GetOpacityMaskBrushLocal() {
        result := ComCall(18, this, "ptr*", &opacityMaskBrush := 0, "HRESULT")
        return IXpsOMBrush(opacityMaskBrush)
    }

    /**
     * 
     * @param {IXpsOMBrush} opacityMaskBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal
     */
    SetOpacityMaskBrushLocal(opacityMaskBrush) {
        result := ComCall(19, this, "ptr", opacityMaskBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacitymaskbrushlookup
     */
    GetOpacityMaskBrushLookup() {
        result := ComCall(20, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup
     */
    SetOpacityMaskBrushLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(21, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getname
     */
    GetName() {
        result := ComCall(22, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(23, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getishyperlinktarget
     */
    GetIsHyperlinkTarget() {
        result := ComCall(24, this, "int*", &isHyperlink := 0, "HRESULT")
        return isHyperlink
    }

    /**
     * 
     * @param {BOOL} isHyperlink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setishyperlinktarget
     */
    SetIsHyperlinkTarget(isHyperlink) {
        result := ComCall(25, this, "int", isHyperlink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUri} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gethyperlinknavigateuri
     */
    GetHyperlinkNavigateUri() {
        result := ComCall(26, this, "ptr*", &hyperlinkUri := 0, "HRESULT")
        return IUri(hyperlinkUri)
    }

    /**
     * 
     * @param {IUri} hyperlinkUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-sethyperlinknavigateuri
     */
    SetHyperlinkNavigateUri(hyperlinkUri) {
        result := ComCall(27, this, "ptr", hyperlinkUri, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getlanguage
     */
    GetLanguage() {
        result := ComCall(28, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * 
     * @param {PWSTR} language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(29, this, "ptr", language, "HRESULT")
        return result
    }
}
