#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_CHANNEL_DEPTH.ahk" { D2D1_CHANNEL_DEPTH }
#Import ".\ID2D1TransformNode.ahk" { ID2D1TransformNode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents the set of transforms implemented by the effect-rendering system, which provides fixed-functionality.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1concretetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ConcreteTransform extends ID2D1TransformNode {
    /**
     * The interface identifier for ID2D1ConcreteTransform
     * @type {Guid}
     */
    static IID := Guid("{1a799d8a-69f7-4e4c-9fed-437ccc6684cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ConcreteTransform interfaces
    */
    struct Vtbl extends ID2D1TransformNode.Vtbl {
        SetOutputBuffer : IntPtr
        SetCached       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ConcreteTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the properties of the output buffer of the specified transform node.
     * @remarks
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-isbufferprecisionsupported">ID2D1EffectContext::IsBufferPrecisionSupported</a> method to see if buffer precision is supported.
     * 
     * The available channel depth and precision depend on the capabilities of the underlying Microsoft Direct3D device.
     * @param {D2D1_BUFFER_PRECISION} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The number of bits and the type of the output buffer.
     * @param {D2D1_CHANNEL_DEPTH} channelDepth Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_channel_depth">D2D1_CHANNEL_DEPTH</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1concretetransform-setoutputbuffer
     */
    SetOutputBuffer(bufferPrecision, channelDepth) {
        result := ComCall(4, this, D2D1_BUFFER_PRECISION, bufferPrecision, D2D1_CHANNEL_DEPTH, channelDepth, "HRESULT")
        return result
    }

    /**
     * Sets whether the output of the specified transform is cached.
     * @param {BOOL} isCached Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the output should be cached; otherwise,  <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1concretetransform-setcached
     */
    SetCached(isCached) {
        ComCall(5, this, BOOL, isCached)
    }

    Query(iid) {
        if (ID2D1ConcreteTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputBuffer := CallbackCreate(GetMethod(implObj, "SetOutputBuffer"), flags, 3)
        this.vtbl.SetCached := CallbackCreate(GetMethod(implObj, "SetCached"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputBuffer)
        CallbackFree(this.vtbl.SetCached)
    }
}
