#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<RECT>} outputRect 
     * @param {Pointer<RECT>} inputRects 
     * @param {Integer} inputRectsCount 
     * @returns {HRESULT} 
     */
    MapOutputRectToInputRects(outputRect, inputRects, inputRectsCount) {
        result := ComCall(4, this, "ptr", outputRect, "ptr", inputRects, "uint", inputRectsCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} inputRects 
     * @param {Pointer<RECT>} inputOpaqueSubRects 
     * @param {Integer} inputRectCount 
     * @param {Pointer<RECT>} outputRect 
     * @param {Pointer<RECT>} outputOpaqueSubRect 
     * @returns {HRESULT} 
     */
    MapInputRectsToOutputRect(inputRects, inputOpaqueSubRects, inputRectCount, outputRect, outputOpaqueSubRect) {
        result := ComCall(5, this, "ptr", inputRects, "ptr", inputOpaqueSubRects, "uint", inputRectCount, "ptr", outputRect, "ptr", outputOpaqueSubRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {RECT} invalidInputRect 
     * @param {Pointer<RECT>} invalidOutputRect 
     * @returns {HRESULT} 
     */
    MapInvalidRect(inputIndex, invalidInputRect, invalidOutputRect) {
        result := ComCall(6, this, "uint", inputIndex, "ptr", invalidInputRect, "ptr", invalidOutputRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
