#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\Point.ahk" { Point }
#Import ".\GpAdjustableArrowCap.ahk" { GpAdjustableArrowCap }
#Import ".\GpHatch.ahk" { GpHatch }
#Import ".\LineJoin.ahk" { LineJoin }
#Import ".\EmfType.ahk" { EmfType }
#Import ".\CombineMode.ahk" { CombineMode }
#Import ".\MetafileFrameUnit.ahk" { MetafileFrameUnit }
#Import ".\GdiplusAbort.ahk" { GdiplusAbort }
#Import ".\ImageType.ahk" { ImageType }
#Import ".\GpPen.ahk" { GpPen }
#Import ".\CompositingMode.ahk" { CompositingMode }
#Import ".\BrushType.ahk" { BrushType }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\GpCustomLineCap.ahk" { GpCustomLineCap }
#Import ".\PenAlignment.ahk" { PenAlignment }
#Import ".\WarpMode.ahk" { WarpMode }
#Import ".\GdiplusStartupInput.ahk" { GdiplusStartupInput }
#Import "..\Gdi\HRGN.ahk" { HRGN }
#Import ".\PathData.ahk" { PathData }
#Import ".\ColorMatrix.ahk" { ColorMatrix }
#Import ".\TextRenderingHint.ahk" { TextRenderingHint }
#Import "..\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\Gdi\HDC.ahk" { HDC }
#Import ".\PointF.ahk" { PointF }
#Import ".\PixelOffsetMode.ahk" { PixelOffsetMode }
#Import ".\RectF.ahk" { RectF }
#Import ".\CompositingQuality.ahk" { CompositingQuality }
#Import ".\CustomLineCapType.ahk" { CustomLineCapType }
#Import ".\CGpEffect.ahk" { CGpEffect }
#Import ".\EncoderParameters.ahk" { EncoderParameters }
#Import ".\Unit.ahk" { Unit }
#Import ".\GpPathGradient.ahk" { GpPathGradient }
#Import ".\GdiplusStartupOutput.ahk" { GdiplusStartupOutput }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ColorAdjustType.ahk" { ColorAdjustType }
#Import ".\HatchStyle.ahk" { HatchStyle }
#Import ".\FlushIntention.ahk" { FlushIntention }
#Import ".\MetafileHeader.ahk" { MetafileHeader }
#Import ".\WrapMode.ahk" { WrapMode }
#Import ".\GpImage.ahk" { GpImage }
#Import ".\StringTrimming.ahk" { StringTrimming }
#Import ".\DitherType.ahk" { DitherType }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\Status.ahk" { Status }
#Import "..\Gdi\HMETAFILE.ahk" { HMETAFILE }
#Import ".\ImageItemData.ahk" { ImageItemData }
#Import ".\PaletteType.ahk" { PaletteType }
#Import "..\Gdi\HENHMETAFILE.ahk" { HENHMETAFILE }
#Import ".\GpTestControlEnum.ahk" { GpTestControlEnum }
#Import ".\GpCachedBitmap.ahk" { GpCachedBitmap }
#Import ".\ColorMap.ahk" { ColorMap }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PropertyItem.ahk" { PropertyItem }
#Import ".\GpStringFormat.ahk" { GpStringFormat }
#Import ".\MatrixOrder.ahk" { MatrixOrder }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\GpPathIterator.ahk" { GpPathIterator }
#Import ".\CoordinateSpace.ahk" { CoordinateSpace }
#Import ".\LinearGradientMode.ahk" { LinearGradientMode }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\GpTexture.ahk" { GpTexture }
#Import ".\GpRegion.ahk" { GpRegion }
#Import ".\PenType.ahk" { PenType }
#Import ".\FillMode.ahk" { FillMode }
#Import ".\GpFontFamily.ahk" { GpFontFamily }
#Import ".\EmfPlusRecordType.ahk" { EmfPlusRecordType }
#Import "..\Gdi\LOGFONTA.ahk" { LOGFONTA }
#Import "..\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ColorMatrixFlags.ahk" { ColorMatrixFlags }
#Import ".\GpSolidFill.ahk" { GpSolidFill }
#Import ".\GpPath.ahk" { GpPath }
#Import ".\SmoothingMode.ahk" { SmoothingMode }
#Import ".\DashStyle.ahk" { DashStyle }
#Import ".\ColorPalette.ahk" { ColorPalette }
#Import ".\GpImageAttributes.ahk" { GpImageAttributes }
#Import ".\GpFont.ahk" { GpFont }
#Import ".\DashCap.ahk" { DashCap }
#Import ".\BitmapData.ahk" { BitmapData }
#Import ".\GpLineGradient.ahk" { GpLineGradient }
#Import ".\StringDigitSubstitute.ahk" { StringDigitSubstitute }
#Import ".\HistogramFormat.ahk" { HistogramFormat }
#Import ".\GpFontCollection.ahk" { GpFontCollection }
#Import ".\WmfPlaceableFileHeader.ahk" { WmfPlaceableFileHeader }
#Import ".\Rect.ahk" { Rect as Rect_struct }
#Import ".\ColorChannelFlags.ahk" { ColorChannelFlags }
#Import "..\Gdi\HPALETTE.ahk" { HPALETTE }
#Import ".\LineCap.ahk" { LineCap }
#Import ".\GpMetafile.ahk" { GpMetafile }
#Import "..\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }
#Import ".\GpBitmap.ahk" { GpBitmap }
#Import ".\RotateFlipType.ahk" { RotateFlipType }
#Import ".\CharacterRange.ahk" { CharacterRange }
#Import ".\StringAlignment.ahk" { StringAlignment }
#Import ".\GpGraphics.ahk" { GpGraphics }
#Import ".\GpBrush.ahk" { GpBrush }
#Import "..\Gdi\BITMAPINFO.ahk" { BITMAPINFO }
#Import ".\Matrix.ahk" { Matrix }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\InterpolationMode.ahk" { InterpolationMode }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */

;@region Functions
/**
 * 
 * @param {Pointer} _size 
 * @returns {Pointer<Void>} 
 */
export GdipAlloc(_size) {
    result := DllCall("gdiplus.dll\GdipAlloc", "ptr", _size, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ptr 
 * @returns {String} Nothing - always returns an empty string
 */
export GdipFree(ptr) {
    ptrMarshal := ptr is VarRef ? "ptr" : "ptr"

    DllCall("gdiplus.dll\GdipFree", ptrMarshal, ptr)
}

/**
 * 
 * @param {Pointer<Pointer>} token 
 * @param {Pointer<GdiplusStartupInput>} _input 
 * @param {Pointer<GdiplusStartupOutput>} output 
 * @returns {Status} 
 * @since windows5.1.2600
 */
export GdiplusStartup(token, _input, output) {
    tokenMarshal := token is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdiplusStartup", tokenMarshal, token, GdiplusStartupInput.Ptr, _input, GdiplusStartupOutput.Ptr, output, Status)
    return result
}

/**
 * 
 * @param {Pointer} token 
 * @returns {String} Nothing - always returns an empty string
 * @since windows5.1.2600
 */
export GdiplusShutdown(token) {
    DllCall("gdiplus.dll\GdiplusShutdown", "ptr", token)
}

/**
 * 
 * @param {Guid} guid 
 * @param {Pointer<Pointer<CGpEffect>>} _effect 
 * @returns {Status} 
 */
export GdipCreateEffect(guid, _effect) {
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateEffect", Guid, guid, _effectMarshal, _effect, Status)
    return result
}

/**
 * 
 * @param {Pointer<CGpEffect>} _effect 
 * @returns {Status} 
 */
export GdipDeleteEffect(_effect) {
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipDeleteEffect", _effectMarshal, _effect, Status)
    return result
}

/**
 * 
 * @param {Pointer<CGpEffect>} _effect 
 * @param {Pointer<Integer>} _size 
 * @returns {Status} 
 */
export GdipGetEffectParameterSize(_effect, _size) {
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetEffectParameterSize", _effectMarshal, _effect, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<CGpEffect>} _effect 
 * @param {Pointer<Void>} params 
 * @param {Integer} _size 
 * @returns {Status} 
 */
export GdipSetEffectParameters(_effect, params, _size) {
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"
    paramsMarshal := params is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetEffectParameters", _effectMarshal, _effect, paramsMarshal, params, "uint", _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<CGpEffect>} _effect 
 * @param {Pointer<Integer>} _size 
 * @param {Pointer<Void>} params 
 * @returns {Status} 
 */
export GdipGetEffectParameters(_effect, _size, params) {
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"
    paramsMarshal := params is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetEffectParameters", _effectMarshal, _effect, _sizeMarshal, _size, paramsMarshal, params, Status)
    return result
}

/**
 * 
 * @param {FillMode} brushMode 
 * @param {Pointer<Pointer<GpPath>>} _path 
 * @returns {Status} 
 */
export GdipCreatePath(brushMode, _path) {
    _pathMarshal := _path is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePath", FillMode, brushMode, _pathMarshal, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<PointF>} param0 
 * @param {Pointer<Integer>} param1 
 * @param {Integer} param2 
 * @param {FillMode} param3 
 * @param {Pointer<Pointer<GpPath>>} _path 
 * @returns {Status} 
 */
export GdipCreatePath2(param0, param1, param2, param3, _path) {
    param1Marshal := param1 is VarRef ? "char*" : "ptr"
    _pathMarshal := _path is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePath2", PointF.Ptr, param0, param1Marshal, param1, "int", param2, FillMode, param3, _pathMarshal, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<Point>} param0 
 * @param {Pointer<Integer>} param1 
 * @param {Integer} param2 
 * @param {FillMode} param3 
 * @param {Pointer<Pointer<GpPath>>} _path 
 * @returns {Status} 
 */
export GdipCreatePath2I(param0, param1, param2, param3, _path) {
    param1Marshal := param1 is VarRef ? "char*" : "ptr"
    _pathMarshal := _path is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePath2I", Point.Ptr, param0, param1Marshal, param1, "int", param2, FillMode, param3, _pathMarshal, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Pointer<GpPath>>} clonePath 
 * @returns {Status} 
 */
export GdipClonePath(_path, clonePath) {
    clonePathMarshal := clonePath is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipClonePath", GpPath.Ptr, _path, clonePathMarshal, clonePath, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipDeletePath(_path) {
    result := DllCall("gdiplus.dll\GdipDeletePath", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipResetPath(_path) {
    result := DllCall("gdiplus.dll\GdipResetPath", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPointCount(_path, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPointCount", GpPath.Ptr, _path, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} types 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPathTypes(_path, types, count) {
    result := DllCall("gdiplus.dll\GdipGetPathTypes", GpPath.Ptr, _path, "ptr", types, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} param0 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPathPoints(param0, _points, count) {
    result := DllCall("gdiplus.dll\GdipGetPathPoints", GpPath.Ptr, param0, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} param0 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPathPointsI(param0, _points, count) {
    result := DllCall("gdiplus.dll\GdipGetPathPointsI", GpPath.Ptr, param0, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<FillMode>} _fillmode 
 * @returns {Status} 
 */
export GdipGetPathFillMode(_path, _fillmode) {
    _fillmodeMarshal := _fillmode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathFillMode", GpPath.Ptr, _path, _fillmodeMarshal, _fillmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {FillMode} _fillmode 
 * @returns {Status} 
 */
export GdipSetPathFillMode(_path, _fillmode) {
    result := DllCall("gdiplus.dll\GdipSetPathFillMode", GpPath.Ptr, _path, FillMode, _fillmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PathData>} _pathData 
 * @returns {Status} 
 */
export GdipGetPathData(_path, _pathData) {
    _pathDataMarshal := _pathData is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathData", GpPath.Ptr, _path, _pathDataMarshal, _pathData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipStartPathFigure(_path) {
    result := DllCall("gdiplus.dll\GdipStartPathFigure", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipClosePathFigure(_path) {
    result := DllCall("gdiplus.dll\GdipClosePathFigure", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipClosePathFigures(_path) {
    result := DllCall("gdiplus.dll\GdipClosePathFigures", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipSetPathMarker(_path) {
    result := DllCall("gdiplus.dll\GdipSetPathMarker", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipClearPathMarkers(_path) {
    result := DllCall("gdiplus.dll\GdipClearPathMarkers", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipReversePath(_path) {
    result := DllCall("gdiplus.dll\GdipReversePath", GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} lastPoint 
 * @returns {Status} 
 */
export GdipGetPathLastPoint(_path, lastPoint) {
    result := DllCall("gdiplus.dll\GdipGetPathLastPoint", GpPath.Ptr, _path, PointF.Ptr, lastPoint, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x1 
 * @param {Float} y1 
 * @param {Float} x2 
 * @param {Float} y2 
 * @returns {Status} 
 */
export GdipAddPathLine(_path, x1, y1, x2, y2) {
    result := DllCall("gdiplus.dll\GdipAddPathLine", GpPath.Ptr, _path, "float", x1, "float", y1, "float", x2, "float", y2, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathLine2(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathLine2", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipAddPathArc(_path, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipAddPathArc", GpPath.Ptr, _path, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x1 
 * @param {Float} y1 
 * @param {Float} x2 
 * @param {Float} y2 
 * @param {Float} x3 
 * @param {Float} y3 
 * @param {Float} x4 
 * @param {Float} y4 
 * @returns {Status} 
 */
export GdipAddPathBezier(_path, x1, y1, x2, y2, x3, y3, x4, y4) {
    result := DllCall("gdiplus.dll\GdipAddPathBezier", GpPath.Ptr, _path, "float", x1, "float", y1, "float", x2, "float", y2, "float", x3, "float", y3, "float", x4, "float", y4, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathBeziers(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathBeziers", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathCurve(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathCurve", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipAddPathCurve2(_path, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipAddPathCurve2", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Integer} offset 
 * @param {Integer} numberOfSegments 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipAddPathCurve3(_path, _points, count, offset, numberOfSegments, tension) {
    result := DllCall("gdiplus.dll\GdipAddPathCurve3", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathClosedCurve(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathClosedCurve", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipAddPathClosedCurve2(_path, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipAddPathClosedCurve2", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipAddPathRectangle(_path, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipAddPathRectangle", GpPath.Ptr, _path, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<RectF>} rects 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathRectangles(_path, rects, count) {
    result := DllCall("gdiplus.dll\GdipAddPathRectangles", GpPath.Ptr, _path, RectF.Ptr, rects, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipAddPathEllipse(_path, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipAddPathEllipse", GpPath.Ptr, _path, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipAddPathPie(_path, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipAddPathPie", GpPath.Ptr, _path, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathPolygon(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathPolygon", GpPath.Ptr, _path, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<GpPath>} addingPath 
 * @param {BOOL} connect 
 * @returns {Status} 
 */
export GdipAddPathPath(_path, addingPath, connect) {
    result := DllCall("gdiplus.dll\GdipAddPathPath", GpPath.Ptr, _path, GpPath.Ptr, addingPath, BOOL, connect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {PWSTR} _string 
 * @param {Integer} length 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Float} emSize 
 * @param {Pointer<RectF>} layoutRect 
 * @param {Pointer<GpStringFormat>} format 
 * @returns {Status} 
 */
export GdipAddPathString(_path, _string, length, family, style, emSize, layoutRect, format) {
    _string := _string is String ? StrPtr(_string) : _string

    result := DllCall("gdiplus.dll\GdipAddPathString", GpPath.Ptr, _path, "ptr", _string, "int", length, GpFontFamily.Ptr, family, "int", style, "float", emSize, RectF.Ptr, layoutRect, GpStringFormat.Ptr, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {PWSTR} _string 
 * @param {Integer} length 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Float} emSize 
 * @param {Pointer<Rect>} layoutRect 
 * @param {Pointer<GpStringFormat>} format 
 * @returns {Status} 
 */
export GdipAddPathStringI(_path, _string, length, family, style, emSize, layoutRect, format) {
    _string := _string is String ? StrPtr(_string) : _string

    result := DllCall("gdiplus.dll\GdipAddPathStringI", GpPath.Ptr, _path, "ptr", _string, "int", length, GpFontFamily.Ptr, family, "int", style, "float", emSize, Rect_struct.Ptr, layoutRect, GpStringFormat.Ptr, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x1 
 * @param {Integer} y1 
 * @param {Integer} x2 
 * @param {Integer} y2 
 * @returns {Status} 
 */
export GdipAddPathLineI(_path, x1, y1, x2, y2) {
    result := DllCall("gdiplus.dll\GdipAddPathLineI", GpPath.Ptr, _path, "int", x1, "int", y1, "int", x2, "int", y2, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathLine2I(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathLine2I", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipAddPathArcI(_path, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipAddPathArcI", GpPath.Ptr, _path, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x1 
 * @param {Integer} y1 
 * @param {Integer} x2 
 * @param {Integer} y2 
 * @param {Integer} x3 
 * @param {Integer} y3 
 * @param {Integer} x4 
 * @param {Integer} y4 
 * @returns {Status} 
 */
export GdipAddPathBezierI(_path, x1, y1, x2, y2, x3, y3, x4, y4) {
    result := DllCall("gdiplus.dll\GdipAddPathBezierI", GpPath.Ptr, _path, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathBeziersI(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathBeziersI", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathCurveI(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathCurveI", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipAddPathCurve2I(_path, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipAddPathCurve2I", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Integer} offset 
 * @param {Integer} numberOfSegments 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipAddPathCurve3I(_path, _points, count, offset, numberOfSegments, tension) {
    result := DllCall("gdiplus.dll\GdipAddPathCurve3I", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathClosedCurveI(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathClosedCurveI", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipAddPathClosedCurve2I(_path, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipAddPathClosedCurve2I", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipAddPathRectangleI(_path, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipAddPathRectangleI", GpPath.Ptr, _path, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Rect>} rects 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathRectanglesI(_path, rects, count) {
    result := DllCall("gdiplus.dll\GdipAddPathRectanglesI", GpPath.Ptr, _path, Rect_struct.Ptr, rects, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipAddPathEllipseI(_path, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipAddPathEllipseI", GpPath.Ptr, _path, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipAddPathPieI(_path, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipAddPathPieI", GpPath.Ptr, _path, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipAddPathPolygonI(_path, _points, count) {
    result := DllCall("gdiplus.dll\GdipAddPathPolygonI", GpPath.Ptr, _path, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} flatness 
 * @returns {Status} 
 */
export GdipFlattenPath(_path, _matrix, flatness) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipFlattenPath", GpPath.Ptr, _path, _matrixMarshal, _matrix, "float", flatness, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} flatness 
 * @returns {Status} 
 */
export GdipWindingModeOutline(_path, _matrix, flatness) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipWindingModeOutline", GpPath.Ptr, _path, _matrixMarshal, _matrix, "float", flatness, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} nativePath 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} flatness 
 * @returns {Status} 
 */
export GdipWidenPath(nativePath, pen, _matrix, flatness) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipWidenPath", GpPath.Ptr, nativePath, GpPen.Ptr, pen, _matrixMarshal, _matrix, "float", flatness, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} srcx 
 * @param {Float} srcy 
 * @param {Float} srcwidth 
 * @param {Float} srcheight 
 * @param {WarpMode} _warpMode 
 * @param {Float} flatness 
 * @returns {Status} 
 */
export GdipWarpPath(_path, _matrix, _points, count, srcx, srcy, srcwidth, srcheight, _warpMode, flatness) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipWarpPath", GpPath.Ptr, _path, _matrixMarshal, _matrix, PointF.Ptr, _points, "int", count, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, WarpMode, _warpMode, "float", flatness, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipTransformPath(_path, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipTransformPath", GpPath.Ptr, _path, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<RectF>} bounds 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<GpPen>} pen 
 * @returns {Status} 
 */
export GdipGetPathWorldBounds(_path, bounds, _matrix, pen) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathWorldBounds", GpPath.Ptr, _path, RectF.Ptr, bounds, _matrixMarshal, _matrix, GpPen.Ptr, pen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Rect>} bounds 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<GpPen>} pen 
 * @returns {Status} 
 */
export GdipGetPathWorldBoundsI(_path, bounds, _matrix, pen) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathWorldBoundsI", GpPath.Ptr, _path, Rect_struct.Ptr, bounds, _matrixMarshal, _matrix, GpPen.Ptr, pen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisiblePathPoint(_path, x, y, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisiblePathPoint", GpPath.Ptr, _path, "float", x, "float", y, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisiblePathPointI(_path, x, y, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisiblePathPointI", GpPath.Ptr, _path, "int", x, "int", y, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsOutlineVisiblePathPoint(_path, x, y, pen, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsOutlineVisiblePathPoint", GpPath.Ptr, _path, "float", x, "float", y, GpPen.Ptr, pen, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsOutlineVisiblePathPointI(_path, x, y, pen, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsOutlineVisiblePathPointI", GpPath.Ptr, _path, "int", x, "int", y, GpPen.Ptr, pen, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpPathIterator>>} iterator 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipCreatePathIter(iterator, _path) {
    iteratorMarshal := iterator is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePathIter", iteratorMarshal, iterator, GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @returns {Status} 
 */
export GdipDeletePathIter(iterator) {
    result := DllCall("gdiplus.dll\GdipDeletePathIter", GpPathIterator.Ptr, iterator, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<Integer>} startIndex 
 * @param {Pointer<Integer>} endIndex 
 * @param {Pointer<BOOL>} isClosed 
 * @returns {Status} 
 */
export GdipPathIterNextSubpath(iterator, resultCount, startIndex, endIndex, isClosed) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
    startIndexMarshal := startIndex is VarRef ? "int*" : "ptr"
    endIndexMarshal := endIndex is VarRef ? "int*" : "ptr"
    isClosedMarshal := isClosed is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterNextSubpath", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, startIndexMarshal, startIndex, endIndexMarshal, endIndex, isClosedMarshal, isClosed, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<BOOL>} isClosed 
 * @returns {Status} 
 */
export GdipPathIterNextSubpathPath(iterator, resultCount, _path, isClosed) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
    isClosedMarshal := isClosed is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterNextSubpathPath", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, GpPath.Ptr, _path, isClosedMarshal, isClosed, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<Integer>} pathType 
 * @param {Pointer<Integer>} startIndex 
 * @param {Pointer<Integer>} endIndex 
 * @returns {Status} 
 */
export GdipPathIterNextPathType(iterator, resultCount, pathType, startIndex, endIndex) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
    pathTypeMarshal := pathType is VarRef ? "char*" : "ptr"
    startIndexMarshal := startIndex is VarRef ? "int*" : "ptr"
    endIndexMarshal := endIndex is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterNextPathType", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, pathTypeMarshal, pathType, startIndexMarshal, startIndex, endIndexMarshal, endIndex, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<Integer>} startIndex 
 * @param {Pointer<Integer>} endIndex 
 * @returns {Status} 
 */
export GdipPathIterNextMarker(iterator, resultCount, startIndex, endIndex) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
    startIndexMarshal := startIndex is VarRef ? "int*" : "ptr"
    endIndexMarshal := endIndex is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterNextMarker", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, startIndexMarshal, startIndex, endIndexMarshal, endIndex, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipPathIterNextMarkerPath(iterator, resultCount, _path) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterNextMarkerPath", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipPathIterGetCount(iterator, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterGetCount", GpPathIterator.Ptr, iterator, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipPathIterGetSubpathCount(iterator, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterGetSubpathCount", GpPathIterator.Ptr, iterator, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<BOOL>} valid 
 * @returns {Status} 
 */
export GdipPathIterIsValid(iterator, valid) {
    validMarshal := valid is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterIsValid", GpPathIterator.Ptr, iterator, validMarshal, valid, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<BOOL>} hasCurve 
 * @returns {Status} 
 */
export GdipPathIterHasCurve(iterator, hasCurve) {
    hasCurveMarshal := hasCurve is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterHasCurve", GpPathIterator.Ptr, iterator, hasCurveMarshal, hasCurve, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @returns {Status} 
 */
export GdipPathIterRewind(iterator) {
    result := DllCall("gdiplus.dll\GdipPathIterRewind", GpPathIterator.Ptr, iterator, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<PointF>} _points 
 * @param {Pointer<Integer>} types 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipPathIterEnumerate(iterator, resultCount, _points, types, count) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
    typesMarshal := types is VarRef ? "char*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterEnumerate", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, PointF.Ptr, _points, typesMarshal, types, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathIterator>} iterator 
 * @param {Pointer<Integer>} resultCount 
 * @param {Pointer<PointF>} _points 
 * @param {Pointer<Integer>} types 
 * @param {Integer} startIndex 
 * @param {Integer} endIndex 
 * @returns {Status} 
 */
export GdipPathIterCopyData(iterator, resultCount, _points, types, startIndex, endIndex) {
    resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
    typesMarshal := types is VarRef ? "char*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPathIterCopyData", GpPathIterator.Ptr, iterator, resultCountMarshal, resultCount, PointF.Ptr, _points, typesMarshal, types, "int", startIndex, "int", endIndex, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Matrix>>} _matrix 
 * @returns {Status} 
 */
export GdipCreateMatrix(_matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMatrix", _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Float} m11 
 * @param {Float} m12 
 * @param {Float} m21 
 * @param {Float} m22 
 * @param {Float} dx 
 * @param {Float} dy 
 * @param {Pointer<Pointer<Matrix>>} _matrix 
 * @returns {Status} 
 */
export GdipCreateMatrix2(m11, m12, m21, m22, dx, dy, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMatrix2", "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<RectF>} _rect 
 * @param {Pointer<PointF>} dstplg 
 * @param {Pointer<Pointer<Matrix>>} _matrix 
 * @returns {Status} 
 */
export GdipCreateMatrix3(_rect, dstplg, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMatrix3", RectF.Ptr, _rect, PointF.Ptr, dstplg, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<Rect>} _rect 
 * @param {Pointer<Point>} dstplg 
 * @param {Pointer<Pointer<Matrix>>} _matrix 
 * @returns {Status} 
 */
export GdipCreateMatrix3I(_rect, dstplg, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMatrix3I", Rect_struct.Ptr, _rect, Point.Ptr, dstplg, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<Pointer<Matrix>>} cloneMatrix 
 * @returns {Status} 
 */
export GdipCloneMatrix(_matrix, cloneMatrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"
    cloneMatrixMarshal := cloneMatrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneMatrix", _matrixMarshal, _matrix, cloneMatrixMarshal, cloneMatrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipDeleteMatrix(_matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipDeleteMatrix", _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} m11 
 * @param {Float} m12 
 * @param {Float} m21 
 * @param {Float} m22 
 * @param {Float} dx 
 * @param {Float} dy 
 * @returns {Status} 
 */
export GdipSetMatrixElements(_matrix, m11, m12, m21, m22, dx, dy) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetMatrixElements", _matrixMarshal, _matrix, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<Matrix>} matrix2 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipMultiplyMatrix(_matrix, matrix2, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"
    matrix2Marshal := matrix2 is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMultiplyMatrix", _matrixMarshal, _matrix, matrix2Marshal, matrix2, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} offsetX 
 * @param {Float} offsetY 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipTranslateMatrix(_matrix, offsetX, offsetY, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipTranslateMatrix", _matrixMarshal, _matrix, "float", offsetX, "float", offsetY, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} scaleX 
 * @param {Float} scaleY 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipScaleMatrix(_matrix, scaleX, scaleY, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipScaleMatrix", _matrixMarshal, _matrix, "float", scaleX, "float", scaleY, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} angle 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipRotateMatrix(_matrix, angle, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRotateMatrix", _matrixMarshal, _matrix, "float", angle, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Float} shearX 
 * @param {Float} shearY 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipShearMatrix(_matrix, shearX, shearY, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipShearMatrix", _matrixMarshal, _matrix, "float", shearX, "float", shearY, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipInvertMatrix(_matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipInvertMatrix", _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<PointF>} pts 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipTransformMatrixPoints(_matrix, pts, count) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipTransformMatrixPoints", _matrixMarshal, _matrix, PointF.Ptr, pts, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<Point>} pts 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipTransformMatrixPointsI(_matrix, pts, count) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipTransformMatrixPointsI", _matrixMarshal, _matrix, Point.Ptr, pts, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<PointF>} pts 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipVectorTransformMatrixPoints(_matrix, pts, count) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipVectorTransformMatrixPoints", _matrixMarshal, _matrix, PointF.Ptr, pts, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<Point>} pts 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipVectorTransformMatrixPointsI(_matrix, pts, count) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipVectorTransformMatrixPointsI", _matrixMarshal, _matrix, Point.Ptr, pts, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<Float>} matrixOut 
 * @returns {Status} 
 */
export GdipGetMatrixElements(_matrix, matrixOut) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"
    matrixOutMarshal := matrixOut is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetMatrixElements", _matrixMarshal, _matrix, matrixOutMarshal, matrixOut, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsMatrixInvertible(_matrix, result) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsMatrixInvertible", _matrixMarshal, _matrix, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsMatrixIdentity(_matrix, result) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsMatrixIdentity", _matrixMarshal, _matrix, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<Matrix>} matrix2 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsMatrixEqual(_matrix, matrix2, result) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"
    matrix2Marshal := matrix2 is VarRef ? "ptr*" : "ptr"
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsMatrixEqual", _matrixMarshal, _matrix, matrix2Marshal, matrix2, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpRegion>>} _region 
 * @returns {Status} 
 */
export GdipCreateRegion(_region) {
    _regionMarshal := _region is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateRegion", _regionMarshal, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<RectF>} _rect 
 * @param {Pointer<Pointer<GpRegion>>} _region 
 * @returns {Status} 
 */
export GdipCreateRegionRect(_rect, _region) {
    _regionMarshal := _region is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateRegionRect", RectF.Ptr, _rect, _regionMarshal, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<Rect>} _rect 
 * @param {Pointer<Pointer<GpRegion>>} _region 
 * @returns {Status} 
 */
export GdipCreateRegionRectI(_rect, _region) {
    _regionMarshal := _region is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateRegionRectI", Rect_struct.Ptr, _rect, _regionMarshal, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Pointer<GpRegion>>} _region 
 * @returns {Status} 
 */
export GdipCreateRegionPath(_path, _region) {
    _regionMarshal := _region is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateRegionPath", GpPath.Ptr, _path, _regionMarshal, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} regionData 
 * @param {Integer} _size 
 * @param {Pointer<Pointer<GpRegion>>} _region 
 * @returns {Status} 
 */
export GdipCreateRegionRgnData(regionData, _size, _region) {
    regionDataMarshal := regionData is VarRef ? "char*" : "ptr"
    _regionMarshal := _region is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateRegionRgnData", regionDataMarshal, regionData, "int", _size, _regionMarshal, _region, Status)
    return result
}

/**
 * 
 * @param {HRGN} _hRgn 
 * @param {Pointer<Pointer<GpRegion>>} _region 
 * @returns {Status} 
 */
export GdipCreateRegionHrgn(_hRgn, _region) {
    _regionMarshal := _region is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateRegionHrgn", HRGN, _hRgn, _regionMarshal, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Pointer<GpRegion>>} cloneRegion 
 * @returns {Status} 
 */
export GdipCloneRegion(_region, cloneRegion) {
    cloneRegionMarshal := cloneRegion is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneRegion", GpRegion.Ptr, _region, cloneRegionMarshal, cloneRegion, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @returns {Status} 
 */
export GdipDeleteRegion(_region) {
    result := DllCall("gdiplus.dll\GdipDeleteRegion", GpRegion.Ptr, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @returns {Status} 
 */
export GdipSetInfinite(_region) {
    result := DllCall("gdiplus.dll\GdipSetInfinite", GpRegion.Ptr, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @returns {Status} 
 */
export GdipSetEmpty(_region) {
    result := DllCall("gdiplus.dll\GdipSetEmpty", GpRegion.Ptr, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<RectF>} _rect 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipCombineRegionRect(_region, _rect, _combineMode) {
    result := DllCall("gdiplus.dll\GdipCombineRegionRect", GpRegion.Ptr, _region, RectF.Ptr, _rect, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Rect>} _rect 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipCombineRegionRectI(_region, _rect, _combineMode) {
    result := DllCall("gdiplus.dll\GdipCombineRegionRectI", GpRegion.Ptr, _region, Rect_struct.Ptr, _rect, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpPath>} _path 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipCombineRegionPath(_region, _path, _combineMode) {
    result := DllCall("gdiplus.dll\GdipCombineRegionPath", GpRegion.Ptr, _region, GpPath.Ptr, _path, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpRegion>} region2 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipCombineRegionRegion(_region, region2, _combineMode) {
    result := DllCall("gdiplus.dll\GdipCombineRegionRegion", GpRegion.Ptr, _region, GpRegion.Ptr, region2, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Float} dx 
 * @param {Float} dy 
 * @returns {Status} 
 */
export GdipTranslateRegion(_region, dx, dy) {
    result := DllCall("gdiplus.dll\GdipTranslateRegion", GpRegion.Ptr, _region, "float", dx, "float", dy, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Integer} dx 
 * @param {Integer} dy 
 * @returns {Status} 
 */
export GdipTranslateRegionI(_region, dx, dy) {
    result := DllCall("gdiplus.dll\GdipTranslateRegionI", GpRegion.Ptr, _region, "int", dx, "int", dy, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipTransformRegion(_region, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipTransformRegion", GpRegion.Ptr, _region, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<RectF>} _rect 
 * @returns {Status} 
 */
export GdipGetRegionBounds(_region, graphics, _rect) {
    result := DllCall("gdiplus.dll\GdipGetRegionBounds", GpRegion.Ptr, _region, GpGraphics.Ptr, graphics, RectF.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Rect>} _rect 
 * @returns {Status} 
 */
export GdipGetRegionBoundsI(_region, graphics, _rect) {
    result := DllCall("gdiplus.dll\GdipGetRegionBoundsI", GpRegion.Ptr, _region, GpGraphics.Ptr, graphics, Rect_struct.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<HRGN>} _hRgn 
 * @returns {Status} 
 */
export GdipGetRegionHRgn(_region, graphics, _hRgn) {
    result := DllCall("gdiplus.dll\GdipGetRegionHRgn", GpRegion.Ptr, _region, GpGraphics.Ptr, graphics, HRGN.Ptr, _hRgn, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsEmptyRegion(_region, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsEmptyRegion", GpRegion.Ptr, _region, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsInfiniteRegion(_region, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsInfiniteRegion", GpRegion.Ptr, _region, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<GpRegion>} region2 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsEqualRegion(_region, region2, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsEqualRegion", GpRegion.Ptr, _region, GpRegion.Ptr, region2, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Integer>} bufferSize 
 * @returns {Status} 
 */
export GdipGetRegionDataSize(_region, bufferSize) {
    bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetRegionDataSize", GpRegion.Ptr, _region, bufferSizeMarshal, bufferSize, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Integer>} _buffer 
 * @param {Integer} bufferSize 
 * @param {Pointer<Integer>} sizeFilled 
 * @returns {Status} 
 */
export GdipGetRegionData(_region, _buffer, bufferSize, sizeFilled) {
    _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
    sizeFilledMarshal := sizeFilled is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetRegionData", GpRegion.Ptr, _region, _bufferMarshal, _buffer, "uint", bufferSize, sizeFilledMarshal, sizeFilled, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleRegionPoint(_region, x, y, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleRegionPoint", GpRegion.Ptr, _region, "float", x, "float", y, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleRegionPointI(_region, x, y, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleRegionPointI", GpRegion.Ptr, _region, "int", x, "int", y, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleRegionRect(_region, x, y, width, height, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleRegionRect", GpRegion.Ptr, _region, "float", x, "float", y, "float", width, "float", height, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleRegionRectI(_region, x, y, width, height, graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleRegionRectI", GpRegion.Ptr, _region, "int", x, "int", y, "int", width, "int", height, GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Integer>} count 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetRegionScansCount(_region, count, _matrix) {
    countMarshal := count is VarRef ? "uint*" : "ptr"
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetRegionScansCount", GpRegion.Ptr, _region, countMarshal, count, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<RectF>} rects 
 * @param {Pointer<Integer>} count 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetRegionScans(_region, rects, count, _matrix) {
    countMarshal := count is VarRef ? "int*" : "ptr"
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetRegionScans", GpRegion.Ptr, _region, RectF.Ptr, rects, countMarshal, count, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpRegion>} _region 
 * @param {Pointer<Rect>} rects 
 * @param {Pointer<Integer>} count 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetRegionScansI(_region, rects, count, _matrix) {
    countMarshal := count is VarRef ? "int*" : "ptr"
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetRegionScansI", GpRegion.Ptr, _region, Rect_struct.Ptr, rects, countMarshal, count, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<Pointer<GpBrush>>} cloneBrush 
 * @returns {Status} 
 */
export GdipCloneBrush(brush, cloneBrush) {
    cloneBrushMarshal := cloneBrush is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneBrush", GpBrush.Ptr, brush, cloneBrushMarshal, cloneBrush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBrush>} brush 
 * @returns {Status} 
 */
export GdipDeleteBrush(brush) {
    result := DllCall("gdiplus.dll\GdipDeleteBrush", GpBrush.Ptr, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<BrushType>} type 
 * @returns {Status} 
 */
export GdipGetBrushType(brush, type) {
    typeMarshal := type is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetBrushType", GpBrush.Ptr, brush, typeMarshal, type, Status)
    return result
}

/**
 * 
 * @param {HatchStyle} _hatchstyle 
 * @param {Integer} forecol 
 * @param {Integer} backcol 
 * @param {Pointer<Pointer<GpHatch>>} brush 
 * @returns {Status} 
 */
export GdipCreateHatchBrush(_hatchstyle, forecol, backcol, brush) {
    brushMarshal := brush is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateHatchBrush", HatchStyle, _hatchstyle, "uint", forecol, "uint", backcol, brushMarshal, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpHatch>} brush 
 * @param {Pointer<HatchStyle>} _hatchstyle 
 * @returns {Status} 
 */
export GdipGetHatchStyle(brush, _hatchstyle) {
    _hatchstyleMarshal := _hatchstyle is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetHatchStyle", GpHatch.Ptr, brush, _hatchstyleMarshal, _hatchstyle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpHatch>} brush 
 * @param {Pointer<Integer>} forecol 
 * @returns {Status} 
 */
export GdipGetHatchForegroundColor(brush, forecol) {
    forecolMarshal := forecol is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetHatchForegroundColor", GpHatch.Ptr, brush, forecolMarshal, forecol, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpHatch>} brush 
 * @param {Pointer<Integer>} backcol 
 * @returns {Status} 
 */
export GdipGetHatchBackgroundColor(brush, backcol) {
    backcolMarshal := backcol is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetHatchBackgroundColor", GpHatch.Ptr, brush, backcolMarshal, backcol, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {WrapMode} _wrapmode 
 * @param {Pointer<Pointer<GpTexture>>} texture 
 * @returns {Status} 
 */
export GdipCreateTexture(_image, _wrapmode, texture) {
    textureMarshal := texture is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateTexture", GpImage.Ptr, _image, WrapMode, _wrapmode, textureMarshal, texture, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {WrapMode} _wrapmode 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Pointer<Pointer<GpTexture>>} texture 
 * @returns {Status} 
 */
export GdipCreateTexture2(_image, _wrapmode, x, y, width, height, texture) {
    textureMarshal := texture is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateTexture2", GpImage.Ptr, _image, WrapMode, _wrapmode, "float", x, "float", y, "float", width, "float", height, textureMarshal, texture, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Pointer<Pointer<GpTexture>>} texture 
 * @returns {Status} 
 */
export GdipCreateTextureIA(_image, imageAttributes, x, y, width, height, texture) {
    textureMarshal := texture is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateTextureIA", GpImage.Ptr, _image, GpImageAttributes.Ptr, imageAttributes, "float", x, "float", y, "float", width, "float", height, textureMarshal, texture, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {WrapMode} _wrapmode 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Pointer<Pointer<GpTexture>>} texture 
 * @returns {Status} 
 */
export GdipCreateTexture2I(_image, _wrapmode, x, y, width, height, texture) {
    textureMarshal := texture is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateTexture2I", GpImage.Ptr, _image, WrapMode, _wrapmode, "int", x, "int", y, "int", width, "int", height, textureMarshal, texture, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Pointer<Pointer<GpTexture>>} texture 
 * @returns {Status} 
 */
export GdipCreateTextureIAI(_image, imageAttributes, x, y, width, height, texture) {
    textureMarshal := texture is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateTextureIAI", GpImage.Ptr, _image, GpImageAttributes.Ptr, imageAttributes, "int", x, "int", y, "int", width, "int", height, textureMarshal, texture, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetTextureTransform(brush, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetTextureTransform", GpTexture.Ptr, brush, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipSetTextureTransform(brush, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetTextureTransform", GpTexture.Ptr, brush, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @returns {Status} 
 */
export GdipResetTextureTransform(brush) {
    result := DllCall("gdiplus.dll\GdipResetTextureTransform", GpTexture.Ptr, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipMultiplyTextureTransform(brush, _matrix, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMultiplyTextureTransform", GpTexture.Ptr, brush, _matrixMarshal, _matrix, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Float} dx 
 * @param {Float} dy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipTranslateTextureTransform(brush, dx, dy, order) {
    result := DllCall("gdiplus.dll\GdipTranslateTextureTransform", GpTexture.Ptr, brush, "float", dx, "float", dy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Float} sx 
 * @param {Float} sy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipScaleTextureTransform(brush, sx, sy, order) {
    result := DllCall("gdiplus.dll\GdipScaleTextureTransform", GpTexture.Ptr, brush, "float", sx, "float", sy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Float} angle 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipRotateTextureTransform(brush, angle, order) {
    result := DllCall("gdiplus.dll\GdipRotateTextureTransform", GpTexture.Ptr, brush, "float", angle, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {WrapMode} _wrapmode 
 * @returns {Status} 
 */
export GdipSetTextureWrapMode(brush, _wrapmode) {
    result := DllCall("gdiplus.dll\GdipSetTextureWrapMode", GpTexture.Ptr, brush, WrapMode, _wrapmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Pointer<WrapMode>} _wrapmode 
 * @returns {Status} 
 */
export GdipGetTextureWrapMode(brush, _wrapmode) {
    _wrapmodeMarshal := _wrapmode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetTextureWrapMode", GpTexture.Ptr, brush, _wrapmodeMarshal, _wrapmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpTexture>} brush 
 * @param {Pointer<Pointer<GpImage>>} _image 
 * @returns {Status} 
 */
export GdipGetTextureImage(brush, _image) {
    _imageMarshal := _image is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetTextureImage", GpTexture.Ptr, brush, _imageMarshal, _image, Status)
    return result
}

/**
 * 
 * @param {Integer} _color 
 * @param {Pointer<Pointer<GpSolidFill>>} brush 
 * @returns {Status} 
 */
export GdipCreateSolidFill(_color, brush) {
    brushMarshal := brush is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateSolidFill", "uint", _color, brushMarshal, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpSolidFill>} brush 
 * @param {Integer} _color 
 * @returns {Status} 
 */
export GdipSetSolidFillColor(brush, _color) {
    result := DllCall("gdiplus.dll\GdipSetSolidFillColor", GpSolidFill.Ptr, brush, "uint", _color, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpSolidFill>} brush 
 * @param {Pointer<Integer>} _color 
 * @returns {Status} 
 */
export GdipGetSolidFillColor(brush, _color) {
    _colorMarshal := _color is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetSolidFillColor", GpSolidFill.Ptr, brush, _colorMarshal, _color, Status)
    return result
}

/**
 * 
 * @param {Pointer<PointF>} point1 
 * @param {Pointer<PointF>} point2 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
 * @returns {Status} 
 */
export GdipCreateLineBrush(point1, point2, color1, color2, _wrapMode, lineGradient) {
    lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateLineBrush", PointF.Ptr, point1, PointF.Ptr, point2, "uint", color1, "uint", color2, WrapMode, _wrapMode, lineGradientMarshal, lineGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<Point>} point1 
 * @param {Pointer<Point>} point2 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
 * @returns {Status} 
 */
export GdipCreateLineBrushI(point1, point2, color1, color2, _wrapMode, lineGradient) {
    lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateLineBrushI", Point.Ptr, point1, Point.Ptr, point2, "uint", color1, "uint", color2, WrapMode, _wrapMode, lineGradientMarshal, lineGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<RectF>} _rect 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @param {LinearGradientMode} _mode 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
 * @returns {Status} 
 */
export GdipCreateLineBrushFromRect(_rect, color1, color2, _mode, _wrapMode, lineGradient) {
    lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRect", RectF.Ptr, _rect, "uint", color1, "uint", color2, LinearGradientMode, _mode, WrapMode, _wrapMode, lineGradientMarshal, lineGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<Rect>} _rect 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @param {LinearGradientMode} _mode 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
 * @returns {Status} 
 */
export GdipCreateLineBrushFromRectI(_rect, color1, color2, _mode, _wrapMode, lineGradient) {
    lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectI", Rect_struct.Ptr, _rect, "uint", color1, "uint", color2, LinearGradientMode, _mode, WrapMode, _wrapMode, lineGradientMarshal, lineGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<RectF>} _rect 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @param {Float} angle 
 * @param {BOOL} isAngleScalable 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
 * @returns {Status} 
 */
export GdipCreateLineBrushFromRectWithAngle(_rect, color1, color2, angle, isAngleScalable, _wrapMode, lineGradient) {
    lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectWithAngle", RectF.Ptr, _rect, "uint", color1, "uint", color2, "float", angle, BOOL, isAngleScalable, WrapMode, _wrapMode, lineGradientMarshal, lineGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<Rect>} _rect 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @param {Float} angle 
 * @param {BOOL} isAngleScalable 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
 * @returns {Status} 
 */
export GdipCreateLineBrushFromRectWithAngleI(_rect, color1, color2, angle, isAngleScalable, _wrapMode, lineGradient) {
    lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectWithAngleI", Rect_struct.Ptr, _rect, "uint", color1, "uint", color2, "float", angle, BOOL, isAngleScalable, WrapMode, _wrapMode, lineGradientMarshal, lineGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Integer} color1 
 * @param {Integer} color2 
 * @returns {Status} 
 */
export GdipSetLineColors(brush, color1, color2) {
    result := DllCall("gdiplus.dll\GdipSetLineColors", GpLineGradient.Ptr, brush, "uint", color1, "uint", color2, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Integer>} colors 
 * @returns {Status} 
 */
export GdipGetLineColors(brush, colors) {
    colorsMarshal := colors is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineColors", GpLineGradient.Ptr, brush, colorsMarshal, colors, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<RectF>} _rect 
 * @returns {Status} 
 */
export GdipGetLineRect(brush, _rect) {
    result := DllCall("gdiplus.dll\GdipGetLineRect", GpLineGradient.Ptr, brush, RectF.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Rect>} _rect 
 * @returns {Status} 
 */
export GdipGetLineRectI(brush, _rect) {
    result := DllCall("gdiplus.dll\GdipGetLineRectI", GpLineGradient.Ptr, brush, Rect_struct.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {BOOL} useGammaCorrection 
 * @returns {Status} 
 */
export GdipSetLineGammaCorrection(brush, useGammaCorrection) {
    result := DllCall("gdiplus.dll\GdipSetLineGammaCorrection", GpLineGradient.Ptr, brush, BOOL, useGammaCorrection, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<BOOL>} useGammaCorrection 
 * @returns {Status} 
 */
export GdipGetLineGammaCorrection(brush, useGammaCorrection) {
    useGammaCorrectionMarshal := useGammaCorrection is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineGammaCorrection", GpLineGradient.Ptr, brush, useGammaCorrectionMarshal, useGammaCorrection, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetLineBlendCount(brush, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineBlendCount", GpLineGradient.Ptr, brush, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Float>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetLineBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "float*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineBlend", GpLineGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Float>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipSetLineBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "float*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetLineBlend", GpLineGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetLinePresetBlendCount(brush, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLinePresetBlendCount", GpLineGradient.Ptr, brush, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Integer>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetLinePresetBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "uint*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLinePresetBlend", GpLineGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Integer>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipSetLinePresetBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "uint*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetLinePresetBlend", GpLineGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Float} focus 
 * @param {Float} scale 
 * @returns {Status} 
 */
export GdipSetLineSigmaBlend(brush, focus, scale) {
    result := DllCall("gdiplus.dll\GdipSetLineSigmaBlend", GpLineGradient.Ptr, brush, "float", focus, "float", scale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Float} focus 
 * @param {Float} scale 
 * @returns {Status} 
 */
export GdipSetLineLinearBlend(brush, focus, scale) {
    result := DllCall("gdiplus.dll\GdipSetLineLinearBlend", GpLineGradient.Ptr, brush, "float", focus, "float", scale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {WrapMode} _wrapmode 
 * @returns {Status} 
 */
export GdipSetLineWrapMode(brush, _wrapmode) {
    result := DllCall("gdiplus.dll\GdipSetLineWrapMode", GpLineGradient.Ptr, brush, WrapMode, _wrapmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<WrapMode>} _wrapmode 
 * @returns {Status} 
 */
export GdipGetLineWrapMode(brush, _wrapmode) {
    _wrapmodeMarshal := _wrapmode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineWrapMode", GpLineGradient.Ptr, brush, _wrapmodeMarshal, _wrapmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetLineTransform(brush, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineTransform", GpLineGradient.Ptr, brush, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipSetLineTransform(brush, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetLineTransform", GpLineGradient.Ptr, brush, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @returns {Status} 
 */
export GdipResetLineTransform(brush) {
    result := DllCall("gdiplus.dll\GdipResetLineTransform", GpLineGradient.Ptr, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipMultiplyLineTransform(brush, _matrix, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMultiplyLineTransform", GpLineGradient.Ptr, brush, _matrixMarshal, _matrix, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Float} dx 
 * @param {Float} dy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipTranslateLineTransform(brush, dx, dy, order) {
    result := DllCall("gdiplus.dll\GdipTranslateLineTransform", GpLineGradient.Ptr, brush, "float", dx, "float", dy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Float} sx 
 * @param {Float} sy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipScaleLineTransform(brush, sx, sy, order) {
    result := DllCall("gdiplus.dll\GdipScaleLineTransform", GpLineGradient.Ptr, brush, "float", sx, "float", sy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpLineGradient>} brush 
 * @param {Float} angle 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipRotateLineTransform(brush, angle, order) {
    result := DllCall("gdiplus.dll\GdipRotateLineTransform", GpLineGradient.Ptr, brush, "float", angle, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpPathGradient>>} polyGradient 
 * @returns {Status} 
 */
export GdipCreatePathGradient(_points, count, _wrapMode, polyGradient) {
    polyGradientMarshal := polyGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePathGradient", PointF.Ptr, _points, "int", count, WrapMode, _wrapMode, polyGradientMarshal, polyGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {WrapMode} _wrapMode 
 * @param {Pointer<Pointer<GpPathGradient>>} polyGradient 
 * @returns {Status} 
 */
export GdipCreatePathGradientI(_points, count, _wrapMode, polyGradient) {
    polyGradientMarshal := polyGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePathGradientI", Point.Ptr, _points, "int", count, WrapMode, _wrapMode, polyGradientMarshal, polyGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} _path 
 * @param {Pointer<Pointer<GpPathGradient>>} polyGradient 
 * @returns {Status} 
 */
export GdipCreatePathGradientFromPath(_path, polyGradient) {
    polyGradientMarshal := polyGradient is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePathGradientFromPath", GpPath.Ptr, _path, polyGradientMarshal, polyGradient, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} colors 
 * @returns {Status} 
 */
export GdipGetPathGradientCenterColor(brush, colors) {
    colorsMarshal := colors is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientCenterColor", GpPathGradient.Ptr, brush, colorsMarshal, colors, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Integer} colors 
 * @returns {Status} 
 */
export GdipSetPathGradientCenterColor(brush, colors) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientCenterColor", GpPathGradient.Ptr, brush, "uint", colors, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} _color 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPathGradientSurroundColorsWithCount(brush, _color, count) {
    _colorMarshal := _color is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientSurroundColorsWithCount", GpPathGradient.Ptr, brush, _colorMarshal, _color, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} _color 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipSetPathGradientSurroundColorsWithCount(brush, _color, count) {
    _colorMarshal := _color is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPathGradientSurroundColorsWithCount", GpPathGradient.Ptr, brush, _colorMarshal, _color, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipGetPathGradientPath(brush, _path) {
    result := DllCall("gdiplus.dll\GdipGetPathGradientPath", GpPathGradient.Ptr, brush, GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipSetPathGradientPath(brush, _path) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientPath", GpPathGradient.Ptr, brush, GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<PointF>} _points 
 * @returns {Status} 
 */
export GdipGetPathGradientCenterPoint(brush, _points) {
    result := DllCall("gdiplus.dll\GdipGetPathGradientCenterPoint", GpPathGradient.Ptr, brush, PointF.Ptr, _points, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Point>} _points 
 * @returns {Status} 
 */
export GdipGetPathGradientCenterPointI(brush, _points) {
    result := DllCall("gdiplus.dll\GdipGetPathGradientCenterPointI", GpPathGradient.Ptr, brush, Point.Ptr, _points, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<PointF>} _points 
 * @returns {Status} 
 */
export GdipSetPathGradientCenterPoint(brush, _points) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientCenterPoint", GpPathGradient.Ptr, brush, PointF.Ptr, _points, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Point>} _points 
 * @returns {Status} 
 */
export GdipSetPathGradientCenterPointI(brush, _points) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientCenterPointI", GpPathGradient.Ptr, brush, Point.Ptr, _points, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<RectF>} _rect 
 * @returns {Status} 
 */
export GdipGetPathGradientRect(brush, _rect) {
    result := DllCall("gdiplus.dll\GdipGetPathGradientRect", GpPathGradient.Ptr, brush, RectF.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Rect>} _rect 
 * @returns {Status} 
 */
export GdipGetPathGradientRectI(brush, _rect) {
    result := DllCall("gdiplus.dll\GdipGetPathGradientRectI", GpPathGradient.Ptr, brush, Rect_struct.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPathGradientPointCount(brush, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientPointCount", GpPathGradient.Ptr, brush, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPathGradientSurroundColorCount(brush, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientSurroundColorCount", GpPathGradient.Ptr, brush, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {BOOL} useGammaCorrection 
 * @returns {Status} 
 */
export GdipSetPathGradientGammaCorrection(brush, useGammaCorrection) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientGammaCorrection", GpPathGradient.Ptr, brush, BOOL, useGammaCorrection, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<BOOL>} useGammaCorrection 
 * @returns {Status} 
 */
export GdipGetPathGradientGammaCorrection(brush, useGammaCorrection) {
    useGammaCorrectionMarshal := useGammaCorrection is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientGammaCorrection", GpPathGradient.Ptr, brush, useGammaCorrectionMarshal, useGammaCorrection, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPathGradientBlendCount(brush, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientBlendCount", GpPathGradient.Ptr, brush, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Float>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPathGradientBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "float*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientBlend", GpPathGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Float>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipSetPathGradientBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "float*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPathGradientBlend", GpPathGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPathGradientPresetBlendCount(brush, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientPresetBlendCount", GpPathGradient.Ptr, brush, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPathGradientPresetBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "uint*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientPresetBlend", GpPathGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Integer>} blend 
 * @param {Pointer<Float>} positions 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipSetPathGradientPresetBlend(brush, blend, positions, count) {
    blendMarshal := blend is VarRef ? "uint*" : "ptr"
    positionsMarshal := positions is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPathGradientPresetBlend", GpPathGradient.Ptr, brush, blendMarshal, blend, positionsMarshal, positions, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Float} focus 
 * @param {Float} scale 
 * @returns {Status} 
 */
export GdipSetPathGradientSigmaBlend(brush, focus, scale) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientSigmaBlend", GpPathGradient.Ptr, brush, "float", focus, "float", scale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Float} focus 
 * @param {Float} scale 
 * @returns {Status} 
 */
export GdipSetPathGradientLinearBlend(brush, focus, scale) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientLinearBlend", GpPathGradient.Ptr, brush, "float", focus, "float", scale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<WrapMode>} _wrapmode 
 * @returns {Status} 
 */
export GdipGetPathGradientWrapMode(brush, _wrapmode) {
    _wrapmodeMarshal := _wrapmode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientWrapMode", GpPathGradient.Ptr, brush, _wrapmodeMarshal, _wrapmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {WrapMode} _wrapmode 
 * @returns {Status} 
 */
export GdipSetPathGradientWrapMode(brush, _wrapmode) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientWrapMode", GpPathGradient.Ptr, brush, WrapMode, _wrapmode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetPathGradientTransform(brush, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientTransform", GpPathGradient.Ptr, brush, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipSetPathGradientTransform(brush, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPathGradientTransform", GpPathGradient.Ptr, brush, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @returns {Status} 
 */
export GdipResetPathGradientTransform(brush) {
    result := DllCall("gdiplus.dll\GdipResetPathGradientTransform", GpPathGradient.Ptr, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Matrix>} _matrix 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipMultiplyPathGradientTransform(brush, _matrix, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMultiplyPathGradientTransform", GpPathGradient.Ptr, brush, _matrixMarshal, _matrix, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Float} dx 
 * @param {Float} dy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipTranslatePathGradientTransform(brush, dx, dy, order) {
    result := DllCall("gdiplus.dll\GdipTranslatePathGradientTransform", GpPathGradient.Ptr, brush, "float", dx, "float", dy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Float} sx 
 * @param {Float} sy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipScalePathGradientTransform(brush, sx, sy, order) {
    result := DllCall("gdiplus.dll\GdipScalePathGradientTransform", GpPathGradient.Ptr, brush, "float", sx, "float", sy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Float} angle 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipRotatePathGradientTransform(brush, angle, order) {
    result := DllCall("gdiplus.dll\GdipRotatePathGradientTransform", GpPathGradient.Ptr, brush, "float", angle, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Pointer<Float>} xScale 
 * @param {Pointer<Float>} yScale 
 * @returns {Status} 
 */
export GdipGetPathGradientFocusScales(brush, xScale, yScale) {
    xScaleMarshal := xScale is VarRef ? "float*" : "ptr"
    yScaleMarshal := yScale is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPathGradientFocusScales", GpPathGradient.Ptr, brush, xScaleMarshal, xScale, yScaleMarshal, yScale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPathGradient>} brush 
 * @param {Float} xScale 
 * @param {Float} yScale 
 * @returns {Status} 
 */
export GdipSetPathGradientFocusScales(brush, xScale, yScale) {
    result := DllCall("gdiplus.dll\GdipSetPathGradientFocusScales", GpPathGradient.Ptr, brush, "float", xScale, "float", yScale, Status)
    return result
}

/**
 * 
 * @param {Integer} _color 
 * @param {Float} width 
 * @param {Unit} _unit 
 * @param {Pointer<Pointer<GpPen>>} pen 
 * @returns {Status} 
 */
export GdipCreatePen1(_color, width, _unit, pen) {
    penMarshal := pen is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePen1", "uint", _color, "float", width, Unit, _unit, penMarshal, pen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBrush>} brush 
 * @param {Float} width 
 * @param {Unit} _unit 
 * @param {Pointer<Pointer<GpPen>>} pen 
 * @returns {Status} 
 */
export GdipCreatePen2(brush, width, _unit, pen) {
    penMarshal := pen is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreatePen2", GpBrush.Ptr, brush, "float", width, Unit, _unit, penMarshal, pen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Pointer<GpPen>>} clonepen 
 * @returns {Status} 
 */
export GdipClonePen(pen, clonepen) {
    clonepenMarshal := clonepen is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipClonePen", GpPen.Ptr, pen, clonepenMarshal, clonepen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @returns {Status} 
 */
export GdipDeletePen(pen) {
    result := DllCall("gdiplus.dll\GdipDeletePen", GpPen.Ptr, pen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} width 
 * @returns {Status} 
 */
export GdipSetPenWidth(pen, width) {
    result := DllCall("gdiplus.dll\GdipSetPenWidth", GpPen.Ptr, pen, "float", width, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} width 
 * @returns {Status} 
 */
export GdipGetPenWidth(pen, width) {
    widthMarshal := width is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenWidth", GpPen.Ptr, pen, widthMarshal, width, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Unit} _unit 
 * @returns {Status} 
 */
export GdipSetPenUnit(pen, _unit) {
    result := DllCall("gdiplus.dll\GdipSetPenUnit", GpPen.Ptr, pen, Unit, _unit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Unit>} _unit 
 * @returns {Status} 
 */
export GdipGetPenUnit(pen, _unit) {
    _unitMarshal := _unit is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenUnit", GpPen.Ptr, pen, _unitMarshal, _unit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {LineCap} startCap 
 * @param {LineCap} endCap 
 * @param {DashCap} _dashCap 
 * @returns {Status} 
 */
export GdipSetPenLineCap197819(pen, startCap, endCap, _dashCap) {
    result := DllCall("gdiplus.dll\GdipSetPenLineCap197819", GpPen.Ptr, pen, LineCap, startCap, LineCap, endCap, DashCap, _dashCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {LineCap} startCap 
 * @returns {Status} 
 */
export GdipSetPenStartCap(pen, startCap) {
    result := DllCall("gdiplus.dll\GdipSetPenStartCap", GpPen.Ptr, pen, LineCap, startCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {LineCap} endCap 
 * @returns {Status} 
 */
export GdipSetPenEndCap(pen, endCap) {
    result := DllCall("gdiplus.dll\GdipSetPenEndCap", GpPen.Ptr, pen, LineCap, endCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {DashCap} _dashCap 
 * @returns {Status} 
 */
export GdipSetPenDashCap197819(pen, _dashCap) {
    result := DllCall("gdiplus.dll\GdipSetPenDashCap197819", GpPen.Ptr, pen, DashCap, _dashCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<LineCap>} startCap 
 * @returns {Status} 
 */
export GdipGetPenStartCap(pen, startCap) {
    startCapMarshal := startCap is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenStartCap", GpPen.Ptr, pen, startCapMarshal, startCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<LineCap>} endCap 
 * @returns {Status} 
 */
export GdipGetPenEndCap(pen, endCap) {
    endCapMarshal := endCap is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenEndCap", GpPen.Ptr, pen, endCapMarshal, endCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<DashCap>} _dashCap 
 * @returns {Status} 
 */
export GdipGetPenDashCap197819(pen, _dashCap) {
    _dashCapMarshal := _dashCap is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenDashCap197819", GpPen.Ptr, pen, _dashCapMarshal, _dashCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {LineJoin} _lineJoin 
 * @returns {Status} 
 */
export GdipSetPenLineJoin(pen, _lineJoin) {
    result := DllCall("gdiplus.dll\GdipSetPenLineJoin", GpPen.Ptr, pen, LineJoin, _lineJoin, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<LineJoin>} _lineJoin 
 * @returns {Status} 
 */
export GdipGetPenLineJoin(pen, _lineJoin) {
    _lineJoinMarshal := _lineJoin is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenLineJoin", GpPen.Ptr, pen, _lineJoinMarshal, _lineJoin, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @returns {Status} 
 */
export GdipSetPenCustomStartCap(pen, customCap) {
    result := DllCall("gdiplus.dll\GdipSetPenCustomStartCap", GpPen.Ptr, pen, GpCustomLineCap.Ptr, customCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Pointer<GpCustomLineCap>>} customCap 
 * @returns {Status} 
 */
export GdipGetPenCustomStartCap(pen, customCap) {
    customCapMarshal := customCap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenCustomStartCap", GpPen.Ptr, pen, customCapMarshal, customCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @returns {Status} 
 */
export GdipSetPenCustomEndCap(pen, customCap) {
    result := DllCall("gdiplus.dll\GdipSetPenCustomEndCap", GpPen.Ptr, pen, GpCustomLineCap.Ptr, customCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Pointer<GpCustomLineCap>>} customCap 
 * @returns {Status} 
 */
export GdipGetPenCustomEndCap(pen, customCap) {
    customCapMarshal := customCap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenCustomEndCap", GpPen.Ptr, pen, customCapMarshal, customCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} miterLimit 
 * @returns {Status} 
 */
export GdipSetPenMiterLimit(pen, miterLimit) {
    result := DllCall("gdiplus.dll\GdipSetPenMiterLimit", GpPen.Ptr, pen, "float", miterLimit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} miterLimit 
 * @returns {Status} 
 */
export GdipGetPenMiterLimit(pen, miterLimit) {
    miterLimitMarshal := miterLimit is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenMiterLimit", GpPen.Ptr, pen, miterLimitMarshal, miterLimit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {PenAlignment} penMode 
 * @returns {Status} 
 */
export GdipSetPenMode(pen, penMode) {
    result := DllCall("gdiplus.dll\GdipSetPenMode", GpPen.Ptr, pen, PenAlignment, penMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PenAlignment>} penMode 
 * @returns {Status} 
 */
export GdipGetPenMode(pen, penMode) {
    penModeMarshal := penMode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenMode", GpPen.Ptr, pen, penModeMarshal, penMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipSetPenTransform(pen, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPenTransform", GpPen.Ptr, pen, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetPenTransform(pen, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenTransform", GpPen.Ptr, pen, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @returns {Status} 
 */
export GdipResetPenTransform(pen) {
    result := DllCall("gdiplus.dll\GdipResetPenTransform", GpPen.Ptr, pen, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Matrix>} _matrix 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipMultiplyPenTransform(pen, _matrix, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMultiplyPenTransform", GpPen.Ptr, pen, _matrixMarshal, _matrix, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} dx 
 * @param {Float} dy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipTranslatePenTransform(pen, dx, dy, order) {
    result := DllCall("gdiplus.dll\GdipTranslatePenTransform", GpPen.Ptr, pen, "float", dx, "float", dy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} sx 
 * @param {Float} sy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipScalePenTransform(pen, sx, sy, order) {
    result := DllCall("gdiplus.dll\GdipScalePenTransform", GpPen.Ptr, pen, "float", sx, "float", sy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} angle 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipRotatePenTransform(pen, angle, order) {
    result := DllCall("gdiplus.dll\GdipRotatePenTransform", GpPen.Ptr, pen, "float", angle, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} argb 
 * @returns {Status} 
 */
export GdipSetPenColor(pen, argb) {
    result := DllCall("gdiplus.dll\GdipSetPenColor", GpPen.Ptr, pen, "uint", argb, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Integer>} argb 
 * @returns {Status} 
 */
export GdipGetPenColor(pen, argb) {
    argbMarshal := argb is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenColor", GpPen.Ptr, pen, argbMarshal, argb, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<GpBrush>} brush 
 * @returns {Status} 
 */
export GdipSetPenBrushFill(pen, brush) {
    result := DllCall("gdiplus.dll\GdipSetPenBrushFill", GpPen.Ptr, pen, GpBrush.Ptr, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Pointer<GpBrush>>} brush 
 * @returns {Status} 
 */
export GdipGetPenBrushFill(pen, brush) {
    brushMarshal := brush is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenBrushFill", GpPen.Ptr, pen, brushMarshal, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PenType>} type 
 * @returns {Status} 
 */
export GdipGetPenFillType(pen, type) {
    typeMarshal := type is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenFillType", GpPen.Ptr, pen, typeMarshal, type, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<DashStyle>} _dashstyle 
 * @returns {Status} 
 */
export GdipGetPenDashStyle(pen, _dashstyle) {
    _dashstyleMarshal := _dashstyle is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenDashStyle", GpPen.Ptr, pen, _dashstyleMarshal, _dashstyle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {DashStyle} _dashstyle 
 * @returns {Status} 
 */
export GdipSetPenDashStyle(pen, _dashstyle) {
    result := DllCall("gdiplus.dll\GdipSetPenDashStyle", GpPen.Ptr, pen, DashStyle, _dashstyle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} offset 
 * @returns {Status} 
 */
export GdipGetPenDashOffset(pen, offset) {
    offsetMarshal := offset is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenDashOffset", GpPen.Ptr, pen, offsetMarshal, offset, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} offset 
 * @returns {Status} 
 */
export GdipSetPenDashOffset(pen, offset) {
    result := DllCall("gdiplus.dll\GdipSetPenDashOffset", GpPen.Ptr, pen, "float", offset, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPenDashCount(pen, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenDashCount", GpPen.Ptr, pen, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} dash 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipSetPenDashArray(pen, dash, count) {
    dashMarshal := dash is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPenDashArray", GpPen.Ptr, pen, dashMarshal, dash, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} dash 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPenDashArray(pen, dash, count) {
    dashMarshal := dash is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenDashArray", GpPen.Ptr, pen, dashMarshal, dash, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetPenCompoundCount(pen, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenCompoundCount", GpPen.Ptr, pen, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} dash 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipSetPenCompoundArray(pen, dash, count) {
    dashMarshal := dash is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetPenCompoundArray", GpPen.Ptr, pen, dashMarshal, dash, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Float>} dash 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipGetPenCompoundArray(pen, dash, count) {
    dashMarshal := dash is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPenCompoundArray", GpPen.Ptr, pen, dashMarshal, dash, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpPath>} fillPath 
 * @param {Pointer<GpPath>} strokePath 
 * @param {LineCap} baseCap 
 * @param {Float} baseInset 
 * @param {Pointer<Pointer<GpCustomLineCap>>} customCap 
 * @returns {Status} 
 */
export GdipCreateCustomLineCap(fillPath, strokePath, baseCap, baseInset, customCap) {
    customCapMarshal := customCap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateCustomLineCap", GpPath.Ptr, fillPath, GpPath.Ptr, strokePath, LineCap, baseCap, "float", baseInset, customCapMarshal, customCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @returns {Status} 
 */
export GdipDeleteCustomLineCap(customCap) {
    result := DllCall("gdiplus.dll\GdipDeleteCustomLineCap", GpCustomLineCap.Ptr, customCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<Pointer<GpCustomLineCap>>} clonedCap 
 * @returns {Status} 
 */
export GdipCloneCustomLineCap(customCap, clonedCap) {
    clonedCapMarshal := clonedCap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneCustomLineCap", GpCustomLineCap.Ptr, customCap, clonedCapMarshal, clonedCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<CustomLineCapType>} capType 
 * @returns {Status} 
 */
export GdipGetCustomLineCapType(customCap, capType) {
    capTypeMarshal := capType is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCustomLineCapType", GpCustomLineCap.Ptr, customCap, capTypeMarshal, capType, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {LineCap} startCap 
 * @param {LineCap} endCap 
 * @returns {Status} 
 */
export GdipSetCustomLineCapStrokeCaps(customCap, startCap, endCap) {
    result := DllCall("gdiplus.dll\GdipSetCustomLineCapStrokeCaps", GpCustomLineCap.Ptr, customCap, LineCap, startCap, LineCap, endCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<LineCap>} startCap 
 * @param {Pointer<LineCap>} endCap 
 * @returns {Status} 
 */
export GdipGetCustomLineCapStrokeCaps(customCap, startCap, endCap) {
    startCapMarshal := startCap is VarRef ? "int*" : "ptr"
    endCapMarshal := endCap is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCustomLineCapStrokeCaps", GpCustomLineCap.Ptr, customCap, startCapMarshal, startCap, endCapMarshal, endCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {LineJoin} _lineJoin 
 * @returns {Status} 
 */
export GdipSetCustomLineCapStrokeJoin(customCap, _lineJoin) {
    result := DllCall("gdiplus.dll\GdipSetCustomLineCapStrokeJoin", GpCustomLineCap.Ptr, customCap, LineJoin, _lineJoin, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<LineJoin>} _lineJoin 
 * @returns {Status} 
 */
export GdipGetCustomLineCapStrokeJoin(customCap, _lineJoin) {
    _lineJoinMarshal := _lineJoin is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCustomLineCapStrokeJoin", GpCustomLineCap.Ptr, customCap, _lineJoinMarshal, _lineJoin, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {LineCap} baseCap 
 * @returns {Status} 
 */
export GdipSetCustomLineCapBaseCap(customCap, baseCap) {
    result := DllCall("gdiplus.dll\GdipSetCustomLineCapBaseCap", GpCustomLineCap.Ptr, customCap, LineCap, baseCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<LineCap>} baseCap 
 * @returns {Status} 
 */
export GdipGetCustomLineCapBaseCap(customCap, baseCap) {
    baseCapMarshal := baseCap is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCustomLineCapBaseCap", GpCustomLineCap.Ptr, customCap, baseCapMarshal, baseCap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Float} inset 
 * @returns {Status} 
 */
export GdipSetCustomLineCapBaseInset(customCap, inset) {
    result := DllCall("gdiplus.dll\GdipSetCustomLineCapBaseInset", GpCustomLineCap.Ptr, customCap, "float", inset, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<Float>} inset 
 * @returns {Status} 
 */
export GdipGetCustomLineCapBaseInset(customCap, inset) {
    insetMarshal := inset is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCustomLineCapBaseInset", GpCustomLineCap.Ptr, customCap, insetMarshal, inset, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Float} widthScale 
 * @returns {Status} 
 */
export GdipSetCustomLineCapWidthScale(customCap, widthScale) {
    result := DllCall("gdiplus.dll\GdipSetCustomLineCapWidthScale", GpCustomLineCap.Ptr, customCap, "float", widthScale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCustomLineCap>} customCap 
 * @param {Pointer<Float>} widthScale 
 * @returns {Status} 
 */
export GdipGetCustomLineCapWidthScale(customCap, widthScale) {
    widthScaleMarshal := widthScale is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCustomLineCapWidthScale", GpCustomLineCap.Ptr, customCap, widthScaleMarshal, widthScale, Status)
    return result
}

/**
 * 
 * @param {Float} height 
 * @param {Float} width 
 * @param {BOOL} isFilled 
 * @param {Pointer<Pointer<GpAdjustableArrowCap>>} cap 
 * @returns {Status} 
 */
export GdipCreateAdjustableArrowCap(height, width, isFilled, cap) {
    capMarshal := cap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateAdjustableArrowCap", "float", height, "float", width, BOOL, isFilled, capMarshal, cap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipSetAdjustableArrowCapHeight(cap, height) {
    result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapHeight", GpAdjustableArrowCap.Ptr, cap, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Pointer<Float>} height 
 * @returns {Status} 
 */
export GdipGetAdjustableArrowCapHeight(cap, height) {
    heightMarshal := height is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapHeight", GpAdjustableArrowCap.Ptr, cap, heightMarshal, height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Float} width 
 * @returns {Status} 
 */
export GdipSetAdjustableArrowCapWidth(cap, width) {
    result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapWidth", GpAdjustableArrowCap.Ptr, cap, "float", width, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Pointer<Float>} width 
 * @returns {Status} 
 */
export GdipGetAdjustableArrowCapWidth(cap, width) {
    widthMarshal := width is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapWidth", GpAdjustableArrowCap.Ptr, cap, widthMarshal, width, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Float} middleInset 
 * @returns {Status} 
 */
export GdipSetAdjustableArrowCapMiddleInset(cap, middleInset) {
    result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapMiddleInset", GpAdjustableArrowCap.Ptr, cap, "float", middleInset, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Pointer<Float>} middleInset 
 * @returns {Status} 
 */
export GdipGetAdjustableArrowCapMiddleInset(cap, middleInset) {
    middleInsetMarshal := middleInset is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapMiddleInset", GpAdjustableArrowCap.Ptr, cap, middleInsetMarshal, middleInset, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {BOOL} fillState 
 * @returns {Status} 
 */
export GdipSetAdjustableArrowCapFillState(cap, fillState) {
    result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapFillState", GpAdjustableArrowCap.Ptr, cap, BOOL, fillState, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpAdjustableArrowCap>} cap 
 * @param {Pointer<BOOL>} fillState 
 * @returns {Status} 
 */
export GdipGetAdjustableArrowCapFillState(cap, fillState) {
    fillStateMarshal := fillState is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapFillState", GpAdjustableArrowCap.Ptr, cap, fillStateMarshal, fillState, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {Pointer<Pointer<GpImage>>} _image 
 * @returns {Status} 
 */
export GdipLoadImageFromStream(stream, _image) {
    _imageMarshal := _image is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipLoadImageFromStream", "ptr", stream, _imageMarshal, _image, Status)
    return result
}

/**
 * 
 * @param {PWSTR} filename 
 * @param {Pointer<Pointer<GpImage>>} _image 
 * @returns {Status} 
 */
export GdipLoadImageFromFile(filename, _image) {
    filename := filename is String ? StrPtr(filename) : filename

    _imageMarshal := _image is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipLoadImageFromFile", "ptr", filename, _imageMarshal, _image, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {Pointer<Pointer<GpImage>>} _image 
 * @returns {Status} 
 */
export GdipLoadImageFromStreamICM(stream, _image) {
    _imageMarshal := _image is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipLoadImageFromStreamICM", "ptr", stream, _imageMarshal, _image, Status)
    return result
}

/**
 * 
 * @param {PWSTR} filename 
 * @param {Pointer<Pointer<GpImage>>} _image 
 * @returns {Status} 
 */
export GdipLoadImageFromFileICM(filename, _image) {
    filename := filename is String ? StrPtr(filename) : filename

    _imageMarshal := _image is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipLoadImageFromFileICM", "ptr", filename, _imageMarshal, _image, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Pointer<GpImage>>} cloneImage 
 * @returns {Status} 
 */
export GdipCloneImage(_image, cloneImage) {
    cloneImageMarshal := cloneImage is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneImage", GpImage.Ptr, _image, cloneImageMarshal, cloneImage, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @returns {Status} 
 */
export GdipDisposeImage(_image) {
    result := DllCall("gdiplus.dll\GdipDisposeImage", GpImage.Ptr, _image, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {PWSTR} filename 
 * @param {Pointer<Guid>} clsidEncoder 
 * @param {Pointer<EncoderParameters>} encoderParams 
 * @returns {Status} 
 */
export GdipSaveImageToFile(_image, filename, clsidEncoder, encoderParams) {
    filename := filename is String ? StrPtr(filename) : filename

    result := DllCall("gdiplus.dll\GdipSaveImageToFile", GpImage.Ptr, _image, "ptr", filename, Guid.Ptr, clsidEncoder, EncoderParameters.Ptr, encoderParams, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {IStream} stream 
 * @param {Pointer<Guid>} clsidEncoder 
 * @param {Pointer<EncoderParameters>} encoderParams 
 * @returns {Status} 
 */
export GdipSaveImageToStream(_image, stream, clsidEncoder, encoderParams) {
    result := DllCall("gdiplus.dll\GdipSaveImageToStream", GpImage.Ptr, _image, "ptr", stream, Guid.Ptr, clsidEncoder, EncoderParameters.Ptr, encoderParams, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<EncoderParameters>} encoderParams 
 * @returns {Status} 
 */
export GdipSaveAdd(_image, encoderParams) {
    result := DllCall("gdiplus.dll\GdipSaveAdd", GpImage.Ptr, _image, EncoderParameters.Ptr, encoderParams, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<GpImage>} newImage 
 * @param {Pointer<EncoderParameters>} encoderParams 
 * @returns {Status} 
 */
export GdipSaveAddImage(_image, newImage, encoderParams) {
    result := DllCall("gdiplus.dll\GdipSaveAddImage", GpImage.Ptr, _image, GpImage.Ptr, newImage, EncoderParameters.Ptr, encoderParams, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Pointer<GpGraphics>>} graphics 
 * @returns {Status} 
 */
export GdipGetImageGraphicsContext(_image, graphics) {
    graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageGraphicsContext", GpImage.Ptr, _image, graphicsMarshal, graphics, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<RectF>} srcRect 
 * @param {Pointer<Unit>} srcUnit 
 * @returns {Status} 
 */
export GdipGetImageBounds(_image, srcRect, srcUnit) {
    srcUnitMarshal := srcUnit is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageBounds", GpImage.Ptr, _image, RectF.Ptr, srcRect, srcUnitMarshal, srcUnit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Float>} width 
 * @param {Pointer<Float>} height 
 * @returns {Status} 
 */
export GdipGetImageDimension(_image, width, height) {
    widthMarshal := width is VarRef ? "float*" : "ptr"
    heightMarshal := height is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageDimension", GpImage.Ptr, _image, widthMarshal, width, heightMarshal, height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<ImageType>} type 
 * @returns {Status} 
 */
export GdipGetImageType(_image, type) {
    typeMarshal := type is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageType", GpImage.Ptr, _image, typeMarshal, type, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} width 
 * @returns {Status} 
 */
export GdipGetImageWidth(_image, width) {
    widthMarshal := width is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageWidth", GpImage.Ptr, _image, widthMarshal, width, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} height 
 * @returns {Status} 
 */
export GdipGetImageHeight(_image, height) {
    heightMarshal := height is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageHeight", GpImage.Ptr, _image, heightMarshal, height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Float>} resolution 
 * @returns {Status} 
 */
export GdipGetImageHorizontalResolution(_image, resolution) {
    resolutionMarshal := resolution is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageHorizontalResolution", GpImage.Ptr, _image, resolutionMarshal, resolution, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Float>} resolution 
 * @returns {Status} 
 */
export GdipGetImageVerticalResolution(_image, resolution) {
    resolutionMarshal := resolution is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageVerticalResolution", GpImage.Ptr, _image, resolutionMarshal, resolution, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} flags 
 * @returns {Status} 
 */
export GdipGetImageFlags(_image, flags) {
    flagsMarshal := flags is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageFlags", GpImage.Ptr, _image, flagsMarshal, flags, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Guid>} format 
 * @returns {Status} 
 */
export GdipGetImageRawFormat(_image, format) {
    result := DllCall("gdiplus.dll\GdipGetImageRawFormat", GpImage.Ptr, _image, Guid.Ptr, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} format 
 * @returns {Status} 
 */
export GdipGetImagePixelFormat(_image, format) {
    formatMarshal := format is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImagePixelFormat", GpImage.Ptr, _image, formatMarshal, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} thumbWidth 
 * @param {Integer} thumbHeight 
 * @param {Pointer<Pointer<GpImage>>} thumbImage 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @returns {Status} 
 */
export GdipGetImageThumbnail(_image, thumbWidth, thumbHeight, thumbImage, callback, callbackData) {
    thumbImageMarshal := thumbImage is VarRef ? "ptr*" : "ptr"
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageThumbnail", GpImage.Ptr, _image, "uint", thumbWidth, "uint", thumbHeight, thumbImageMarshal, thumbImage, "ptr", callback, callbackDataMarshal, callbackData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Guid>} clsidEncoder 
 * @param {Pointer<Integer>} _size 
 * @returns {Status} 
 */
export GdipGetEncoderParameterListSize(_image, clsidEncoder, _size) {
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetEncoderParameterListSize", GpImage.Ptr, _image, Guid.Ptr, clsidEncoder, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Guid>} clsidEncoder 
 * @param {Integer} _size 
 * @param {Pointer<EncoderParameters>} _buffer 
 * @returns {Status} 
 */
export GdipGetEncoderParameterList(_image, clsidEncoder, _size, _buffer) {
    result := DllCall("gdiplus.dll\GdipGetEncoderParameterList", GpImage.Ptr, _image, Guid.Ptr, clsidEncoder, "uint", _size, EncoderParameters.Ptr, _buffer, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipImageGetFrameDimensionsCount(_image, count) {
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipImageGetFrameDimensionsCount", GpImage.Ptr, _image, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Guid>} dimensionIDs 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipImageGetFrameDimensionsList(_image, dimensionIDs, count) {
    result := DllCall("gdiplus.dll\GdipImageGetFrameDimensionsList", GpImage.Ptr, _image, Guid.Ptr, dimensionIDs, "uint", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Guid>} dimensionID 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipImageGetFrameCount(_image, dimensionID, count) {
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipImageGetFrameCount", GpImage.Ptr, _image, Guid.Ptr, dimensionID, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Guid>} dimensionID 
 * @param {Integer} frameIndex 
 * @returns {Status} 
 */
export GdipImageSelectActiveFrame(_image, dimensionID, frameIndex) {
    result := DllCall("gdiplus.dll\GdipImageSelectActiveFrame", GpImage.Ptr, _image, Guid.Ptr, dimensionID, "uint", frameIndex, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {RotateFlipType} rfType 
 * @returns {Status} 
 */
export GdipImageRotateFlip(_image, rfType) {
    result := DllCall("gdiplus.dll\GdipImageRotateFlip", GpImage.Ptr, _image, RotateFlipType, rfType, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<ColorPalette>} palette 
 * @param {Integer} _size 
 * @returns {Status} 
 */
export GdipGetImagePalette(_image, palette, _size) {
    result := DllCall("gdiplus.dll\GdipGetImagePalette", GpImage.Ptr, _image, ColorPalette.Ptr, palette, "int", _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<ColorPalette>} palette 
 * @returns {Status} 
 */
export GdipSetImagePalette(_image, palette) {
    result := DllCall("gdiplus.dll\GdipSetImagePalette", GpImage.Ptr, _image, ColorPalette.Ptr, palette, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} _size 
 * @returns {Status} 
 */
export GdipGetImagePaletteSize(_image, _size) {
    _sizeMarshal := _size is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImagePaletteSize", GpImage.Ptr, _image, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} numOfProperty 
 * @returns {Status} 
 */
export GdipGetPropertyCount(_image, numOfProperty) {
    numOfPropertyMarshal := numOfProperty is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPropertyCount", GpImage.Ptr, _image, numOfPropertyMarshal, numOfProperty, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} numOfProperty 
 * @param {Pointer<Integer>} list 
 * @returns {Status} 
 */
export GdipGetPropertyIdList(_image, numOfProperty, list) {
    listMarshal := list is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPropertyIdList", GpImage.Ptr, _image, "uint", numOfProperty, listMarshal, list, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} propId 
 * @param {Pointer<Integer>} _size 
 * @returns {Status} 
 */
export GdipGetPropertyItemSize(_image, propId, _size) {
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPropertyItemSize", GpImage.Ptr, _image, "uint", propId, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} propId 
 * @param {Integer} propSize 
 * @param {Pointer<PropertyItem>} _buffer 
 * @returns {Status} 
 */
export GdipGetPropertyItem(_image, propId, propSize, _buffer) {
    result := DllCall("gdiplus.dll\GdipGetPropertyItem", GpImage.Ptr, _image, "uint", propId, "uint", propSize, PropertyItem.Ptr, _buffer, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Integer>} totalBufferSize 
 * @param {Pointer<Integer>} numProperties 
 * @returns {Status} 
 */
export GdipGetPropertySize(_image, totalBufferSize, numProperties) {
    totalBufferSizeMarshal := totalBufferSize is VarRef ? "uint*" : "ptr"
    numPropertiesMarshal := numProperties is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPropertySize", GpImage.Ptr, _image, totalBufferSizeMarshal, totalBufferSize, numPropertiesMarshal, numProperties, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} totalBufferSize 
 * @param {Integer} numProperties 
 * @param {Pointer<PropertyItem>} allItems 
 * @returns {Status} 
 */
export GdipGetAllPropertyItems(_image, totalBufferSize, numProperties, allItems) {
    result := DllCall("gdiplus.dll\GdipGetAllPropertyItems", GpImage.Ptr, _image, "uint", totalBufferSize, "uint", numProperties, PropertyItem.Ptr, allItems, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} propId 
 * @returns {Status} 
 */
export GdipRemovePropertyItem(_image, propId) {
    result := DllCall("gdiplus.dll\GdipRemovePropertyItem", GpImage.Ptr, _image, "uint", propId, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<PropertyItem>} item 
 * @returns {Status} 
 */
export GdipSetPropertyItem(_image, item) {
    result := DllCall("gdiplus.dll\GdipSetPropertyItem", GpImage.Ptr, _image, PropertyItem.Ptr, item, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<ImageItemData>} item 
 * @returns {Status} 
 */
export GdipFindFirstImageItem(_image, item) {
    result := DllCall("gdiplus.dll\GdipFindFirstImageItem", GpImage.Ptr, _image, ImageItemData.Ptr, item, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<ImageItemData>} item 
 * @returns {Status} 
 */
export GdipFindNextImageItem(_image, item) {
    result := DllCall("gdiplus.dll\GdipFindNextImageItem", GpImage.Ptr, _image, ImageItemData.Ptr, item, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<ImageItemData>} item 
 * @returns {Status} 
 */
export GdipGetImageItemData(_image, item) {
    result := DllCall("gdiplus.dll\GdipGetImageItemData", GpImage.Ptr, _image, ImageItemData.Ptr, item, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} _image 
 * @returns {Status} 
 */
export GdipImageForceValidation(_image) {
    result := DllCall("gdiplus.dll\GdipImageForceValidation", GpImage.Ptr, _image, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromStream(stream, _bitmap) {
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromStream", "ptr", stream, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {PWSTR} filename 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromFile(filename, _bitmap) {
    filename := filename is String ? StrPtr(filename) : filename

    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromFile", "ptr", filename, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromStreamICM(stream, _bitmap) {
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromStreamICM", "ptr", stream, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {PWSTR} filename 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromFileICM(filename, _bitmap) {
    filename := filename is String ? StrPtr(filename) : filename

    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromFileICM", "ptr", filename, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Integer} stride 
 * @param {Integer} format 
 * @param {Pointer<Integer>} scan0 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromScan0(width, height, stride, format, scan0, _bitmap) {
    scan0Marshal := scan0 is VarRef ? "char*" : "ptr"
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromScan0", "int", width, "int", height, "int", stride, "int", format, scan0Marshal, scan0, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Pointer<GpGraphics>} target 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromGraphics(width, height, target, _bitmap) {
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromGraphics", "int", width, "int", height, GpGraphics.Ptr, target, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {IDirectDrawSurface7} surface 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromDirectDrawSurface(surface, _bitmap) {
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromDirectDrawSurface", "ptr", surface, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<BITMAPINFO>} gdiBitmapInfo 
 * @param {Pointer<Void>} gdiBitmapData 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromGdiDib(gdiBitmapInfo, gdiBitmapData, _bitmap) {
    gdiBitmapDataMarshal := gdiBitmapData is VarRef ? "ptr" : "ptr"
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromGdiDib", BITMAPINFO.Ptr, gdiBitmapInfo, gdiBitmapDataMarshal, gdiBitmapData, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {HBITMAP} _hbm 
 * @param {HPALETTE} hpal 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromHBITMAP(_hbm, hpal, _bitmap) {
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromHBITMAP", HBITMAP, _hbm, HPALETTE, hpal, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Pointer<HBITMAP>} hbmReturn 
 * @param {Integer} background 
 * @returns {Status} 
 */
export GdipCreateHBITMAPFromBitmap(_bitmap, hbmReturn, background) {
    result := DllCall("gdiplus.dll\GdipCreateHBITMAPFromBitmap", GpBitmap.Ptr, _bitmap, HBITMAP.Ptr, hbmReturn, "uint", background, Status)
    return result
}

/**
 * 
 * @param {HICON} _hicon 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromHICON(_hicon, _bitmap) {
    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromHICON", HICON, _hicon, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Pointer<HICON>} hbmReturn 
 * @returns {Status} 
 */
export GdipCreateHICONFromBitmap(_bitmap, hbmReturn) {
    result := DllCall("gdiplus.dll\GdipCreateHICONFromBitmap", GpBitmap.Ptr, _bitmap, HICON.Ptr, hbmReturn, Status)
    return result
}

/**
 * 
 * @param {HINSTANCE} _hInstance 
 * @param {PWSTR} lpBitmapName 
 * @param {Pointer<Pointer<GpBitmap>>} _bitmap 
 * @returns {Status} 
 */
export GdipCreateBitmapFromResource(_hInstance, lpBitmapName, _bitmap) {
    lpBitmapName := lpBitmapName is String ? StrPtr(lpBitmapName) : lpBitmapName

    _bitmapMarshal := _bitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateBitmapFromResource", HINSTANCE, _hInstance, "ptr", lpBitmapName, _bitmapMarshal, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Integer} format 
 * @param {Pointer<GpBitmap>} srcBitmap 
 * @param {Pointer<Pointer<GpBitmap>>} dstBitmap 
 * @returns {Status} 
 */
export GdipCloneBitmapArea(x, y, width, height, format, srcBitmap, dstBitmap) {
    dstBitmapMarshal := dstBitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneBitmapArea", "float", x, "float", y, "float", width, "float", height, "int", format, GpBitmap.Ptr, srcBitmap, dstBitmapMarshal, dstBitmap, Status)
    return result
}

/**
 * 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Integer} format 
 * @param {Pointer<GpBitmap>} srcBitmap 
 * @param {Pointer<Pointer<GpBitmap>>} dstBitmap 
 * @returns {Status} 
 */
export GdipCloneBitmapAreaI(x, y, width, height, format, srcBitmap, dstBitmap) {
    dstBitmapMarshal := dstBitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneBitmapAreaI", "int", x, "int", y, "int", width, "int", height, "int", format, GpBitmap.Ptr, srcBitmap, dstBitmapMarshal, dstBitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Pointer<Rect>} _rect 
 * @param {Integer} flags 
 * @param {Integer} format 
 * @param {Pointer<BitmapData>} lockedBitmapData 
 * @returns {Status} 
 */
export GdipBitmapLockBits(_bitmap, _rect, flags, format, lockedBitmapData) {
    result := DllCall("gdiplus.dll\GdipBitmapLockBits", GpBitmap.Ptr, _bitmap, Rect_struct.Ptr, _rect, "uint", flags, "int", format, BitmapData.Ptr, lockedBitmapData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Pointer<BitmapData>} lockedBitmapData 
 * @returns {Status} 
 */
export GdipBitmapUnlockBits(_bitmap, lockedBitmapData) {
    result := DllCall("gdiplus.dll\GdipBitmapUnlockBits", GpBitmap.Ptr, _bitmap, BitmapData.Ptr, lockedBitmapData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Pointer<Integer>} _color 
 * @returns {Status} 
 */
export GdipBitmapGetPixel(_bitmap, x, y, _color) {
    _colorMarshal := _color is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBitmapGetPixel", GpBitmap.Ptr, _bitmap, "int", x, "int", y, _colorMarshal, _color, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} _color 
 * @returns {Status} 
 */
export GdipBitmapSetPixel(_bitmap, x, y, _color) {
    result := DllCall("gdiplus.dll\GdipBitmapSetPixel", GpBitmap.Ptr, _bitmap, "int", x, "int", y, "uint", _color, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImage>} pImage 
 * @param {GdiplusAbort} pIAbort 
 * @returns {Status} 
 */
export GdipImageSetAbort(pImage, pIAbort) {
    result := DllCall("gdiplus.dll\GdipImageSetAbort", GpImage.Ptr, pImage, "ptr", pIAbort, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} pGraphics 
 * @param {GdiplusAbort} pIAbort 
 * @returns {Status} 
 */
export GdipGraphicsSetAbort(pGraphics, pIAbort) {
    result := DllCall("gdiplus.dll\GdipGraphicsSetAbort", GpGraphics.Ptr, pGraphics, "ptr", pIAbort, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} pInputBitmap 
 * @param {Integer} format 
 * @param {DitherType} _dithertype 
 * @param {PaletteType} _palettetype 
 * @param {Pointer<ColorPalette>} palette 
 * @param {Float} alphaThresholdPercent 
 * @returns {Status} 
 */
export GdipBitmapConvertFormat(pInputBitmap, format, _dithertype, _palettetype, palette, alphaThresholdPercent) {
    result := DllCall("gdiplus.dll\GdipBitmapConvertFormat", GpBitmap.Ptr, pInputBitmap, "int", format, DitherType, _dithertype, PaletteType, _palettetype, ColorPalette.Ptr, palette, "float", alphaThresholdPercent, Status)
    return result
}

/**
 * 
 * @param {Pointer<ColorPalette>} palette 
 * @param {PaletteType} _palettetype 
 * @param {Integer} optimalColors 
 * @param {BOOL} useTransparentColor 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @returns {Status} 
 */
export GdipInitializePalette(palette, _palettetype, optimalColors, useTransparentColor, _bitmap) {
    result := DllCall("gdiplus.dll\GdipInitializePalette", ColorPalette.Ptr, palette, PaletteType, _palettetype, "int", optimalColors, BOOL, useTransparentColor, GpBitmap.Ptr, _bitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Pointer<CGpEffect>} _effect 
 * @param {Pointer<RECT>} roi 
 * @param {BOOL} useAuxData 
 * @param {Pointer<Pointer<Void>>} auxData 
 * @param {Pointer<Integer>} auxDataSize 
 * @returns {Status} 
 */
export GdipBitmapApplyEffect(_bitmap, _effect, roi, useAuxData, auxData, auxDataSize) {
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"
    auxDataMarshal := auxData is VarRef ? "ptr*" : "ptr"
    auxDataSizeMarshal := auxDataSize is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBitmapApplyEffect", GpBitmap.Ptr, _bitmap, _effectMarshal, _effect, RECT.Ptr, roi, BOOL, useAuxData, auxDataMarshal, auxData, auxDataSizeMarshal, auxDataSize, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpBitmap>>} inputBitmaps 
 * @param {Integer} numInputs 
 * @param {Pointer<CGpEffect>} _effect 
 * @param {Pointer<RECT>} roi 
 * @param {Pointer<RECT>} outputRect 
 * @param {Pointer<Pointer<GpBitmap>>} outputBitmap 
 * @param {BOOL} useAuxData 
 * @param {Pointer<Pointer<Void>>} auxData 
 * @param {Pointer<Integer>} auxDataSize 
 * @returns {Status} 
 */
export GdipBitmapCreateApplyEffect(inputBitmaps, numInputs, _effect, roi, outputRect, outputBitmap, useAuxData, auxData, auxDataSize) {
    inputBitmapsMarshal := inputBitmaps is VarRef ? "ptr*" : "ptr"
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"
    outputBitmapMarshal := outputBitmap is VarRef ? "ptr*" : "ptr"
    auxDataMarshal := auxData is VarRef ? "ptr*" : "ptr"
    auxDataSizeMarshal := auxDataSize is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBitmapCreateApplyEffect", inputBitmapsMarshal, inputBitmaps, "int", numInputs, _effectMarshal, _effect, RECT.Ptr, roi, RECT.Ptr, outputRect, outputBitmapMarshal, outputBitmap, BOOL, useAuxData, auxDataMarshal, auxData, auxDataSizeMarshal, auxDataSize, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {HistogramFormat} format 
 * @param {Integer} NumberOfEntries 
 * @param {Pointer<Integer>} channel0 
 * @param {Pointer<Integer>} channel1 
 * @param {Pointer<Integer>} channel2 
 * @param {Pointer<Integer>} channel3 
 * @returns {Status} 
 */
export GdipBitmapGetHistogram(_bitmap, format, NumberOfEntries, channel0, channel1, channel2, channel3) {
    channel0Marshal := channel0 is VarRef ? "uint*" : "ptr"
    channel1Marshal := channel1 is VarRef ? "uint*" : "ptr"
    channel2Marshal := channel2 is VarRef ? "uint*" : "ptr"
    channel3Marshal := channel3 is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBitmapGetHistogram", GpBitmap.Ptr, _bitmap, HistogramFormat, format, "uint", NumberOfEntries, channel0Marshal, channel0, channel1Marshal, channel1, channel2Marshal, channel2, channel3Marshal, channel3, Status)
    return result
}

/**
 * 
 * @param {HistogramFormat} format 
 * @param {Pointer<Integer>} NumberOfEntries 
 * @returns {Status} 
 */
export GdipBitmapGetHistogramSize(format, NumberOfEntries) {
    NumberOfEntriesMarshal := NumberOfEntries is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBitmapGetHistogramSize", HistogramFormat, format, NumberOfEntriesMarshal, NumberOfEntries, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Float} xdpi 
 * @param {Float} ydpi 
 * @returns {Status} 
 */
export GdipBitmapSetResolution(_bitmap, xdpi, ydpi) {
    result := DllCall("gdiplus.dll\GdipBitmapSetResolution", GpBitmap.Ptr, _bitmap, "float", xdpi, "float", ydpi, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpImageAttributes>>} imageattr 
 * @returns {Status} 
 */
export GdipCreateImageAttributes(imageattr) {
    imageattrMarshal := imageattr is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateImageAttributes", imageattrMarshal, imageattr, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {Pointer<Pointer<GpImageAttributes>>} cloneImageattr 
 * @returns {Status} 
 */
export GdipCloneImageAttributes(imageattr, cloneImageattr) {
    cloneImageattrMarshal := cloneImageattr is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneImageAttributes", GpImageAttributes.Ptr, imageattr, cloneImageattrMarshal, cloneImageattr, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @returns {Status} 
 */
export GdipDisposeImageAttributes(imageattr) {
    result := DllCall("gdiplus.dll\GdipDisposeImageAttributes", GpImageAttributes.Ptr, imageattr, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @returns {Status} 
 */
export GdipSetImageAttributesToIdentity(imageattr, type) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesToIdentity", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @returns {Status} 
 */
export GdipResetImageAttributes(imageattr, type) {
    result := DllCall("gdiplus.dll\GdipResetImageAttributes", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {Pointer<ColorMatrix>} _colorMatrix 
 * @param {Pointer<ColorMatrix>} grayMatrix 
 * @param {ColorMatrixFlags} flags 
 * @returns {Status} 
 */
export GdipSetImageAttributesColorMatrix(imageattr, type, enableFlag, _colorMatrix, grayMatrix, flags) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesColorMatrix", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, ColorMatrix.Ptr, _colorMatrix, ColorMatrix.Ptr, grayMatrix, ColorMatrixFlags, flags, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {Float} threshold 
 * @returns {Status} 
 */
export GdipSetImageAttributesThreshold(imageattr, type, enableFlag, threshold) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesThreshold", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, "float", threshold, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {Float} gamma 
 * @returns {Status} 
 */
export GdipSetImageAttributesGamma(imageattr, type, enableFlag, gamma) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesGamma", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, "float", gamma, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @returns {Status} 
 */
export GdipSetImageAttributesNoOp(imageattr, type, enableFlag) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesNoOp", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {Integer} colorLow 
 * @param {Integer} colorHigh 
 * @returns {Status} 
 */
export GdipSetImageAttributesColorKeys(imageattr, type, enableFlag, colorLow, colorHigh) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesColorKeys", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, "uint", colorLow, "uint", colorHigh, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {ColorChannelFlags} channelFlags 
 * @returns {Status} 
 */
export GdipSetImageAttributesOutputChannel(imageattr, type, enableFlag, channelFlags) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesOutputChannel", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, ColorChannelFlags, channelFlags, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {PWSTR} colorProfileFilename 
 * @returns {Status} 
 */
export GdipSetImageAttributesOutputChannelColorProfile(imageattr, type, enableFlag, colorProfileFilename) {
    colorProfileFilename := colorProfileFilename is String ? StrPtr(colorProfileFilename) : colorProfileFilename

    result := DllCall("gdiplus.dll\GdipSetImageAttributesOutputChannelColorProfile", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, "ptr", colorProfileFilename, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {ColorAdjustType} type 
 * @param {BOOL} enableFlag 
 * @param {Integer} mapSize 
 * @param {Pointer<ColorMap>} _map 
 * @returns {Status} 
 */
export GdipSetImageAttributesRemapTable(imageattr, type, enableFlag, mapSize, _map) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesRemapTable", GpImageAttributes.Ptr, imageattr, ColorAdjustType, type, BOOL, enableFlag, "uint", mapSize, ColorMap.Ptr, _map, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageAttr 
 * @param {WrapMode} wrap 
 * @param {Integer} argb 
 * @param {BOOL} clamp 
 * @returns {Status} 
 */
export GdipSetImageAttributesWrapMode(imageAttr, wrap, argb, clamp) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesWrapMode", GpImageAttributes.Ptr, imageAttr, WrapMode, wrap, "uint", argb, BOOL, clamp, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageAttr 
 * @param {Pointer<ColorPalette>} _colorPalette 
 * @param {ColorAdjustType} _colorAdjustType 
 * @returns {Status} 
 */
export GdipGetImageAttributesAdjustedPalette(imageAttr, _colorPalette, _colorAdjustType) {
    result := DllCall("gdiplus.dll\GdipGetImageAttributesAdjustedPalette", GpImageAttributes.Ptr, imageAttr, ColorPalette.Ptr, _colorPalette, ColorAdjustType, _colorAdjustType, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {FlushIntention} intention 
 * @returns {Status} 
 */
export GdipFlush(graphics, intention) {
    result := DllCall("gdiplus.dll\GdipFlush", GpGraphics.Ptr, graphics, FlushIntention, intention, Status)
    return result
}

/**
 * 
 * @param {HDC} _hdc 
 * @param {Pointer<Pointer<GpGraphics>>} graphics 
 * @returns {Status} 
 */
export GdipCreateFromHDC(_hdc, graphics) {
    graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFromHDC", HDC, _hdc, graphicsMarshal, graphics, Status)
    return result
}

/**
 * 
 * @param {HDC} _hdc 
 * @param {HANDLE} hDevice 
 * @param {Pointer<Pointer<GpGraphics>>} graphics 
 * @returns {Status} 
 */
export GdipCreateFromHDC2(_hdc, hDevice, graphics) {
    graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFromHDC2", HDC, _hdc, HANDLE, hDevice, graphicsMarshal, graphics, Status)
    return result
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {Pointer<Pointer<GpGraphics>>} graphics 
 * @returns {Status} 
 */
export GdipCreateFromHWND(_hwnd, graphics) {
    graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFromHWND", HWND, _hwnd, graphicsMarshal, graphics, Status)
    return result
}

/**
 * 
 * @param {HWND} _hwnd 
 * @param {Pointer<Pointer<GpGraphics>>} graphics 
 * @returns {Status} 
 */
export GdipCreateFromHWNDICM(_hwnd, graphics) {
    graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFromHWNDICM", HWND, _hwnd, graphicsMarshal, graphics, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @returns {Status} 
 */
export GdipDeleteGraphics(graphics) {
    result := DllCall("gdiplus.dll\GdipDeleteGraphics", GpGraphics.Ptr, graphics, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<HDC>} _hdc 
 * @returns {Status} 
 */
export GdipGetDC(graphics, _hdc) {
    result := DllCall("gdiplus.dll\GdipGetDC", GpGraphics.Ptr, graphics, HDC.Ptr, _hdc, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {HDC} _hdc 
 * @returns {Status} 
 */
export GdipReleaseDC(graphics, _hdc) {
    result := DllCall("gdiplus.dll\GdipReleaseDC", GpGraphics.Ptr, graphics, HDC, _hdc, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {CompositingMode} _compositingMode 
 * @returns {Status} 
 */
export GdipSetCompositingMode(graphics, _compositingMode) {
    result := DllCall("gdiplus.dll\GdipSetCompositingMode", GpGraphics.Ptr, graphics, CompositingMode, _compositingMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<CompositingMode>} _compositingMode 
 * @returns {Status} 
 */
export GdipGetCompositingMode(graphics, _compositingMode) {
    _compositingModeMarshal := _compositingMode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCompositingMode", GpGraphics.Ptr, graphics, _compositingModeMarshal, _compositingMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} x 
 * @param {Integer} y 
 * @returns {Status} 
 */
export GdipSetRenderingOrigin(graphics, x, y) {
    result := DllCall("gdiplus.dll\GdipSetRenderingOrigin", GpGraphics.Ptr, graphics, "int", x, "int", y, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} x 
 * @param {Pointer<Integer>} y 
 * @returns {Status} 
 */
export GdipGetRenderingOrigin(graphics, x, y) {
    xMarshal := x is VarRef ? "int*" : "ptr"
    yMarshal := y is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetRenderingOrigin", GpGraphics.Ptr, graphics, xMarshal, x, yMarshal, y, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {CompositingQuality} _compositingQuality 
 * @returns {Status} 
 */
export GdipSetCompositingQuality(graphics, _compositingQuality) {
    result := DllCall("gdiplus.dll\GdipSetCompositingQuality", GpGraphics.Ptr, graphics, CompositingQuality, _compositingQuality, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<CompositingQuality>} _compositingQuality 
 * @returns {Status} 
 */
export GdipGetCompositingQuality(graphics, _compositingQuality) {
    _compositingQualityMarshal := _compositingQuality is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCompositingQuality", GpGraphics.Ptr, graphics, _compositingQualityMarshal, _compositingQuality, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {SmoothingMode} _smoothingMode 
 * @returns {Status} 
 */
export GdipSetSmoothingMode(graphics, _smoothingMode) {
    result := DllCall("gdiplus.dll\GdipSetSmoothingMode", GpGraphics.Ptr, graphics, SmoothingMode, _smoothingMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<SmoothingMode>} _smoothingMode 
 * @returns {Status} 
 */
export GdipGetSmoothingMode(graphics, _smoothingMode) {
    _smoothingModeMarshal := _smoothingMode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetSmoothingMode", GpGraphics.Ptr, graphics, _smoothingModeMarshal, _smoothingMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {PixelOffsetMode} _pixelOffsetMode 
 * @returns {Status} 
 */
export GdipSetPixelOffsetMode(graphics, _pixelOffsetMode) {
    result := DllCall("gdiplus.dll\GdipSetPixelOffsetMode", GpGraphics.Ptr, graphics, PixelOffsetMode, _pixelOffsetMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<PixelOffsetMode>} _pixelOffsetMode 
 * @returns {Status} 
 */
export GdipGetPixelOffsetMode(graphics, _pixelOffsetMode) {
    _pixelOffsetModeMarshal := _pixelOffsetMode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPixelOffsetMode", GpGraphics.Ptr, graphics, _pixelOffsetModeMarshal, _pixelOffsetMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {TextRenderingHint} _mode 
 * @returns {Status} 
 */
export GdipSetTextRenderingHint(graphics, _mode) {
    result := DllCall("gdiplus.dll\GdipSetTextRenderingHint", GpGraphics.Ptr, graphics, TextRenderingHint, _mode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<TextRenderingHint>} _mode 
 * @returns {Status} 
 */
export GdipGetTextRenderingHint(graphics, _mode) {
    _modeMarshal := _mode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetTextRenderingHint", GpGraphics.Ptr, graphics, _modeMarshal, _mode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} contrast 
 * @returns {Status} 
 */
export GdipSetTextContrast(graphics, contrast) {
    result := DllCall("gdiplus.dll\GdipSetTextContrast", GpGraphics.Ptr, graphics, "uint", contrast, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} contrast 
 * @returns {Status} 
 */
export GdipGetTextContrast(graphics, contrast) {
    contrastMarshal := contrast is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetTextContrast", GpGraphics.Ptr, graphics, contrastMarshal, contrast, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {InterpolationMode} _interpolationMode 
 * @returns {Status} 
 */
export GdipSetInterpolationMode(graphics, _interpolationMode) {
    result := DllCall("gdiplus.dll\GdipSetInterpolationMode", GpGraphics.Ptr, graphics, InterpolationMode, _interpolationMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<InterpolationMode>} _interpolationMode 
 * @returns {Status} 
 */
export GdipGetInterpolationMode(graphics, _interpolationMode) {
    _interpolationModeMarshal := _interpolationMode is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetInterpolationMode", GpGraphics.Ptr, graphics, _interpolationModeMarshal, _interpolationMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipSetWorldTransform(graphics, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetWorldTransform", GpGraphics.Ptr, graphics, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @returns {Status} 
 */
export GdipResetWorldTransform(graphics) {
    result := DllCall("gdiplus.dll\GdipResetWorldTransform", GpGraphics.Ptr, graphics, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Matrix>} _matrix 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipMultiplyWorldTransform(graphics, _matrix, order) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMultiplyWorldTransform", GpGraphics.Ptr, graphics, _matrixMarshal, _matrix, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} dx 
 * @param {Float} dy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipTranslateWorldTransform(graphics, dx, dy, order) {
    result := DllCall("gdiplus.dll\GdipTranslateWorldTransform", GpGraphics.Ptr, graphics, "float", dx, "float", dy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} sx 
 * @param {Float} sy 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipScaleWorldTransform(graphics, sx, sy, order) {
    result := DllCall("gdiplus.dll\GdipScaleWorldTransform", GpGraphics.Ptr, graphics, "float", sx, "float", sy, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} angle 
 * @param {MatrixOrder} order 
 * @returns {Status} 
 */
export GdipRotateWorldTransform(graphics, angle, order) {
    result := DllCall("gdiplus.dll\GdipRotateWorldTransform", GpGraphics.Ptr, graphics, "float", angle, MatrixOrder, order, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipGetWorldTransform(graphics, _matrix) {
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetWorldTransform", GpGraphics.Ptr, graphics, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @returns {Status} 
 */
export GdipResetPageTransform(graphics) {
    result := DllCall("gdiplus.dll\GdipResetPageTransform", GpGraphics.Ptr, graphics, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Unit>} _unit 
 * @returns {Status} 
 */
export GdipGetPageUnit(graphics, _unit) {
    _unitMarshal := _unit is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPageUnit", GpGraphics.Ptr, graphics, _unitMarshal, _unit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Float>} scale 
 * @returns {Status} 
 */
export GdipGetPageScale(graphics, scale) {
    scaleMarshal := scale is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetPageScale", GpGraphics.Ptr, graphics, scaleMarshal, scale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Unit} _unit 
 * @returns {Status} 
 */
export GdipSetPageUnit(graphics, _unit) {
    result := DllCall("gdiplus.dll\GdipSetPageUnit", GpGraphics.Ptr, graphics, Unit, _unit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} scale 
 * @returns {Status} 
 */
export GdipSetPageScale(graphics, scale) {
    result := DllCall("gdiplus.dll\GdipSetPageScale", GpGraphics.Ptr, graphics, "float", scale, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Float>} dpi 
 * @returns {Status} 
 */
export GdipGetDpiX(graphics, dpi) {
    dpiMarshal := dpi is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetDpiX", GpGraphics.Ptr, graphics, dpiMarshal, dpi, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Float>} dpi 
 * @returns {Status} 
 */
export GdipGetDpiY(graphics, dpi) {
    dpiMarshal := dpi is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetDpiY", GpGraphics.Ptr, graphics, dpiMarshal, dpi, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {CoordinateSpace} destSpace 
 * @param {CoordinateSpace} srcSpace 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipTransformPoints(graphics, destSpace, srcSpace, _points, count) {
    result := DllCall("gdiplus.dll\GdipTransformPoints", GpGraphics.Ptr, graphics, CoordinateSpace, destSpace, CoordinateSpace, srcSpace, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {CoordinateSpace} destSpace 
 * @param {CoordinateSpace} srcSpace 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipTransformPointsI(graphics, destSpace, srcSpace, _points, count) {
    result := DllCall("gdiplus.dll\GdipTransformPointsI", GpGraphics.Ptr, graphics, CoordinateSpace, destSpace, CoordinateSpace, srcSpace, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} argb 
 * @returns {Status} 
 */
export GdipGetNearestColor(graphics, argb) {
    argbMarshal := argb is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetNearestColor", GpGraphics.Ptr, graphics, argbMarshal, argb, Status)
    return result
}

/**
 * 
 * @returns {HPALETTE} 
 */
export GdipCreateHalftonePalette() {
    result := DllCall("gdiplus.dll\GdipCreateHalftonePalette", HPALETTE.Owned)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} x1 
 * @param {Float} y1 
 * @param {Float} x2 
 * @param {Float} y2 
 * @returns {Status} 
 */
export GdipDrawLine(graphics, pen, x1, y1, x2, y2) {
    result := DllCall("gdiplus.dll\GdipDrawLine", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "float", x1, "float", y1, "float", x2, "float", y2, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} x1 
 * @param {Integer} y1 
 * @param {Integer} x2 
 * @param {Integer} y2 
 * @returns {Status} 
 */
export GdipDrawLineI(graphics, pen, x1, y1, x2, y2) {
    result := DllCall("gdiplus.dll\GdipDrawLineI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "int", x1, "int", y1, "int", x2, "int", y2, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawLines(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawLines", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawLinesI(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawLinesI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipDrawArc(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipDrawArc", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipDrawArcI(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipDrawArcI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} x1 
 * @param {Float} y1 
 * @param {Float} x2 
 * @param {Float} y2 
 * @param {Float} x3 
 * @param {Float} y3 
 * @param {Float} x4 
 * @param {Float} y4 
 * @returns {Status} 
 */
export GdipDrawBezier(graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4) {
    result := DllCall("gdiplus.dll\GdipDrawBezier", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "float", x1, "float", y1, "float", x2, "float", y2, "float", x3, "float", y3, "float", x4, "float", y4, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} x1 
 * @param {Integer} y1 
 * @param {Integer} x2 
 * @param {Integer} y2 
 * @param {Integer} x3 
 * @param {Integer} y3 
 * @param {Integer} x4 
 * @param {Integer} y4 
 * @returns {Status} 
 */
export GdipDrawBezierI(graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4) {
    result := DllCall("gdiplus.dll\GdipDrawBezierI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawBeziers(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawBeziers", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawBeziersI(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawBeziersI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipDrawRectangle(graphics, pen, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipDrawRectangle", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipDrawRectangleI(graphics, pen, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipDrawRectangleI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<RectF>} rects 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawRectangles(graphics, pen, rects, count) {
    result := DllCall("gdiplus.dll\GdipDrawRectangles", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, RectF.Ptr, rects, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Rect>} rects 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawRectanglesI(graphics, pen, rects, count) {
    result := DllCall("gdiplus.dll\GdipDrawRectanglesI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Rect_struct.Ptr, rects, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipDrawEllipse(graphics, pen, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipDrawEllipse", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipDrawEllipseI(graphics, pen, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipDrawEllipseI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipDrawPie(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipDrawPie", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipDrawPieI(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipDrawPieI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawPolygon(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawPolygon", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawPolygonI(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawPolygonI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipDrawPath(graphics, pen, _path) {
    result := DllCall("gdiplus.dll\GdipDrawPath", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawCurve(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawCurve", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawCurveI(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawCurveI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipDrawCurve2(graphics, pen, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipDrawCurve2", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipDrawCurve2I(graphics, pen, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipDrawCurve2I", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Integer} offset 
 * @param {Integer} numberOfSegments 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipDrawCurve3(graphics, pen, _points, count, offset, numberOfSegments, tension) {
    result := DllCall("gdiplus.dll\GdipDrawCurve3", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Integer} offset 
 * @param {Integer} numberOfSegments 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipDrawCurve3I(graphics, pen, _points, count, offset, numberOfSegments, tension) {
    result := DllCall("gdiplus.dll\GdipDrawCurve3I", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawClosedCurve(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawClosedCurve", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawClosedCurveI(graphics, pen, _points, count) {
    result := DllCall("gdiplus.dll\GdipDrawClosedCurveI", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipDrawClosedCurve2(graphics, pen, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipDrawClosedCurve2", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, PointF.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPen>} pen 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @returns {Status} 
 */
export GdipDrawClosedCurve2I(graphics, pen, _points, count, tension) {
    result := DllCall("gdiplus.dll\GdipDrawClosedCurve2I", GpGraphics.Ptr, graphics, GpPen.Ptr, pen, Point.Ptr, _points, "int", count, "float", tension, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} _color 
 * @returns {Status} 
 */
export GdipGraphicsClear(graphics, _color) {
    result := DllCall("gdiplus.dll\GdipGraphicsClear", GpGraphics.Ptr, graphics, "uint", _color, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipFillRectangle(graphics, brush, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipFillRectangle", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipFillRectangleI(graphics, brush, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipFillRectangleI", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<RectF>} rects 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipFillRectangles(graphics, brush, rects, count) {
    result := DllCall("gdiplus.dll\GdipFillRectangles", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, RectF.Ptr, rects, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<Rect>} rects 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipFillRectanglesI(graphics, brush, rects, count) {
    result := DllCall("gdiplus.dll\GdipFillRectanglesI", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, Rect_struct.Ptr, rects, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {FillMode} _fillMode 
 * @returns {Status} 
 */
export GdipFillPolygon(graphics, brush, _points, count, _fillMode) {
    result := DllCall("gdiplus.dll\GdipFillPolygon", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, PointF.Ptr, _points, "int", count, FillMode, _fillMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {FillMode} _fillMode 
 * @returns {Status} 
 */
export GdipFillPolygonI(graphics, brush, _points, count, _fillMode) {
    result := DllCall("gdiplus.dll\GdipFillPolygonI", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, Point.Ptr, _points, "int", count, FillMode, _fillMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipFillPolygon2(graphics, brush, _points, count) {
    result := DllCall("gdiplus.dll\GdipFillPolygon2", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipFillPolygon2I(graphics, brush, _points, count) {
    result := DllCall("gdiplus.dll\GdipFillPolygon2I", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipFillEllipse(graphics, brush, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipFillEllipse", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipFillEllipseI(graphics, brush, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipFillEllipseI", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipFillPie(graphics, brush, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipFillPie", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Float} startAngle 
 * @param {Float} sweepAngle 
 * @returns {Status} 
 */
export GdipFillPieI(graphics, brush, x, y, width, height, startAngle, sweepAngle) {
    result := DllCall("gdiplus.dll\GdipFillPieI", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<GpPath>} _path 
 * @returns {Status} 
 */
export GdipFillPath(graphics, brush, _path) {
    result := DllCall("gdiplus.dll\GdipFillPath", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, GpPath.Ptr, _path, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipFillClosedCurve(graphics, brush, _points, count) {
    result := DllCall("gdiplus.dll\GdipFillClosedCurve", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, PointF.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipFillClosedCurveI(graphics, brush, _points, count) {
    result := DllCall("gdiplus.dll\GdipFillClosedCurveI", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, Point.Ptr, _points, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @param {FillMode} _fillMode 
 * @returns {Status} 
 */
export GdipFillClosedCurve2(graphics, brush, _points, count, tension, _fillMode) {
    result := DllCall("gdiplus.dll\GdipFillClosedCurve2", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, PointF.Ptr, _points, "int", count, "float", tension, FillMode, _fillMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Float} tension 
 * @param {FillMode} _fillMode 
 * @returns {Status} 
 */
export GdipFillClosedCurve2I(graphics, brush, _points, count, tension, _fillMode) {
    result := DllCall("gdiplus.dll\GdipFillClosedCurve2I", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, Point.Ptr, _points, "int", count, "float", tension, FillMode, _fillMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<GpRegion>} _region 
 * @returns {Status} 
 */
export GdipFillRegion(graphics, brush, _region) {
    result := DllCall("gdiplus.dll\GdipFillRegion", GpGraphics.Ptr, graphics, GpBrush.Ptr, brush, GpRegion.Ptr, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<RectF>} source 
 * @param {Pointer<Matrix>} _xForm 
 * @param {Pointer<CGpEffect>} _effect 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Unit} srcUnit 
 * @returns {Status} 
 */
export GdipDrawImageFX(graphics, _image, source, _xForm, _effect, imageAttributes, srcUnit) {
    _xFormMarshal := _xForm is VarRef ? "ptr*" : "ptr"
    _effectMarshal := _effect is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipDrawImageFX", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, RectF.Ptr, source, _xFormMarshal, _xForm, _effectMarshal, _effect, GpImageAttributes.Ptr, imageAttributes, Unit, srcUnit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Float} x 
 * @param {Float} y 
 * @returns {Status} 
 */
export GdipDrawImage(graphics, _image, x, y) {
    result := DllCall("gdiplus.dll\GdipDrawImage", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "float", x, "float", y, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} x 
 * @param {Integer} y 
 * @returns {Status} 
 */
export GdipDrawImageI(graphics, _image, x, y) {
    result := DllCall("gdiplus.dll\GdipDrawImageI", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "int", x, "int", y, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @returns {Status} 
 */
export GdipDrawImageRect(graphics, _image, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipDrawImageRect", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "float", x, "float", y, "float", width, "float", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @returns {Status} 
 */
export GdipDrawImageRectI(graphics, _image, x, y, width, height) {
    result := DllCall("gdiplus.dll\GdipDrawImageRectI", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "int", x, "int", y, "int", width, "int", height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<PointF>} dstpoints 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawImagePoints(graphics, _image, dstpoints, count) {
    result := DllCall("gdiplus.dll\GdipDrawImagePoints", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, PointF.Ptr, dstpoints, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Point>} dstpoints 
 * @param {Integer} count 
 * @returns {Status} 
 */
export GdipDrawImagePointsI(graphics, _image, dstpoints, count) {
    result := DllCall("gdiplus.dll\GdipDrawImagePointsI", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, Point.Ptr, dstpoints, "int", count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} srcx 
 * @param {Float} srcy 
 * @param {Float} srcwidth 
 * @param {Float} srcheight 
 * @param {Unit} srcUnit 
 * @returns {Status} 
 */
export GdipDrawImagePointRect(graphics, _image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit) {
    result := DllCall("gdiplus.dll\GdipDrawImagePointRect", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "float", x, "float", y, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, Unit, srcUnit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} srcx 
 * @param {Integer} srcy 
 * @param {Integer} srcwidth 
 * @param {Integer} srcheight 
 * @param {Unit} srcUnit 
 * @returns {Status} 
 */
export GdipDrawImagePointRectI(graphics, _image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit) {
    result := DllCall("gdiplus.dll\GdipDrawImagePointRectI", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "int", x, "int", y, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, Unit, srcUnit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Float} dstx 
 * @param {Float} dsty 
 * @param {Float} dstwidth 
 * @param {Float} dstheight 
 * @param {Float} srcx 
 * @param {Float} srcy 
 * @param {Float} srcwidth 
 * @param {Float} srcheight 
 * @param {Unit} srcUnit 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @returns {Status} 
 */
export GdipDrawImageRectRect(graphics, _image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipDrawImageRectRect", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "float", dstx, "float", dsty, "float", dstwidth, "float", dstheight, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, Unit, srcUnit, GpImageAttributes.Ptr, imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Integer} dstx 
 * @param {Integer} dsty 
 * @param {Integer} dstwidth 
 * @param {Integer} dstheight 
 * @param {Integer} srcx 
 * @param {Integer} srcy 
 * @param {Integer} srcwidth 
 * @param {Integer} srcheight 
 * @param {Unit} srcUnit 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @returns {Status} 
 */
export GdipDrawImageRectRectI(graphics, _image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipDrawImageRectRectI", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, "int", dstx, "int", dsty, "int", dstwidth, "int", dstheight, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, Unit, srcUnit, GpImageAttributes.Ptr, imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<PointF>} _points 
 * @param {Integer} count 
 * @param {Float} srcx 
 * @param {Float} srcy 
 * @param {Float} srcwidth 
 * @param {Float} srcheight 
 * @param {Unit} srcUnit 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @returns {Status} 
 */
export GdipDrawImagePointsRect(graphics, _image, _points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipDrawImagePointsRect", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, PointF.Ptr, _points, "int", count, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, Unit, srcUnit, GpImageAttributes.Ptr, imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpImage>} _image 
 * @param {Pointer<Point>} _points 
 * @param {Integer} count 
 * @param {Integer} srcx 
 * @param {Integer} srcy 
 * @param {Integer} srcwidth 
 * @param {Integer} srcheight 
 * @param {Unit} srcUnit 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @returns {Status} 
 */
export GdipDrawImagePointsRectI(graphics, _image, _points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipDrawImagePointsRectI", GpGraphics.Ptr, graphics, GpImage.Ptr, _image, Point.Ptr, _points, "int", count, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, Unit, srcUnit, GpImageAttributes.Ptr, imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<PointF>} destPoint 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileDestPoint(graphics, _metafile, destPoint, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPoint", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, PointF.Ptr, destPoint, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Point>} destPoint 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileDestPointI(graphics, _metafile, destPoint, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPointI", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, Point.Ptr, destPoint, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<RectF>} destRect 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileDestRect(graphics, _metafile, destRect, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestRect", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, RectF.Ptr, destRect, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Rect>} destRect 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileDestRectI(graphics, _metafile, destRect, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestRectI", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, Rect_struct.Ptr, destRect, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<PointF>} destPoints 
 * @param {Integer} count 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileDestPoints(graphics, _metafile, destPoints, count, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPoints", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, PointF.Ptr, destPoints, "int", count, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Point>} destPoints 
 * @param {Integer} count 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileDestPointsI(graphics, _metafile, destPoints, count, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPointsI", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, Point.Ptr, destPoints, "int", count, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<PointF>} destPoint 
 * @param {Pointer<RectF>} srcRect 
 * @param {Unit} srcUnit 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileSrcRectDestPoint(graphics, _metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPoint", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, PointF.Ptr, destPoint, RectF.Ptr, srcRect, Unit, srcUnit, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Point>} destPoint 
 * @param {Pointer<Rect>} srcRect 
 * @param {Unit} srcUnit 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileSrcRectDestPointI(graphics, _metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPointI", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, Point.Ptr, destPoint, Rect_struct.Ptr, srcRect, Unit, srcUnit, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<RectF>} destRect 
 * @param {Pointer<RectF>} srcRect 
 * @param {Unit} srcUnit 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileSrcRectDestRect(graphics, _metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestRect", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, RectF.Ptr, destRect, RectF.Ptr, srcRect, Unit, srcUnit, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Rect>} destRect 
 * @param {Pointer<Rect>} srcRect 
 * @param {Unit} srcUnit 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileSrcRectDestRectI(graphics, _metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestRectI", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, Rect_struct.Ptr, destRect, Rect_struct.Ptr, srcRect, Unit, srcUnit, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<PointF>} destPoints 
 * @param {Integer} count 
 * @param {Pointer<RectF>} srcRect 
 * @param {Unit} srcUnit 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileSrcRectDestPoints(graphics, _metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPoints", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, PointF.Ptr, destPoints, "int", count, RectF.Ptr, srcRect, Unit, srcUnit, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Point>} destPoints 
 * @param {Integer} count 
 * @param {Pointer<Rect>} srcRect 
 * @param {Unit} srcUnit 
 * @param {Pointer} callback 
 * @param {Pointer<Void>} callbackData 
 * @param {Pointer<GpImageAttributes>} imageAttributes 
 * @returns {Status} 
 */
export GdipEnumerateMetafileSrcRectDestPointsI(graphics, _metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes) {
    callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPointsI", GpGraphics.Ptr, graphics, GpMetafile.Ptr, _metafile, Point.Ptr, destPoints, "int", count, Rect_struct.Ptr, srcRect, Unit, srcUnit, "ptr", callback, callbackDataMarshal, callbackData, GpImageAttributes.Ptr, imageAttributes, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {EmfPlusRecordType} recordType 
 * @param {Integer} flags 
 * @param {Integer} dataSize 
 * @param {Pointer<Integer>} data 
 * @returns {Status} 
 */
export GdipPlayMetafileRecord(_metafile, recordType, flags, dataSize, data) {
    dataMarshal := data is VarRef ? "char*" : "ptr"

    result := DllCall("gdiplus.dll\GdipPlayMetafileRecord", GpMetafile.Ptr, _metafile, EmfPlusRecordType, recordType, "uint", flags, "uint", dataSize, dataMarshal, data, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpGraphics>} srcgraphics 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipSetClipGraphics(graphics, srcgraphics, _combineMode) {
    result := DllCall("gdiplus.dll\GdipSetClipGraphics", GpGraphics.Ptr, graphics, GpGraphics.Ptr, srcgraphics, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipSetClipRect(graphics, x, y, width, height, _combineMode) {
    result := DllCall("gdiplus.dll\GdipSetClipRect", GpGraphics.Ptr, graphics, "float", x, "float", y, "float", width, "float", height, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipSetClipRectI(graphics, x, y, width, height, _combineMode) {
    result := DllCall("gdiplus.dll\GdipSetClipRectI", GpGraphics.Ptr, graphics, "int", x, "int", y, "int", width, "int", height, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpPath>} _path 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipSetClipPath(graphics, _path, _combineMode) {
    result := DllCall("gdiplus.dll\GdipSetClipPath", GpGraphics.Ptr, graphics, GpPath.Ptr, _path, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpRegion>} _region 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipSetClipRegion(graphics, _region, _combineMode) {
    result := DllCall("gdiplus.dll\GdipSetClipRegion", GpGraphics.Ptr, graphics, GpRegion.Ptr, _region, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {HRGN} _hRgn 
 * @param {CombineMode} _combineMode 
 * @returns {Status} 
 */
export GdipSetClipHrgn(graphics, _hRgn, _combineMode) {
    result := DllCall("gdiplus.dll\GdipSetClipHrgn", GpGraphics.Ptr, graphics, HRGN, _hRgn, CombineMode, _combineMode, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @returns {Status} 
 */
export GdipResetClip(graphics) {
    result := DllCall("gdiplus.dll\GdipResetClip", GpGraphics.Ptr, graphics, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} dx 
 * @param {Float} dy 
 * @returns {Status} 
 */
export GdipTranslateClip(graphics, dx, dy) {
    result := DllCall("gdiplus.dll\GdipTranslateClip", GpGraphics.Ptr, graphics, "float", dx, "float", dy, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} dx 
 * @param {Integer} dy 
 * @returns {Status} 
 */
export GdipTranslateClipI(graphics, dx, dy) {
    result := DllCall("gdiplus.dll\GdipTranslateClipI", GpGraphics.Ptr, graphics, "int", dx, "int", dy, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpRegion>} _region 
 * @returns {Status} 
 */
export GdipGetClip(graphics, _region) {
    result := DllCall("gdiplus.dll\GdipGetClip", GpGraphics.Ptr, graphics, GpRegion.Ptr, _region, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<RectF>} _rect 
 * @returns {Status} 
 */
export GdipGetClipBounds(graphics, _rect) {
    result := DllCall("gdiplus.dll\GdipGetClipBounds", GpGraphics.Ptr, graphics, RectF.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Rect>} _rect 
 * @returns {Status} 
 */
export GdipGetClipBoundsI(graphics, _rect) {
    result := DllCall("gdiplus.dll\GdipGetClipBoundsI", GpGraphics.Ptr, graphics, Rect_struct.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsClipEmpty(graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsClipEmpty", GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<RectF>} _rect 
 * @returns {Status} 
 */
export GdipGetVisibleClipBounds(graphics, _rect) {
    result := DllCall("gdiplus.dll\GdipGetVisibleClipBounds", GpGraphics.Ptr, graphics, RectF.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Rect>} _rect 
 * @returns {Status} 
 */
export GdipGetVisibleClipBoundsI(graphics, _rect) {
    result := DllCall("gdiplus.dll\GdipGetVisibleClipBoundsI", GpGraphics.Ptr, graphics, Rect_struct.Ptr, _rect, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleClipEmpty(graphics, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleClipEmpty", GpGraphics.Ptr, graphics, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisiblePoint(graphics, x, y, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisiblePoint", GpGraphics.Ptr, graphics, "float", x, "float", y, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisiblePointI(graphics, x, y, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisiblePointI", GpGraphics.Ptr, graphics, "int", x, "int", y, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Float} x 
 * @param {Float} y 
 * @param {Float} width 
 * @param {Float} height 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleRect(graphics, x, y, width, height, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleRect", GpGraphics.Ptr, graphics, "float", x, "float", y, "float", width, "float", height, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} x 
 * @param {Integer} y 
 * @param {Integer} width 
 * @param {Integer} height 
 * @param {Pointer<BOOL>} result 
 * @returns {Status} 
 */
export GdipIsVisibleRectI(graphics, x, y, width, height, result) {
    resultMarshal := result is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsVisibleRectI", GpGraphics.Ptr, graphics, "int", x, "int", y, "int", width, "int", height, resultMarshal, result, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} state 
 * @returns {Status} 
 */
export GdipSaveGraphics(graphics, state) {
    stateMarshal := state is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSaveGraphics", GpGraphics.Ptr, graphics, stateMarshal, state, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} state 
 * @returns {Status} 
 */
export GdipRestoreGraphics(graphics, state) {
    result := DllCall("gdiplus.dll\GdipRestoreGraphics", GpGraphics.Ptr, graphics, "uint", state, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<RectF>} dstrect 
 * @param {Pointer<RectF>} srcrect 
 * @param {Unit} _unit 
 * @param {Pointer<Integer>} state 
 * @returns {Status} 
 */
export GdipBeginContainer(graphics, dstrect, srcrect, _unit, state) {
    stateMarshal := state is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBeginContainer", GpGraphics.Ptr, graphics, RectF.Ptr, dstrect, RectF.Ptr, srcrect, Unit, _unit, stateMarshal, state, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Rect>} dstrect 
 * @param {Pointer<Rect>} srcrect 
 * @param {Unit} _unit 
 * @param {Pointer<Integer>} state 
 * @returns {Status} 
 */
export GdipBeginContainerI(graphics, dstrect, srcrect, _unit, state) {
    stateMarshal := state is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBeginContainerI", GpGraphics.Ptr, graphics, Rect_struct.Ptr, dstrect, Rect_struct.Ptr, srcrect, Unit, _unit, stateMarshal, state, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} state 
 * @returns {Status} 
 */
export GdipBeginContainer2(graphics, state) {
    stateMarshal := state is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipBeginContainer2", GpGraphics.Ptr, graphics, stateMarshal, state, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} state 
 * @returns {Status} 
 */
export GdipEndContainer(graphics, state) {
    result := DllCall("gdiplus.dll\GdipEndContainer", GpGraphics.Ptr, graphics, "uint", state, Status)
    return result
}

/**
 * 
 * @param {HMETAFILE} hWmf 
 * @param {Pointer<WmfPlaceableFileHeader>} _wmfPlaceableFileHeader 
 * @param {Pointer<MetafileHeader>} header 
 * @returns {Status} 
 */
export GdipGetMetafileHeaderFromWmf(hWmf, _wmfPlaceableFileHeader, header) {
    result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromWmf", HMETAFILE, hWmf, WmfPlaceableFileHeader.Ptr, _wmfPlaceableFileHeader, MetafileHeader.Ptr, header, Status)
    return result
}

/**
 * 
 * @param {HENHMETAFILE} hEmf 
 * @param {Pointer<MetafileHeader>} header 
 * @returns {Status} 
 */
export GdipGetMetafileHeaderFromEmf(hEmf, header) {
    result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromEmf", HENHMETAFILE, hEmf, MetafileHeader.Ptr, header, Status)
    return result
}

/**
 * 
 * @param {PWSTR} filename 
 * @param {Pointer<MetafileHeader>} header 
 * @returns {Status} 
 */
export GdipGetMetafileHeaderFromFile(filename, header) {
    filename := filename is String ? StrPtr(filename) : filename

    result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromFile", "ptr", filename, MetafileHeader.Ptr, header, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {Pointer<MetafileHeader>} header 
 * @returns {Status} 
 */
export GdipGetMetafileHeaderFromStream(stream, header) {
    result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromStream", "ptr", stream, MetafileHeader.Ptr, header, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<MetafileHeader>} header 
 * @returns {Status} 
 */
export GdipGetMetafileHeaderFromMetafile(_metafile, header) {
    result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromMetafile", GpMetafile.Ptr, _metafile, MetafileHeader.Ptr, header, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<HENHMETAFILE>} hEmf 
 * @returns {Status} 
 */
export GdipGetHemfFromMetafile(_metafile, hEmf) {
    result := DllCall("gdiplus.dll\GdipGetHemfFromMetafile", GpMetafile.Ptr, _metafile, HENHMETAFILE.Ptr, hEmf, Status)
    return result
}

/**
 * 
 * @param {PWSTR} filename 
 * @param {Integer} access 
 * @param {Pointer<IStream>} stream 
 * @returns {Status} 
 */
export GdipCreateStreamOnFile(filename, access, stream) {
    filename := filename is String ? StrPtr(filename) : filename

    result := DllCall("gdiplus.dll\GdipCreateStreamOnFile", "ptr", filename, "uint", access, IStream.Ptr, stream, Status)
    return result
}

/**
 * 
 * @param {HMETAFILE} hWmf 
 * @param {BOOL} deleteWmf 
 * @param {Pointer<WmfPlaceableFileHeader>} _wmfPlaceableFileHeader 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipCreateMetafileFromWmf(hWmf, deleteWmf, _wmfPlaceableFileHeader, _metafile) {
    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMetafileFromWmf", HMETAFILE, hWmf, BOOL, deleteWmf, WmfPlaceableFileHeader.Ptr, _wmfPlaceableFileHeader, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {HENHMETAFILE} hEmf 
 * @param {BOOL} deleteEmf 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipCreateMetafileFromEmf(hEmf, deleteEmf, _metafile) {
    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMetafileFromEmf", HENHMETAFILE, hEmf, BOOL, deleteEmf, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {PWSTR} _file 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipCreateMetafileFromFile(_file, _metafile) {
    _file := _file is String ? StrPtr(_file) : _file

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMetafileFromFile", "ptr", _file, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {PWSTR} _file 
 * @param {Pointer<WmfPlaceableFileHeader>} _wmfPlaceableFileHeader 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipCreateMetafileFromWmfFile(_file, _wmfPlaceableFileHeader, _metafile) {
    _file := _file is String ? StrPtr(_file) : _file

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMetafileFromWmfFile", "ptr", _file, WmfPlaceableFileHeader.Ptr, _wmfPlaceableFileHeader, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipCreateMetafileFromStream(stream, _metafile) {
    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateMetafileFromStream", "ptr", stream, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {HDC} referenceHdc 
 * @param {EmfType} type 
 * @param {Pointer<RectF>} frameRect 
 * @param {MetafileFrameUnit} frameUnit 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipRecordMetafile(referenceHdc, type, frameRect, frameUnit, description, _metafile) {
    description := description is String ? StrPtr(description) : description

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRecordMetafile", HDC, referenceHdc, EmfType, type, RectF.Ptr, frameRect, MetafileFrameUnit, frameUnit, "ptr", description, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {HDC} referenceHdc 
 * @param {EmfType} type 
 * @param {Pointer<Rect>} frameRect 
 * @param {MetafileFrameUnit} frameUnit 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipRecordMetafileI(referenceHdc, type, frameRect, frameUnit, description, _metafile) {
    description := description is String ? StrPtr(description) : description

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRecordMetafileI", HDC, referenceHdc, EmfType, type, Rect_struct.Ptr, frameRect, MetafileFrameUnit, frameUnit, "ptr", description, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {PWSTR} fileName 
 * @param {HDC} referenceHdc 
 * @param {EmfType} type 
 * @param {Pointer<RectF>} frameRect 
 * @param {MetafileFrameUnit} frameUnit 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipRecordMetafileFileName(fileName, referenceHdc, type, frameRect, frameUnit, description, _metafile) {
    fileName := fileName is String ? StrPtr(fileName) : fileName
    description := description is String ? StrPtr(description) : description

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRecordMetafileFileName", "ptr", fileName, HDC, referenceHdc, EmfType, type, RectF.Ptr, frameRect, MetafileFrameUnit, frameUnit, "ptr", description, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {PWSTR} fileName 
 * @param {HDC} referenceHdc 
 * @param {EmfType} type 
 * @param {Pointer<Rect>} frameRect 
 * @param {MetafileFrameUnit} frameUnit 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipRecordMetafileFileNameI(fileName, referenceHdc, type, frameRect, frameUnit, description, _metafile) {
    fileName := fileName is String ? StrPtr(fileName) : fileName
    description := description is String ? StrPtr(description) : description

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRecordMetafileFileNameI", "ptr", fileName, HDC, referenceHdc, EmfType, type, Rect_struct.Ptr, frameRect, MetafileFrameUnit, frameUnit, "ptr", description, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {HDC} referenceHdc 
 * @param {EmfType} type 
 * @param {Pointer<RectF>} frameRect 
 * @param {MetafileFrameUnit} frameUnit 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipRecordMetafileStream(stream, referenceHdc, type, frameRect, frameUnit, description, _metafile) {
    description := description is String ? StrPtr(description) : description

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRecordMetafileStream", "ptr", stream, HDC, referenceHdc, EmfType, type, RectF.Ptr, frameRect, MetafileFrameUnit, frameUnit, "ptr", description, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {IStream} stream 
 * @param {HDC} referenceHdc 
 * @param {EmfType} type 
 * @param {Pointer<Rect>} frameRect 
 * @param {MetafileFrameUnit} frameUnit 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} _metafile 
 * @returns {Status} 
 */
export GdipRecordMetafileStreamI(stream, referenceHdc, type, frameRect, frameUnit, description, _metafile) {
    description := description is String ? StrPtr(description) : description

    _metafileMarshal := _metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipRecordMetafileStreamI", "ptr", stream, HDC, referenceHdc, EmfType, type, Rect_struct.Ptr, frameRect, MetafileFrameUnit, frameUnit, "ptr", description, _metafileMarshal, _metafile, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Integer} metafileRasterizationLimitDpi 
 * @returns {Status} 
 */
export GdipSetMetafileDownLevelRasterizationLimit(_metafile, metafileRasterizationLimitDpi) {
    result := DllCall("gdiplus.dll\GdipSetMetafileDownLevelRasterizationLimit", GpMetafile.Ptr, _metafile, "uint", metafileRasterizationLimitDpi, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Integer>} metafileRasterizationLimitDpi 
 * @returns {Status} 
 */
export GdipGetMetafileDownLevelRasterizationLimit(_metafile, metafileRasterizationLimitDpi) {
    metafileRasterizationLimitDpiMarshal := metafileRasterizationLimitDpi is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetMetafileDownLevelRasterizationLimit", GpMetafile.Ptr, _metafile, metafileRasterizationLimitDpiMarshal, metafileRasterizationLimitDpi, Status)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} numDecoders 
 * @param {Pointer<Integer>} _size 
 * @returns {Status} 
 */
export GdipGetImageDecodersSize(numDecoders, _size) {
    numDecodersMarshal := numDecoders is VarRef ? "uint*" : "ptr"
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageDecodersSize", numDecodersMarshal, numDecoders, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Integer} numDecoders 
 * @param {Integer} _size 
 * @param {Integer} decoders 
 * @returns {Status} 
 */
export GdipGetImageDecoders(numDecoders, _size, decoders) {
    result := DllCall("gdiplus.dll\GdipGetImageDecoders", "uint", numDecoders, "uint", _size, "ptr", decoders, Status)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} numEncoders 
 * @param {Pointer<Integer>} _size 
 * @returns {Status} 
 */
export GdipGetImageEncodersSize(numEncoders, _size) {
    numEncodersMarshal := numEncoders is VarRef ? "uint*" : "ptr"
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetImageEncodersSize", numEncodersMarshal, numEncoders, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Integer} numEncoders 
 * @param {Integer} _size 
 * @param {Integer} encoders 
 * @returns {Status} 
 */
export GdipGetImageEncoders(numEncoders, _size, encoders) {
    result := DllCall("gdiplus.dll\GdipGetImageEncoders", "uint", numEncoders, "uint", _size, "ptr", encoders, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Integer} sizeData 
 * @param {Pointer<Integer>} data 
 * @returns {Status} 
 */
export GdipComment(graphics, sizeData, data) {
    dataMarshal := data is VarRef ? "char*" : "ptr"

    result := DllCall("gdiplus.dll\GdipComment", GpGraphics.Ptr, graphics, "uint", sizeData, dataMarshal, data, Status)
    return result
}

/**
 * 
 * @param {PWSTR} name 
 * @param {Pointer<GpFontCollection>} _fontCollection 
 * @param {Pointer<Pointer<GpFontFamily>>} _fontFamily 
 * @returns {Status} 
 */
export GdipCreateFontFamilyFromName(name, _fontCollection, _fontFamily) {
    name := name is String ? StrPtr(name) : name

    _fontFamilyMarshal := _fontFamily is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFontFamilyFromName", "ptr", name, GpFontCollection.Ptr, _fontCollection, _fontFamilyMarshal, _fontFamily, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} _fontFamily 
 * @returns {Status} 
 */
export GdipDeleteFontFamily(_fontFamily) {
    result := DllCall("gdiplus.dll\GdipDeleteFontFamily", GpFontFamily.Ptr, _fontFamily, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} _fontFamily 
 * @param {Pointer<Pointer<GpFontFamily>>} clonedFontFamily 
 * @returns {Status} 
 */
export GdipCloneFontFamily(_fontFamily, clonedFontFamily) {
    clonedFontFamilyMarshal := clonedFontFamily is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneFontFamily", GpFontFamily.Ptr, _fontFamily, clonedFontFamilyMarshal, clonedFontFamily, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpFontFamily>>} nativeFamily 
 * @returns {Status} 
 */
export GdipGetGenericFontFamilySansSerif(nativeFamily) {
    nativeFamilyMarshal := nativeFamily is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetGenericFontFamilySansSerif", nativeFamilyMarshal, nativeFamily, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpFontFamily>>} nativeFamily 
 * @returns {Status} 
 */
export GdipGetGenericFontFamilySerif(nativeFamily) {
    nativeFamilyMarshal := nativeFamily is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetGenericFontFamilySerif", nativeFamilyMarshal, nativeFamily, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpFontFamily>>} nativeFamily 
 * @returns {Status} 
 */
export GdipGetGenericFontFamilyMonospace(nativeFamily) {
    nativeFamilyMarshal := nativeFamily is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetGenericFontFamilyMonospace", nativeFamilyMarshal, nativeFamily, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} family 
 * @param {PWSTR} name 
 * @param {Integer} language 
 * @returns {Status} 
 */
export GdipGetFamilyName(family, name, language) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("gdiplus.dll\GdipGetFamilyName", GpFontFamily.Ptr, family, "ptr", name, "ushort", language, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Pointer<BOOL>} IsStyleAvailable 
 * @returns {Status} 
 */
export GdipIsStyleAvailable(family, style, IsStyleAvailable) {
    IsStyleAvailableMarshal := IsStyleAvailable is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipIsStyleAvailable", GpFontFamily.Ptr, family, "int", style, IsStyleAvailableMarshal, IsStyleAvailable, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Pointer<Integer>} EmHeight 
 * @returns {Status} 
 */
export GdipGetEmHeight(family, style, EmHeight) {
    EmHeightMarshal := EmHeight is VarRef ? "ushort*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetEmHeight", GpFontFamily.Ptr, family, "int", style, EmHeightMarshal, EmHeight, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Pointer<Integer>} CellAscent 
 * @returns {Status} 
 */
export GdipGetCellAscent(family, style, CellAscent) {
    CellAscentMarshal := CellAscent is VarRef ? "ushort*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCellAscent", GpFontFamily.Ptr, family, "int", style, CellAscentMarshal, CellAscent, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Pointer<Integer>} CellDescent 
 * @returns {Status} 
 */
export GdipGetCellDescent(family, style, CellDescent) {
    CellDescentMarshal := CellDescent is VarRef ? "ushort*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetCellDescent", GpFontFamily.Ptr, family, "int", style, CellDescentMarshal, CellDescent, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} family 
 * @param {Integer} style 
 * @param {Pointer<Integer>} LineSpacing 
 * @returns {Status} 
 */
export GdipGetLineSpacing(family, style, LineSpacing) {
    LineSpacingMarshal := LineSpacing is VarRef ? "ushort*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetLineSpacing", GpFontFamily.Ptr, family, "int", style, LineSpacingMarshal, LineSpacing, Status)
    return result
}

/**
 * 
 * @param {HDC} _hdc 
 * @param {Pointer<Pointer<GpFont>>} _font 
 * @returns {Status} 
 */
export GdipCreateFontFromDC(_hdc, _font) {
    _fontMarshal := _font is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFontFromDC", HDC, _hdc, _fontMarshal, _font, Status)
    return result
}

/**
 * 
 * @param {HDC} _hdc 
 * @param {Pointer<LOGFONTA>} logfont 
 * @param {Pointer<Pointer<GpFont>>} _font 
 * @returns {Status} 
 */
export GdipCreateFontFromLogfontA(_hdc, logfont, _font) {
    _fontMarshal := _font is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFontFromLogfontA", HDC, _hdc, LOGFONTA.Ptr, logfont, _fontMarshal, _font, Status)
    return result
}

/**
 * 
 * @param {HDC} _hdc 
 * @param {Pointer<LOGFONTW>} logfont 
 * @param {Pointer<Pointer<GpFont>>} _font 
 * @returns {Status} 
 */
export GdipCreateFontFromLogfontW(_hdc, logfont, _font) {
    _fontMarshal := _font is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFontFromLogfontW", HDC, _hdc, LOGFONTW.Ptr, logfont, _fontMarshal, _font, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontFamily>} _fontFamily 
 * @param {Float} emSize 
 * @param {Integer} style 
 * @param {Unit} _unit 
 * @param {Pointer<Pointer<GpFont>>} _font 
 * @returns {Status} 
 */
export GdipCreateFont(_fontFamily, emSize, style, _unit, _font) {
    _fontMarshal := _font is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateFont", GpFontFamily.Ptr, _fontFamily, "float", emSize, "int", style, Unit, _unit, _fontMarshal, _font, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<Pointer<GpFont>>} cloneFont 
 * @returns {Status} 
 */
export GdipCloneFont(_font, cloneFont) {
    cloneFontMarshal := cloneFont is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneFont", GpFont.Ptr, _font, cloneFontMarshal, cloneFont, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @returns {Status} 
 */
export GdipDeleteFont(_font) {
    result := DllCall("gdiplus.dll\GdipDeleteFont", GpFont.Ptr, _font, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<Pointer<GpFontFamily>>} family 
 * @returns {Status} 
 */
export GdipGetFamily(_font, family) {
    familyMarshal := family is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFamily", GpFont.Ptr, _font, familyMarshal, family, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<Integer>} style 
 * @returns {Status} 
 */
export GdipGetFontStyle(_font, style) {
    styleMarshal := style is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontStyle", GpFont.Ptr, _font, styleMarshal, style, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<Float>} _size 
 * @returns {Status} 
 */
export GdipGetFontSize(_font, _size) {
    _sizeMarshal := _size is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontSize", GpFont.Ptr, _font, _sizeMarshal, _size, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<Unit>} _unit 
 * @returns {Status} 
 */
export GdipGetFontUnit(_font, _unit) {
    _unitMarshal := _unit is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontUnit", GpFont.Ptr, _font, _unitMarshal, _unit, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Float>} height 
 * @returns {Status} 
 */
export GdipGetFontHeight(_font, graphics, height) {
    heightMarshal := height is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontHeight", GpFont.Ptr, _font, GpGraphics.Ptr, graphics, heightMarshal, height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Float} dpi 
 * @param {Pointer<Float>} height 
 * @returns {Status} 
 */
export GdipGetFontHeightGivenDPI(_font, dpi, height) {
    heightMarshal := height is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontHeightGivenDPI", GpFont.Ptr, _font, "float", dpi, heightMarshal, height, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<LOGFONTA>} _logfontA 
 * @returns {Status} 
 */
export GdipGetLogFontA(_font, graphics, _logfontA) {
    result := DllCall("gdiplus.dll\GdipGetLogFontA", GpFont.Ptr, _font, GpGraphics.Ptr, graphics, LOGFONTA.Ptr, _logfontA, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<LOGFONTW>} _logfontW 
 * @returns {Status} 
 */
export GdipGetLogFontW(_font, graphics, _logfontW) {
    result := DllCall("gdiplus.dll\GdipGetLogFontW", GpFont.Ptr, _font, GpGraphics.Ptr, graphics, LOGFONTW.Ptr, _logfontW, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpFontCollection>>} _fontCollection 
 * @returns {Status} 
 */
export GdipNewInstalledFontCollection(_fontCollection) {
    _fontCollectionMarshal := _fontCollection is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipNewInstalledFontCollection", _fontCollectionMarshal, _fontCollection, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpFontCollection>>} _fontCollection 
 * @returns {Status} 
 */
export GdipNewPrivateFontCollection(_fontCollection) {
    _fontCollectionMarshal := _fontCollection is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipNewPrivateFontCollection", _fontCollectionMarshal, _fontCollection, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpFontCollection>>} _fontCollection 
 * @returns {Status} 
 */
export GdipDeletePrivateFontCollection(_fontCollection) {
    _fontCollectionMarshal := _fontCollection is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipDeletePrivateFontCollection", _fontCollectionMarshal, _fontCollection, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontCollection>} _fontCollection 
 * @param {Pointer<Integer>} numFound 
 * @returns {Status} 
 */
export GdipGetFontCollectionFamilyCount(_fontCollection, numFound) {
    numFoundMarshal := numFound is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontCollectionFamilyCount", GpFontCollection.Ptr, _fontCollection, numFoundMarshal, numFound, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontCollection>} _fontCollection 
 * @param {Integer} numSought 
 * @param {Pointer<Pointer<GpFontFamily>>} gpfamilies 
 * @param {Pointer<Integer>} numFound 
 * @returns {Status} 
 */
export GdipGetFontCollectionFamilyList(_fontCollection, numSought, gpfamilies, numFound) {
    gpfamiliesMarshal := gpfamilies is VarRef ? "ptr*" : "ptr"
    numFoundMarshal := numFound is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetFontCollectionFamilyList", GpFontCollection.Ptr, _fontCollection, "int", numSought, gpfamiliesMarshal, gpfamilies, numFoundMarshal, numFound, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontCollection>} _fontCollection 
 * @param {PWSTR} filename 
 * @returns {Status} 
 */
export GdipPrivateAddFontFile(_fontCollection, filename) {
    filename := filename is String ? StrPtr(filename) : filename

    result := DllCall("gdiplus.dll\GdipPrivateAddFontFile", GpFontCollection.Ptr, _fontCollection, "ptr", filename, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpFontCollection>} _fontCollection 
 * @param {Pointer<Void>} memory 
 * @param {Integer} length 
 * @returns {Status} 
 */
export GdipPrivateAddMemoryFont(_fontCollection, memory, length) {
    memoryMarshal := memory is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipPrivateAddMemoryFont", GpFontCollection.Ptr, _fontCollection, memoryMarshal, memory, "int", length, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {PWSTR} _string 
 * @param {Integer} length 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<RectF>} layoutRect 
 * @param {Pointer<GpStringFormat>} stringFormat 
 * @param {Pointer<GpBrush>} brush 
 * @returns {Status} 
 */
export GdipDrawString(graphics, _string, length, _font, layoutRect, stringFormat, brush) {
    _string := _string is String ? StrPtr(_string) : _string

    result := DllCall("gdiplus.dll\GdipDrawString", GpGraphics.Ptr, graphics, "ptr", _string, "int", length, GpFont.Ptr, _font, RectF.Ptr, layoutRect, GpStringFormat.Ptr, stringFormat, GpBrush.Ptr, brush, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {PWSTR} _string 
 * @param {Integer} length 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<RectF>} layoutRect 
 * @param {Pointer<GpStringFormat>} stringFormat 
 * @param {Pointer<RectF>} boundingBox 
 * @param {Pointer<Integer>} codepointsFitted 
 * @param {Pointer<Integer>} linesFilled 
 * @returns {Status} 
 */
export GdipMeasureString(graphics, _string, length, _font, layoutRect, stringFormat, boundingBox, codepointsFitted, linesFilled) {
    _string := _string is String ? StrPtr(_string) : _string

    codepointsFittedMarshal := codepointsFitted is VarRef ? "int*" : "ptr"
    linesFilledMarshal := linesFilled is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMeasureString", GpGraphics.Ptr, graphics, "ptr", _string, "int", length, GpFont.Ptr, _font, RectF.Ptr, layoutRect, GpStringFormat.Ptr, stringFormat, RectF.Ptr, boundingBox, codepointsFittedMarshal, codepointsFitted, linesFilledMarshal, linesFilled, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {PWSTR} _string 
 * @param {Integer} length 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<RectF>} layoutRect 
 * @param {Pointer<GpStringFormat>} stringFormat 
 * @param {Integer} regionCount 
 * @param {Pointer<Pointer<GpRegion>>} regions 
 * @returns {Status} 
 */
export GdipMeasureCharacterRanges(graphics, _string, length, _font, layoutRect, stringFormat, regionCount, regions) {
    _string := _string is String ? StrPtr(_string) : _string

    regionsMarshal := regions is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMeasureCharacterRanges", GpGraphics.Ptr, graphics, "ptr", _string, "int", length, GpFont.Ptr, _font, RectF.Ptr, layoutRect, GpStringFormat.Ptr, stringFormat, "int", regionCount, regionsMarshal, regions, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} text 
 * @param {Integer} length 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<GpBrush>} brush 
 * @param {Pointer<PointF>} positions 
 * @param {Integer} flags 
 * @param {Pointer<Matrix>} _matrix 
 * @returns {Status} 
 */
export GdipDrawDriverString(graphics, text, length, _font, brush, positions, flags, _matrix) {
    textMarshal := text is VarRef ? "ushort*" : "ptr"
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipDrawDriverString", GpGraphics.Ptr, graphics, textMarshal, text, "int", length, GpFont.Ptr, _font, GpBrush.Ptr, brush, PointF.Ptr, positions, "int", flags, _matrixMarshal, _matrix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Integer>} text 
 * @param {Integer} length 
 * @param {Pointer<GpFont>} _font 
 * @param {Pointer<PointF>} positions 
 * @param {Integer} flags 
 * @param {Pointer<Matrix>} _matrix 
 * @param {Pointer<RectF>} boundingBox 
 * @returns {Status} 
 */
export GdipMeasureDriverString(graphics, text, length, _font, positions, flags, _matrix, boundingBox) {
    textMarshal := text is VarRef ? "ushort*" : "ptr"
    _matrixMarshal := _matrix is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipMeasureDriverString", GpGraphics.Ptr, graphics, textMarshal, text, "int", length, GpFont.Ptr, _font, PointF.Ptr, positions, "int", flags, _matrixMarshal, _matrix, RectF.Ptr, boundingBox, Status)
    return result
}

/**
 * 
 * @param {Integer} formatAttributes 
 * @param {Integer} language 
 * @param {Pointer<Pointer<GpStringFormat>>} format 
 * @returns {Status} 
 */
export GdipCreateStringFormat(formatAttributes, language, format) {
    formatMarshal := format is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateStringFormat", "int", formatAttributes, "ushort", language, formatMarshal, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpStringFormat>>} format 
 * @returns {Status} 
 */
export GdipStringFormatGetGenericDefault(format) {
    formatMarshal := format is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipStringFormatGetGenericDefault", formatMarshal, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<GpStringFormat>>} format 
 * @returns {Status} 
 */
export GdipStringFormatGetGenericTypographic(format) {
    formatMarshal := format is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipStringFormatGetGenericTypographic", formatMarshal, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @returns {Status} 
 */
export GdipDeleteStringFormat(format) {
    result := DllCall("gdiplus.dll\GdipDeleteStringFormat", GpStringFormat.Ptr, format, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<Pointer<GpStringFormat>>} newFormat 
 * @returns {Status} 
 */
export GdipCloneStringFormat(format, newFormat) {
    newFormatMarshal := newFormat is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCloneStringFormat", GpStringFormat.Ptr, format, newFormatMarshal, newFormat, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Integer} flags 
 * @returns {Status} 
 */
export GdipSetStringFormatFlags(format, flags) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatFlags", GpStringFormat.Ptr, format, "int", flags, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<Integer>} flags 
 * @returns {Status} 
 */
export GdipGetStringFormatFlags(format, flags) {
    flagsMarshal := flags is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatFlags", GpStringFormat.Ptr, format, flagsMarshal, flags, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {StringAlignment} align 
 * @returns {Status} 
 */
export GdipSetStringFormatAlign(format, align) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatAlign", GpStringFormat.Ptr, format, StringAlignment, align, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<StringAlignment>} align 
 * @returns {Status} 
 */
export GdipGetStringFormatAlign(format, align) {
    alignMarshal := align is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatAlign", GpStringFormat.Ptr, format, alignMarshal, align, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {StringAlignment} align 
 * @returns {Status} 
 */
export GdipSetStringFormatLineAlign(format, align) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatLineAlign", GpStringFormat.Ptr, format, StringAlignment, align, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<StringAlignment>} align 
 * @returns {Status} 
 */
export GdipGetStringFormatLineAlign(format, align) {
    alignMarshal := align is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatLineAlign", GpStringFormat.Ptr, format, alignMarshal, align, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {StringTrimming} trimming 
 * @returns {Status} 
 */
export GdipSetStringFormatTrimming(format, trimming) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatTrimming", GpStringFormat.Ptr, format, StringTrimming, trimming, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<StringTrimming>} trimming 
 * @returns {Status} 
 */
export GdipGetStringFormatTrimming(format, trimming) {
    trimmingMarshal := trimming is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatTrimming", GpStringFormat.Ptr, format, trimmingMarshal, trimming, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Integer} _hotkeyPrefix 
 * @returns {Status} 
 */
export GdipSetStringFormatHotkeyPrefix(format, _hotkeyPrefix) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatHotkeyPrefix", GpStringFormat.Ptr, format, "int", _hotkeyPrefix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<Integer>} _hotkeyPrefix 
 * @returns {Status} 
 */
export GdipGetStringFormatHotkeyPrefix(format, _hotkeyPrefix) {
    _hotkeyPrefixMarshal := _hotkeyPrefix is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatHotkeyPrefix", GpStringFormat.Ptr, format, _hotkeyPrefixMarshal, _hotkeyPrefix, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Float} firstTabOffset 
 * @param {Integer} count 
 * @param {Pointer<Float>} tabStops 
 * @returns {Status} 
 */
export GdipSetStringFormatTabStops(format, firstTabOffset, count, tabStops) {
    tabStopsMarshal := tabStops is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipSetStringFormatTabStops", GpStringFormat.Ptr, format, "float", firstTabOffset, "int", count, tabStopsMarshal, tabStops, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Integer} count 
 * @param {Pointer<Float>} firstTabOffset 
 * @param {Pointer<Float>} tabStops 
 * @returns {Status} 
 */
export GdipGetStringFormatTabStops(format, count, firstTabOffset, tabStops) {
    firstTabOffsetMarshal := firstTabOffset is VarRef ? "float*" : "ptr"
    tabStopsMarshal := tabStops is VarRef ? "float*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatTabStops", GpStringFormat.Ptr, format, "int", count, firstTabOffsetMarshal, firstTabOffset, tabStopsMarshal, tabStops, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetStringFormatTabStopCount(format, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatTabStopCount", GpStringFormat.Ptr, format, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Integer} language 
 * @param {StringDigitSubstitute} substitute 
 * @returns {Status} 
 */
export GdipSetStringFormatDigitSubstitution(format, language, substitute) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatDigitSubstitution", GpStringFormat.Ptr, format, "ushort", language, StringDigitSubstitute, substitute, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<Integer>} language 
 * @param {Pointer<StringDigitSubstitute>} substitute 
 * @returns {Status} 
 */
export GdipGetStringFormatDigitSubstitution(format, language, substitute) {
    languageMarshal := language is VarRef ? "ushort*" : "ptr"
    substituteMarshal := substitute is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatDigitSubstitution", GpStringFormat.Ptr, format, languageMarshal, language, substituteMarshal, substitute, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Pointer<Integer>} count 
 * @returns {Status} 
 */
export GdipGetStringFormatMeasurableCharacterRangeCount(format, count) {
    countMarshal := count is VarRef ? "int*" : "ptr"

    result := DllCall("gdiplus.dll\GdipGetStringFormatMeasurableCharacterRangeCount", GpStringFormat.Ptr, format, countMarshal, count, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpStringFormat>} format 
 * @param {Integer} rangeCount 
 * @param {Pointer<CharacterRange>} ranges 
 * @returns {Status} 
 */
export GdipSetStringFormatMeasurableCharacterRanges(format, rangeCount, ranges) {
    result := DllCall("gdiplus.dll\GdipSetStringFormatMeasurableCharacterRanges", GpStringFormat.Ptr, format, "int", rangeCount, CharacterRange.Ptr, ranges, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpBitmap>} _bitmap 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<Pointer<GpCachedBitmap>>} _cachedBitmap 
 * @returns {Status} 
 */
export GdipCreateCachedBitmap(_bitmap, graphics, _cachedBitmap) {
    _cachedBitmapMarshal := _cachedBitmap is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipCreateCachedBitmap", GpBitmap.Ptr, _bitmap, GpGraphics.Ptr, graphics, _cachedBitmapMarshal, _cachedBitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpCachedBitmap>} _cachedBitmap 
 * @returns {Status} 
 */
export GdipDeleteCachedBitmap(_cachedBitmap) {
    result := DllCall("gdiplus.dll\GdipDeleteCachedBitmap", GpCachedBitmap.Ptr, _cachedBitmap, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} graphics 
 * @param {Pointer<GpCachedBitmap>} _cachedBitmap 
 * @param {Integer} x 
 * @param {Integer} y 
 * @returns {Status} 
 */
export GdipDrawCachedBitmap(graphics, _cachedBitmap, x, y) {
    result := DllCall("gdiplus.dll\GdipDrawCachedBitmap", GpGraphics.Ptr, graphics, GpCachedBitmap.Ptr, _cachedBitmap, "int", x, "int", y, Status)
    return result
}

/**
 * 
 * @param {HENHMETAFILE} hemf 
 * @param {Integer} cbData16 
 * @param {Pointer<Integer>} pData16 
 * @param {Integer} iMapMode 
 * @param {Integer} eFlags 
 * @returns {Integer} 
 */
export GdipEmfToWmfBits(hemf, cbData16, pData16, iMapMode, eFlags) {
    pData16Marshal := pData16 is VarRef ? "char*" : "ptr"

    result := DllCall("gdiplus.dll\GdipEmfToWmfBits", HENHMETAFILE, hemf, "uint", cbData16, pData16Marshal, pData16, "int", iMapMode, "int", eFlags, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<GpImageAttributes>} imageattr 
 * @param {BOOL} enableFlag 
 * @returns {Status} 
 */
export GdipSetImageAttributesCachedBackground(imageattr, enableFlag) {
    result := DllCall("gdiplus.dll\GdipSetImageAttributesCachedBackground", GpImageAttributes.Ptr, imageattr, BOOL, enableFlag, Status)
    return result
}

/**
 * 
 * @param {GpTestControlEnum} control 
 * @param {Pointer<Void>} param1 
 * @returns {Status} 
 */
export GdipTestControl(control, param1) {
    param1Marshal := param1 is VarRef ? "ptr" : "ptr"

    result := DllCall("gdiplus.dll\GdipTestControl", GpTestControlEnum, control, param1Marshal, param1, Status)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} token 
 * @returns {Status} 
 */
export GdiplusNotificationHook(token) {
    tokenMarshal := token is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdiplusNotificationHook", tokenMarshal, token, Status)
    return result
}

/**
 * 
 * @param {Pointer} token 
 * @returns {String} Nothing - always returns an empty string
 */
export GdiplusNotificationUnhook(token) {
    DllCall("gdiplus.dll\GdiplusNotificationUnhook", "ptr", token)
}

/**
 * 
 * @param {Pointer<GpGraphics>} refGraphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Integer>} conversionFailureFlag 
 * @param {EmfType} _emfType 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} out_metafile 
 * @returns {Status} 
 */
export GdipConvertToEmfPlus(refGraphics, _metafile, conversionFailureFlag, _emfType, description, out_metafile) {
    description := description is String ? StrPtr(description) : description

    conversionFailureFlagMarshal := conversionFailureFlag is VarRef ? "int*" : "ptr"
    out_metafileMarshal := out_metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipConvertToEmfPlus", GpGraphics.Ptr, refGraphics, GpMetafile.Ptr, _metafile, conversionFailureFlagMarshal, conversionFailureFlag, EmfType, _emfType, "ptr", description, out_metafileMarshal, out_metafile, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} refGraphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Integer>} conversionFailureFlag 
 * @param {PWSTR} filename 
 * @param {EmfType} _emfType 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} out_metafile 
 * @returns {Status} 
 */
export GdipConvertToEmfPlusToFile(refGraphics, _metafile, conversionFailureFlag, filename, _emfType, description, out_metafile) {
    filename := filename is String ? StrPtr(filename) : filename
    description := description is String ? StrPtr(description) : description

    conversionFailureFlagMarshal := conversionFailureFlag is VarRef ? "int*" : "ptr"
    out_metafileMarshal := out_metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipConvertToEmfPlusToFile", GpGraphics.Ptr, refGraphics, GpMetafile.Ptr, _metafile, conversionFailureFlagMarshal, conversionFailureFlag, "ptr", filename, EmfType, _emfType, "ptr", description, out_metafileMarshal, out_metafile, Status)
    return result
}

/**
 * 
 * @param {Pointer<GpGraphics>} refGraphics 
 * @param {Pointer<GpMetafile>} _metafile 
 * @param {Pointer<Integer>} conversionFailureFlag 
 * @param {IStream} stream 
 * @param {EmfType} _emfType 
 * @param {PWSTR} description 
 * @param {Pointer<Pointer<GpMetafile>>} out_metafile 
 * @returns {Status} 
 */
export GdipConvertToEmfPlusToStream(refGraphics, _metafile, conversionFailureFlag, stream, _emfType, description, out_metafile) {
    description := description is String ? StrPtr(description) : description

    conversionFailureFlagMarshal := conversionFailureFlag is VarRef ? "int*" : "ptr"
    out_metafileMarshal := out_metafile is VarRef ? "ptr*" : "ptr"

    result := DllCall("gdiplus.dll\GdipConvertToEmfPlusToStream", GpGraphics.Ptr, refGraphics, GpMetafile.Ptr, _metafile, conversionFailureFlagMarshal, conversionFailureFlag, "ptr", stream, EmfType, _emfType, "ptr", description, out_metafileMarshal, out_metafile, Status)
    return result
}

;@endregion Functions
