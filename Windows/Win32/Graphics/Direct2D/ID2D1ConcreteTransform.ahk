#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1TransformNode.ahk

/**
 * Represents the set of transforms implemented by the effect-rendering system, which provides fixed-functionality.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1concretetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ConcreteTransform extends ID2D1TransformNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ConcreteTransform
     * @type {Guid}
     */
    static IID => Guid("{1a799d8a-69f7-4e4c-9fed-437ccc6684cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputBuffer", "SetCached"]

    /**
     * Sets the properties of the output buffer of the specified transform node.
     * @param {Integer} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The number of bits and the type of the output buffer.
     * @param {Integer} channelDepth Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_channel_depth">D2D1_CHANNEL_DEPTH</a></b>
     * 
     * The number of channels in the output buffer (1 or 4).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * <td>One or more arguments are not valid</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1concretetransform-setoutputbuffer
     */
    SetOutputBuffer(bufferPrecision, channelDepth) {
        result := ComCall(4, this, "int", bufferPrecision, "int", channelDepth, "HRESULT")
        return result
    }

    /**
     * Sets whether the output of the specified transform is cached.
     * @param {BOOL} isCached Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the output should be cached; otherwise,  <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1concretetransform-setcached
     */
    SetCached(isCached) {
        ComCall(5, this, "int", isCached)
    }
}
