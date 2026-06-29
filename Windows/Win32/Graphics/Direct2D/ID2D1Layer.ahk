#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_SIZE_F.ahk" { D2D_SIZE_F }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents the backing store required to render a layer.
 * @remarks
 * To create a layer, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createlayer(d2d1_size_f_id2d1layer)">CreateLayer</a> method of the render target where the layer will be used. To draw to a layer, push the layer to the render target stack by calling the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> method. After you have finished drawing to the layer, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a> method.
 * 
 * Between  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer">PopLayer</a> calls, the layer is in use and cannot be used by another render target. 
 * 
 * If the size of the layer is not specified, the corresponding <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> call determines the minimum layer size, based on the layer content bounds and the geometric mask. The layer resource can be larger than the size required by <b>PushLayer</b> without any rendering artifacts.
 * 
 * If the size of a layer is specified, or if the layer has been used and the required backing store size as calculated during <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer)">PushLayer</a> is larger than the layer, then the layer resource is expanded on each axis monotonically to ensure that it is large enough. The layer resource never shrinks in size.
 * 
 * <h3><a id="Creating_ID2D1Layer_Objects"></a><a id="creating_id2d1layer_objects"></a><a id="CREATING_ID2D1LAYER_OBJECTS"></a>Creating ID2D1Layer Objects</h3>
 * To create a layer, call the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createlayer(d2d1_size_f_id2d1layer)">CreateLayer</a> method of the render target where the layer will be used.
 * 
 * A layer is a device-dependent resource: your application should create layers after it initializes the render target with which the layers will be used, and recreate the layers whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1layer
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Layer extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Layer
     * @type {Guid}
     */
    static IID := Guid("{2cd9069b-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Layer interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Layer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the size of the layer in device-independent pixels.
     * @returns {D2D_SIZE_F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-size-f">D2D1_SIZE_F</a></b>
     * 
     * The size of the layer in device-independent pixels.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1layer-getsize
     */
    GetSize() {
        result := ComCall(4, this, D2D_SIZE_F)
        return result
    }

    Query(iid) {
        if (ID2D1Layer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSize)
    }
}
