#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\ID2D1TransformNode.ahk

/**
 * Represents the base interface for all of the transforms implemented by the transform author.
 * @remarks
 * 
 * Transforms are aggregated by effect authors. This interface  provides a common interface for implementing the Shantzis rectangle calculations which is the basis for all the transform processing in Direct2D imaging extensions.  These  calculations are described in the paper <a href="https://dl.acm.org/citation.cfm?id=192191">A model for efficient and flexible image computing</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1transform
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
     * @param {Pointer<RECT>} outputRect Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle from which the inputs must be mapped.
     * @param {Integer} inputRectsCount Type: <b>UINT32</b>
     * 
     * The number of inputs specified. <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> guarantees that this is equal to the number of inputs specified on the transform.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The corresponding set of inputs. The inputs will directly correspond to the transform inputs.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapoutputrecttoinputrects
     */
    MapOutputRectToInputRects(outputRect, inputRectsCount) {
        inputRects := RECT()
        result := ComCall(4, this, "ptr", outputRect, "ptr", inputRects, "uint", inputRectsCount, "HRESULT")
        return inputRects
    }

    /**
     * Performs the inverse mapping to MapOutputRectToInputRects.
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinputrectstooutputrect
     */
    MapInputRectsToOutputRect(inputRects, inputOpaqueSubRects, inputRectCount, outputRect, outputOpaqueSubRect) {
        result := ComCall(5, this, "ptr", inputRects, "ptr", inputOpaqueSubRects, "uint", inputRectCount, "ptr", outputRect, "ptr", outputOpaqueSubRect, "HRESULT")
        return result
    }

    /**
     * Sets the input rectangles for this rendering pass into the transform.
     * @param {Integer} inputIndex Type: <b>UINT32</b>
     * 
     * The index of the input rectangle.
     * @param {RECT} invalidInputRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a></b>
     * 
     * The invalid input rectangle.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle to which the input rectangle must be mapped.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1transform-mapinvalidrect
     */
    MapInvalidRect(inputIndex, invalidInputRect) {
        invalidOutputRect := RECT()
        result := ComCall(6, this, "uint", inputIndex, "ptr", invalidInputRect, "ptr", invalidOutputRect, "HRESULT")
        return invalidOutputRect
    }
}
