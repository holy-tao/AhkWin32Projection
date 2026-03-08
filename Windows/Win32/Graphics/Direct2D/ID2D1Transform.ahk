#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\ID2D1TransformNode.ahk

/**
 * Represents the base interface for all of the transforms implemented by the transform author.
 * @remarks
 * Transforms are aggregated by effect authors. This interface  provides a common interface for implementing the Shantzis rectangle calculations which is the basis for all the transform processing in Direct2D imaging extensions.  These  calculations are described in the paper <a href="https://dl.acm.org/citation.cfm?id=192191">A model for efficient and flexible image computing</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Transform extends ID2D1TransformNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Transform
     * @type {Guid}
     */
    static IID => Guid("{ef1a287d-342a-4f76-8fdb-da0d6ea9f92b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapOutputRectToInputRects", "MapInputRectsToOutputRect", "MapInvalidRect"]

    /**
     * Allows a transform to state how it would map a rectangle requested on its output to a set of sample rectangles on its input.
     * @remarks
     * The transform implementation must ensure that any pixel shader or software callback implementation it provides honors this calculation.
     * 
     * The transform implementation must regard this method as purely functional. It can base the mapped input and output rectangles on its current state as specified by the encapsulating effect properties.    However, it must not change its own state in response to this method being invoked. The <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> renderer implementation reserves the right to call this method at any time and in any sequence.
     * @param {Pointer<RECT>} outputRect Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle from which the inputs must be mapped.
     * @param {Integer} inputRectsCount Type: <b>UINT32</b>
     * 
     * The number of inputs specified. <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> guarantees that this is equal to the number of inputs specified on the transform.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The corresponding set of inputs. The inputs will directly correspond to the transform inputs.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapoutputrecttoinputrects
     */
    MapOutputRectToInputRects(outputRect, inputRectsCount) {
        inputRects := RECT()
        result := ComCall(4, this, "ptr", outputRect, "ptr", inputRects, "uint", inputRectsCount, "HRESULT")
        return inputRects
    }

    /**
     * Performs the inverse mapping to MapOutputRectToInputRects.
     * @remarks
     * The transform implementation must ensure that any pixel shader or software callback implementation it provides honors this calculation.
     * 
     * Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapoutputrecttoinputrects">MapOutputRectToInputRects</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinvalidrect">MapInvalidRect</a> functions, this method is explicitly called by the renderer at a determined place in its rendering algorithm. The transform implementation may change its state based on the input rectangles and use this information to control its rendering information. This method is always called before the <b>MapInvalidRect</b> and <b>MapOutputRectToInputRects</b> methods of the transform.
     * @param {Pointer<RECT>} inputRects Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * An array of input rectangles to be mapped to the output rectangle.  The <i>inputRects</i> parameter is always equal to the input bounds.
     * @param {Pointer<RECT>} inputOpaqueSubRects Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * An array of input rectangles to be mapped to the opaque output rectangle.
     * @param {Integer} inputRectCount Type: <b>UINT32</b>
     * 
     * The number of inputs specified. The implementation guarantees that this is equal to the number of inputs specified on the transform.
     * @param {Pointer<RECT>} outputRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle that maps to the corresponding input rectangle.
     * @param {Pointer<RECT>} outputOpaqueSubRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle that maps to the corresponding opaque input rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinputrectstooutputrect
     */
    MapInputRectsToOutputRect(inputRects, inputOpaqueSubRects, inputRectCount, outputRect, outputOpaqueSubRect) {
        result := ComCall(5, this, "ptr", inputRects, "ptr", inputOpaqueSubRects, "uint", inputRectCount, "ptr", outputRect, "ptr", outputOpaqueSubRect, "HRESULT")
        return result
    }

    /**
     * Sets the input rectangles for this rendering pass into the transform.
     * @remarks
     * The transform implementation must regard <b>MapInvalidRect</b> as purely functional. The transform implementation can base the mapped input rectangle on the transform implementation's current state as specified by the encapsulating effect properties. But the transform implementation can't change its own state in response to a call to <b>MapInvalidRect</b>. Direct2D can call this method at any time and in any sequence following a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinputrectstooutputrect">MapInputRectsToOutputRect</a> method.
     * @param {Integer} inputIndex Type: <b>UINT32</b>
     * 
     * The index of the input rectangle.
     * @param {RECT} invalidInputRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a></b>
     * 
     * The invalid input rectangle.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle to which the input rectangle must be mapped.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinvalidrect
     */
    MapInvalidRect(inputIndex, invalidInputRect) {
        invalidOutputRect := RECT()
        result := ComCall(6, this, "uint", inputIndex, "ptr", invalidInputRect, "ptr", invalidOutputRect, "HRESULT")
        return invalidOutputRect
    }
}
