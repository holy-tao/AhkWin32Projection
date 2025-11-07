#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMBrush.ahk
#Include .\IXpsOMDashCollection.ahk
#Include .\IXpsOMPath.ahk
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
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometry
     */
    GetGeometry() {
        result := ComCall(30, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
    }

    /**
     * 
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometrylocal
     */
    GetGeometryLocal() {
        result := ComCall(31, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometrylookup
     */
    GetGeometryLookup() {
        result := ComCall(33, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getaccessibilityshortdescription
     */
    GetAccessibilityShortDescription() {
        result := ComCall(35, this, "ptr*", &shortDescription := 0, "HRESULT")
        return shortDescription
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getaccessibilitylongdescription
     */
    GetAccessibilityLongDescription() {
        result := ComCall(37, this, "ptr*", &longDescription := 0, "HRESULT")
        return longDescription
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getsnapstopixels
     */
    GetSnapsToPixels() {
        result := ComCall(39, this, "int*", &snapsToPixels := 0, "HRESULT")
        return snapsToPixels
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
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrush
     */
    GetStrokeBrush() {
        result := ComCall(41, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
    }

    /**
     * 
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrushlocal
     */
    GetStrokeBrushLocal() {
        result := ComCall(42, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrushlookup
     */
    GetStrokeBrushLookup() {
        result := ComCall(44, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
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
     * @returns {IXpsOMDashCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashes
     */
    GetStrokeDashes() {
        result := ComCall(46, this, "ptr*", &strokeDashes := 0, "HRESULT")
        return IXpsOMDashCollection(strokeDashes)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashcap
     */
    GetStrokeDashCap() {
        result := ComCall(47, this, "int*", &strokeDashCap := 0, "HRESULT")
        return strokeDashCap
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashoffset
     */
    GetStrokeDashOffset() {
        result := ComCall(49, this, "float*", &strokeDashOffset := 0, "HRESULT")
        return strokeDashOffset
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokestartlinecap
     */
    GetStrokeStartLineCap() {
        result := ComCall(51, this, "int*", &strokeStartLineCap := 0, "HRESULT")
        return strokeStartLineCap
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokeendlinecap
     */
    GetStrokeEndLineCap() {
        result := ComCall(53, this, "int*", &strokeEndLineCap := 0, "HRESULT")
        return strokeEndLineCap
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokelinejoin
     */
    GetStrokeLineJoin() {
        result := ComCall(55, this, "int*", &strokeLineJoin := 0, "HRESULT")
        return strokeLineJoin
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokemiterlimit
     */
    GetStrokeMiterLimit() {
        result := ComCall(57, this, "float*", &strokeMiterLimit := 0, "HRESULT")
        return strokeMiterLimit
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokethickness
     */
    GetStrokeThickness() {
        result := ComCall(59, this, "float*", &strokeThickness := 0, "HRESULT")
        return strokeThickness
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
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrush
     */
    GetFillBrush() {
        result := ComCall(61, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
    }

    /**
     * 
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrushlocal
     */
    GetFillBrushLocal() {
        result := ComCall(62, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrushlookup
     */
    GetFillBrushLookup() {
        result := ComCall(64, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
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
     * @returns {IXpsOMPath} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-clone
     */
    Clone() {
        result := ComCall(66, this, "ptr*", &path := 0, "HRESULT")
        return IXpsOMPath(path)
    }
}
