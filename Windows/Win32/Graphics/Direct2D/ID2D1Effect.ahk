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
     * Sets the given input image by index.
     * @remarks
     * 
     * If the input index is out of range, the input image is ignored.
     * 
     * 
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the image to set.
     * @param {ID2D1Image} input Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The input image to set.
     * @param {BOOL} invalidate Type: <b>BOOL</b>
     * 
     * Whether to invalidate the graph at the location of the effect input
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1effect-setinput
     */
    SetInput(index, input, invalidate) {
        ComCall(14, this, "uint", index, "ptr", input, "int", invalidate)
    }

    /**
     * Allows the application to change the number of inputs to an effect.
     * @param {Integer} inputCount Type: <b>UINT32</b>
     * 
     * The number of inputs to the effect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are invalid.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Failed to allocate necessary memory.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1effect-setinputcount
     */
    SetInputCount(inputCount) {
        result := ComCall(15, this, "uint", inputCount, "HRESULT")
        return result
    }

    /**
     * Gets the given input image by index.
     * @remarks
     * 
     * If the input index is out of range, the returned image will be <b>NULL</b>.
     * 
     * 
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the image to retrieve.
     * @param {Pointer<ID2D1Image>} input Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the image that is identified by <i>Index</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1effect-getinput
     */
    GetInput(index, input) {
        ComCall(16, this, "uint", index, "ptr*", input)
    }

    /**
     * Gets the number of inputs to the effect.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns the number of inputs to the effect.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1effect-getinputcount
     */
    GetInputCount() {
        result := ComCall(17, this, "uint")
        return result
    }

    /**
     * Gets the output image from the effect.
     * @remarks
     * 
     * The output image  can be set as an input to another effect, or can be directly passed into the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> in order to render the effect. 
     * 
     * It is  also possible to use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to retrieve the same output image.
     * 
     * 
     * @param {Pointer<ID2D1Image>} outputImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the output image for the effect.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1effect-getoutput
     */
    GetOutput(outputImage) {
        ComCall(18, this, "ptr*", outputImage)
    }
}
