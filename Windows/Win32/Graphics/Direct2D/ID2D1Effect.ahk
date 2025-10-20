#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Properties.ahk

/**
 * Represents a basic image-processing construct in Direct2D.
 * @remarks
 * 
  * An effect takes zero or more input images, and has an output image. The images that are input into and output from an effect are lazily evaluated. This definition is sufficient to allow an arbitrary graph of effects to be created from the application by feeding output images into the input image of the next effect in the chain.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1effect
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Effect extends ID2D1Properties{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Effect
     * @type {Guid}
     */
    static IID => Guid("{28211a43-7d89-476f-8181-2d6159b220ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInput", "SetInputCount", "GetInput", "GetInputCount", "GetOutput"]

    /**
     * 
     * @param {Integer} index 
     * @param {ID2D1Image} input 
     * @param {BOOL} invalidate 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1effect-setinput
     */
    SetInput(index, input, invalidate) {
        ComCall(14, this, "uint", index, "ptr", input, "int", invalidate)
    }

    /**
     * 
     * @param {Integer} inputCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1effect-setinputcount
     */
    SetInputCount(inputCount) {
        result := ComCall(15, this, "uint", inputCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ID2D1Image>} input 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1effect-getinput
     */
    GetInput(index, input) {
        ComCall(16, this, "uint", index, "ptr*", input)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1effect-getinputcount
     */
    GetInputCount() {
        result := ComCall(17, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Image>} outputImage 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1effect-getoutput
     */
    GetOutput(outputImage) {
        ComCall(18, this, "ptr*", outputImage)
    }
}
