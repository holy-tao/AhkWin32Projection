#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_CHANNEL_DEPTH.ahk" { D2D1_CHANNEL_DEPTH }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D2D1_INPUT_DESCRIPTION.ahk" { D2D1_INPUT_DESCRIPTION }

/**
 * Describes the render information common to all of the various transform implementations.
 * @remarks
 * This interface is used by a transform implementation to first describe and then indicate changes to the rendering pass that corresponds to the transform.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1renderinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1RenderInfo extends IUnknown {
    /**
     * The interface identifier for ID2D1RenderInfo
     * @type {Guid}
     */
    static IID := Guid("{519ae1bd-d19a-420d-b849-364f594776b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1RenderInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetInputDescription     : IntPtr
        SetOutputBuffer         : IntPtr
        SetCached               : IntPtr
        SetInstructionCountHint : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1RenderInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets how a specific input to the transform should be handled by the renderer in terms of sampling.
     * @remarks
     * The input description must be matched correctly by the effect shader code.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setinputdescription
     */
    SetInputDescription(inputIndex, inputDescription) {
        result := ComCall(3, this, "uint", inputIndex, D2D1_INPUT_DESCRIPTION, inputDescription, "HRESULT")
        return result
    }

    /**
     * Allows a caller to control the output precision and channel-depth of the transform in which the render information is encapsulated.
     * @remarks
     * If the output precision of the transform is not specified, then it will default to the precision specified on the Direct2D device context. The maximum of 16bpc <b>UNORM</b> and 16bpc <b>FLOAT</b> is 32bpc <b>FLOAT</b>.
     * 
     * The output channel depth will match the maximum of the input channel depths if the channel depth is <b>D2D1_CHANNEL_DEPTH_DEFAULT</b>.
     * 
     * There is no global output channel depth, this is always left to the control of the transforms.
     * @param {D2D1_BUFFER_PRECISION} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The type of buffer that should be used as an output from this transform.
     * @param {D2D1_CHANNEL_DEPTH} channelDepth Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_channel_depth">D2D1_CHANNEL_DEPTH</a></b>
     * 
     * The number of channels that will be used on the output buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setoutputbuffer
     */
    SetOutputBuffer(bufferPrecision, channelDepth) {
        result := ComCall(4, this, D2D1_BUFFER_PRECISION, bufferPrecision, D2D1_CHANNEL_DEPTH, channelDepth, "HRESULT")
        return result
    }

    /**
     * Specifies that the output of the transform in which the render information is encapsulated is or is not cached.
     * @param {BOOL} isCached Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the output of the transform is cached; otherwise, <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setcached
     */
    SetCached(isCached) {
        ComCall(5, this, BOOL, isCached)
    }

    /**
     * Provides an estimated hint of shader execution cost to D2D.
     * @remarks
     * The instruction count may be set according to the number of instructions in the shader.  This information is used as a hint when rendering extremely large images.  Calling this API is optional, but it may  improve performance if you provide an accurate number.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Instructions that occur in a loop should be counted according to the number of loop iterations.</div>
     * <div> </div>
     * @param {Integer} instructionCount Type: <b>UINT32</b>
     * 
     * An approximate instruction count of the associated shader.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setinstructioncounthint
     */
    SetInstructionCountHint(instructionCount) {
        ComCall(6, this, "uint", instructionCount)
    }

    Query(iid) {
        if (ID2D1RenderInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInputDescription := CallbackCreate(GetMethod(implObj, "SetInputDescription"), flags, 3)
        this.vtbl.SetOutputBuffer := CallbackCreate(GetMethod(implObj, "SetOutputBuffer"), flags, 3)
        this.vtbl.SetCached := CallbackCreate(GetMethod(implObj, "SetCached"), flags, 2)
        this.vtbl.SetInstructionCountHint := CallbackCreate(GetMethod(implObj, "SetInstructionCountHint"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInputDescription)
        CallbackFree(this.vtbl.SetOutputBuffer)
        CallbackFree(this.vtbl.SetCached)
        CallbackFree(this.vtbl.SetInstructionCountHint)
    }
}
