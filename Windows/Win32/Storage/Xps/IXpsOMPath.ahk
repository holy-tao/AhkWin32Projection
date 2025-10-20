#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMVisual.ahk

/**
 * Describes a non-text visual item.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMPath    *newInterface;
  * 
  * // Note the implicit requirement that CoInitializeEx 
  * //  has previously been called from this thread.
  * 
  * hr = CoCreateInstance(
  *     __uuidof(XpsOMObjectFactory),
  *     NULL,
  *     CLSCTX_INPROC_SERVER,
  *     _uuidof(IXpsOMObjectFactory),
  *     reinterpret_cast<LPVOID*>(&xpsFactory)
  *     );
  * 
  * if (SUCCEEDED(hr))
  * {
  *     hr = xpsFactory->CreatePath (&newInterface);
  * 
  *     if (SUCCEEDED(hr))
  *     {
  *         // use newInterface
  * 
  *         newInterface->Release();
  *     }
  *     xpsFactory->Release();
  * }
  * else
  * {
  *     // evaluate HRESULT error returned in hr
  * }
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompath
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPath extends IXpsOMVisual{
    /**
     * The interface identifier for IXpsOMPath
     * @type {Guid}
     */
    static IID => Guid("{37d38bb6-3ee9-4110-9312-14b194163337}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     */
    GetGeometry(geometry) {
        result := ComCall(30, this, "ptr", geometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     */
    GetGeometryLocal(geometry) {
        result := ComCall(31, this, "ptr", geometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     */
    SetGeometryLocal(geometry) {
        result := ComCall(32, this, "ptr", geometry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     */
    GetGeometryLookup(lookup) {
        result := ComCall(33, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     */
    SetGeometryLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(34, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} shortDescription 
     * @returns {HRESULT} 
     */
    GetAccessibilityShortDescription(shortDescription) {
        result := ComCall(35, this, "ptr", shortDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} shortDescription 
     * @returns {HRESULT} 
     */
    SetAccessibilityShortDescription(shortDescription) {
        shortDescription := shortDescription is String ? StrPtr(shortDescription) : shortDescription

        result := ComCall(36, this, "ptr", shortDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} longDescription 
     * @returns {HRESULT} 
     */
    GetAccessibilityLongDescription(longDescription) {
        result := ComCall(37, this, "ptr", longDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} longDescription 
     * @returns {HRESULT} 
     */
    SetAccessibilityLongDescription(longDescription) {
        longDescription := longDescription is String ? StrPtr(longDescription) : longDescription

        result := ComCall(38, this, "ptr", longDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} snapsToPixels 
     * @returns {HRESULT} 
     */
    GetSnapsToPixels(snapsToPixels) {
        result := ComCall(39, this, "ptr", snapsToPixels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} snapsToPixels 
     * @returns {HRESULT} 
     */
    SetSnapsToPixels(snapsToPixels) {
        result := ComCall(40, this, "int", snapsToPixels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     */
    GetStrokeBrush(brush) {
        result := ComCall(41, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     */
    GetStrokeBrushLocal(brush) {
        result := ComCall(42, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     */
    SetStrokeBrushLocal(brush) {
        result := ComCall(43, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     */
    GetStrokeBrushLookup(lookup) {
        result := ComCall(44, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     */
    SetStrokeBrushLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(45, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDashCollection>} strokeDashes 
     * @returns {HRESULT} 
     */
    GetStrokeDashes(strokeDashes) {
        result := ComCall(46, this, "ptr", strokeDashes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} strokeDashCap 
     * @returns {HRESULT} 
     */
    GetStrokeDashCap(strokeDashCap) {
        result := ComCall(47, this, "int*", strokeDashCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} strokeDashCap 
     * @returns {HRESULT} 
     */
    SetStrokeDashCap(strokeDashCap) {
        result := ComCall(48, this, "int", strokeDashCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} strokeDashOffset 
     * @returns {HRESULT} 
     */
    GetStrokeDashOffset(strokeDashOffset) {
        result := ComCall(49, this, "float*", strokeDashOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} strokeDashOffset 
     * @returns {HRESULT} 
     */
    SetStrokeDashOffset(strokeDashOffset) {
        result := ComCall(50, this, "float", strokeDashOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} strokeStartLineCap 
     * @returns {HRESULT} 
     */
    GetStrokeStartLineCap(strokeStartLineCap) {
        result := ComCall(51, this, "int*", strokeStartLineCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} strokeStartLineCap 
     * @returns {HRESULT} 
     */
    SetStrokeStartLineCap(strokeStartLineCap) {
        result := ComCall(52, this, "int", strokeStartLineCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} strokeEndLineCap 
     * @returns {HRESULT} 
     */
    GetStrokeEndLineCap(strokeEndLineCap) {
        result := ComCall(53, this, "int*", strokeEndLineCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} strokeEndLineCap 
     * @returns {HRESULT} 
     */
    SetStrokeEndLineCap(strokeEndLineCap) {
        result := ComCall(54, this, "int", strokeEndLineCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} strokeLineJoin 
     * @returns {HRESULT} 
     */
    GetStrokeLineJoin(strokeLineJoin) {
        result := ComCall(55, this, "int*", strokeLineJoin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} strokeLineJoin 
     * @returns {HRESULT} 
     */
    SetStrokeLineJoin(strokeLineJoin) {
        result := ComCall(56, this, "int", strokeLineJoin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} strokeMiterLimit 
     * @returns {HRESULT} 
     */
    GetStrokeMiterLimit(strokeMiterLimit) {
        result := ComCall(57, this, "float*", strokeMiterLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} strokeMiterLimit 
     * @returns {HRESULT} 
     */
    SetStrokeMiterLimit(strokeMiterLimit) {
        result := ComCall(58, this, "float", strokeMiterLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} strokeThickness 
     * @returns {HRESULT} 
     */
    GetStrokeThickness(strokeThickness) {
        result := ComCall(59, this, "float*", strokeThickness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} strokeThickness 
     * @returns {HRESULT} 
     */
    SetStrokeThickness(strokeThickness) {
        result := ComCall(60, this, "float", strokeThickness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     */
    GetFillBrush(brush) {
        result := ComCall(61, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     */
    GetFillBrushLocal(brush) {
        result := ComCall(62, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     */
    SetFillBrushLocal(brush) {
        result := ComCall(63, this, "ptr", brush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     */
    GetFillBrushLookup(lookup) {
        result := ComCall(64, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     */
    SetFillBrushLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(65, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPath>} path 
     * @returns {HRESULT} 
     */
    Clone(path) {
        result := ComCall(66, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
