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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGeometry", "GetGeometryLocal", "SetGeometryLocal", "GetGeometryLookup", "SetGeometryLookup", "GetAccessibilityShortDescription", "SetAccessibilityShortDescription", "GetAccessibilityLongDescription", "SetAccessibilityLongDescription", "GetSnapsToPixels", "SetSnapsToPixels", "GetStrokeBrush", "GetStrokeBrushLocal", "SetStrokeBrushLocal", "GetStrokeBrushLookup", "SetStrokeBrushLookup", "GetStrokeDashes", "GetStrokeDashCap", "SetStrokeDashCap", "GetStrokeDashOffset", "SetStrokeDashOffset", "GetStrokeStartLineCap", "SetStrokeStartLineCap", "GetStrokeEndLineCap", "SetStrokeEndLineCap", "GetStrokeLineJoin", "SetStrokeLineJoin", "GetStrokeMiterLimit", "SetStrokeMiterLimit", "GetStrokeThickness", "SetStrokeThickness", "GetFillBrush", "GetFillBrushLocal", "SetFillBrushLocal", "GetFillBrushLookup", "SetFillBrushLookup", "Clone"]

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometry
     */
    GetGeometry(geometry) {
        result := ComCall(30, this, "ptr*", geometry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGeometry>} geometry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometrylocal
     */
    GetGeometryLocal(geometry) {
        result := ComCall(31, this, "ptr*", geometry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMGeometry} geometry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal
     */
    SetGeometryLocal(geometry) {
        result := ComCall(32, this, "ptr", geometry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometrylookup
     */
    GetGeometryLookup(lookup) {
        result := ComCall(33, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup
     */
    SetGeometryLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(34, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} shortDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getaccessibilityshortdescription
     */
    GetAccessibilityShortDescription(shortDescription) {
        result := ComCall(35, this, "ptr", shortDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} shortDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setaccessibilityshortdescription
     */
    SetAccessibilityShortDescription(shortDescription) {
        shortDescription := shortDescription is String ? StrPtr(shortDescription) : shortDescription

        result := ComCall(36, this, "ptr", shortDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} longDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getaccessibilitylongdescription
     */
    GetAccessibilityLongDescription(longDescription) {
        result := ComCall(37, this, "ptr", longDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} longDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setaccessibilitylongdescription
     */
    SetAccessibilityLongDescription(longDescription) {
        longDescription := longDescription is String ? StrPtr(longDescription) : longDescription

        result := ComCall(38, this, "ptr", longDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} snapsToPixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getsnapstopixels
     */
    GetSnapsToPixels(snapsToPixels) {
        result := ComCall(39, this, "ptr", snapsToPixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} snapsToPixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setsnapstopixels
     */
    SetSnapsToPixels(snapsToPixels) {
        result := ComCall(40, this, "int", snapsToPixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrush
     */
    GetStrokeBrush(brush) {
        result := ComCall(41, this, "ptr*", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrushlocal
     */
    GetStrokeBrushLocal(brush) {
        result := ComCall(42, this, "ptr*", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMBrush} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal
     */
    SetStrokeBrushLocal(brush) {
        result := ComCall(43, this, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrushlookup
     */
    GetStrokeBrushLookup(lookup) {
        result := ComCall(44, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup
     */
    SetStrokeBrushLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(45, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDashCollection>} strokeDashes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashes
     */
    GetStrokeDashes(strokeDashes) {
        result := ComCall(46, this, "ptr*", strokeDashes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} strokeDashCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashcap
     */
    GetStrokeDashCap(strokeDashCap) {
        strokeDashCapMarshal := strokeDashCap is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, strokeDashCapMarshal, strokeDashCap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} strokeDashCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokedashcap
     */
    SetStrokeDashCap(strokeDashCap) {
        result := ComCall(48, this, "int", strokeDashCap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} strokeDashOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashoffset
     */
    GetStrokeDashOffset(strokeDashOffset) {
        strokeDashOffsetMarshal := strokeDashOffset is VarRef ? "float*" : "ptr"

        result := ComCall(49, this, strokeDashOffsetMarshal, strokeDashOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} strokeDashOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokedashoffset
     */
    SetStrokeDashOffset(strokeDashOffset) {
        result := ComCall(50, this, "float", strokeDashOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} strokeStartLineCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokestartlinecap
     */
    GetStrokeStartLineCap(strokeStartLineCap) {
        strokeStartLineCapMarshal := strokeStartLineCap is VarRef ? "int*" : "ptr"

        result := ComCall(51, this, strokeStartLineCapMarshal, strokeStartLineCap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} strokeStartLineCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokestartlinecap
     */
    SetStrokeStartLineCap(strokeStartLineCap) {
        result := ComCall(52, this, "int", strokeStartLineCap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} strokeEndLineCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokeendlinecap
     */
    GetStrokeEndLineCap(strokeEndLineCap) {
        strokeEndLineCapMarshal := strokeEndLineCap is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, strokeEndLineCapMarshal, strokeEndLineCap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} strokeEndLineCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokeendlinecap
     */
    SetStrokeEndLineCap(strokeEndLineCap) {
        result := ComCall(54, this, "int", strokeEndLineCap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} strokeLineJoin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokelinejoin
     */
    GetStrokeLineJoin(strokeLineJoin) {
        strokeLineJoinMarshal := strokeLineJoin is VarRef ? "int*" : "ptr"

        result := ComCall(55, this, strokeLineJoinMarshal, strokeLineJoin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} strokeLineJoin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokelinejoin
     */
    SetStrokeLineJoin(strokeLineJoin) {
        result := ComCall(56, this, "int", strokeLineJoin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} strokeMiterLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokemiterlimit
     */
    GetStrokeMiterLimit(strokeMiterLimit) {
        strokeMiterLimitMarshal := strokeMiterLimit is VarRef ? "float*" : "ptr"

        result := ComCall(57, this, strokeMiterLimitMarshal, strokeMiterLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} strokeMiterLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokemiterlimit
     */
    SetStrokeMiterLimit(strokeMiterLimit) {
        result := ComCall(58, this, "float", strokeMiterLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} strokeThickness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokethickness
     */
    GetStrokeThickness(strokeThickness) {
        strokeThicknessMarshal := strokeThickness is VarRef ? "float*" : "ptr"

        result := ComCall(59, this, strokeThicknessMarshal, strokeThickness, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} strokeThickness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokethickness
     */
    SetStrokeThickness(strokeThickness) {
        result := ComCall(60, this, "float", strokeThickness, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrush
     */
    GetFillBrush(brush) {
        result := ComCall(61, this, "ptr*", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrushlocal
     */
    GetFillBrushLocal(brush) {
        result := ComCall(62, this, "ptr*", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMBrush} brush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal
     */
    SetFillBrushLocal(brush) {
        result := ComCall(63, this, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrushlookup
     */
    GetFillBrushLookup(lookup) {
        result := ComCall(64, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup
     */
    SetFillBrushLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(65, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMPath>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-clone
     */
    Clone(path) {
        result := ComCall(66, this, "ptr*", path, "HRESULT")
        return result
    }
}
