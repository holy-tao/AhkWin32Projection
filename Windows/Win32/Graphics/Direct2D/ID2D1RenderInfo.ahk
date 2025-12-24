#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes the render information common to all of the various transform implementations.
 * @remarks
 * 
 * This interface is used by a transform implementation to first describe and then indicate changes to the rendering pass that corresponds to the transform.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1renderinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1RenderInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1RenderInfo
     * @type {Guid}
     */
    static IID => Guid("{519ae1bd-d19a-420d-b849-364f594776b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInputDescription", "SetOutputBuffer", "SetCached", "SetInstructionCountHint"]

    /**
     * Sets how a specific input to the transform should be handled by the renderer in terms of sampling.
     * @param {Integer} inputIndex Type: <b>UINT32</b>
     * 
     * The index of the input that will have the input description applied.
     * @param {D2D1_INPUT_DESCRIPTION} inputDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_input_description">D2D1_INPUT_DESCRIPTION</a></b>
     * 
     * The description of the input to be applied to the transform.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
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
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setinputdescription
     */
    SetInputDescription(inputIndex, inputDescription) {
        result := ComCall(3, this, "uint", inputIndex, "ptr", inputDescription, "HRESULT")
        return result
    }

    /**
     * Allows a caller to control the output precision and channel-depth of the transform in which the render information is encapsulated.
     * @param {Integer} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The type of buffer that should be used as an output from this transform.
     * @param {Integer} channelDepth Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_channel_depth">D2D1_CHANNEL_DEPTH</a></b>
     * 
     * The number of channels that will be used on the output buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setoutputbuffer
     */
    SetOutputBuffer(bufferPrecision, channelDepth) {
        result := ComCall(4, this, "int", bufferPrecision, "int", channelDepth, "HRESULT")
        return result
    }

    /**
     * Specifies that the output of the transform in which the render information is encapsulated is or is not cached.
     * @param {BOOL} isCached Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the output of the transform is cached; otherwise, <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setcached
     */
    SetCached(isCached) {
        ComCall(5, this, "int", isCached)
    }

    /**
     * Provides an estimated hint of shader execution cost to D2D.
     * @remarks
     * 
     * The instruction count may be set according to the number of instructions in the shader.  This information is used as a hint when rendering extremely large images.  Calling this API is optional, but it may  improve performance if you provide an accurate number.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Instructions that occur in a loop should be counted according to the number of loop iterations.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} instructionCount Type: <b>UINT32</b>
     * 
     * An approximate instruction count of the associated shader.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setinstructioncounthint
     */
    SetInstructionCountHint(instructionCount) {
        ComCall(6, this, "uint", instructionCount)
    }
}
