#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\DVTARGETDEVICE.ahk" { DVTARGETDEVICE }
#Import ".\IViewObject.ahk" { IViewObject }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\Com\DVASPECT.ahk" { DVASPECT }

/**
 * An extension to the IViewObject interface which returns the size of the drawing for a given view of an object. You can prevent the object from being run if it isn't already running by calling this method instead of IOleObject::GetExtent.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iviewobject2
 * @namespace Windows.Win32.System.Ole
 */
export default struct IViewObject2 extends IViewObject {
    /**
     * The interface identifier for IViewObject2
     * @type {Guid}
     */
    static IID := Guid("{00000127-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewObject2 interfaces
    */
    struct Vtbl extends IViewObject.Vtbl {
        GetExtent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewObject2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the size that the specified view object will be drawn on the specified target device.
     * @remarks
     * The OLE-provided implementation of <b>IViewObject2::GetExtent</b> searches the cache for the size of the view object.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getextent">IOleObject::GetExtent</a> method in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface provides some of the same information as <b>IViewObject2::GetExtent</b>.
     * 
     * 
     * 
     * This method must return the same size as DVASPECT_CONTENT for all the new aspects in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a>. <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getextent">IOleObject::GetExtent</a> must do the same thing.
     * 
     * If one of the new aspects is requested in <i>dwAspect</i>, this method can either fail or return the same rectangle as for the DVASPECT_CONTENT aspect.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * To prevent the object from being run if it isn't already running, you can call <b>IViewObject2::GetExtent</b> rather than <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getextent">IOleObject::GetExtent</a> to determine the size of the presentation to be drawn.
     * @param {DVASPECT} dwDrawAspect Requested view of the object whose size is of interest. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a> enumerations. Note that newer objects and containers that support optimized drawing interfaces support the <b>DVASPECT2</b> enumeration values. Older objects and containers that do not support optimized drawing interfaces may not support <b>DVASPECT2</b>.
     * @param {Integer} lindex The portion of the object that is of interest. Currently, the only possible value is -1.
     * @param {Pointer<DVTARGETDEVICE>} ptd A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure defining the target device for which the object's size should be returned.
     * @returns {SIZE} A pointer to where the object's size is returned.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject2-getextent
     */
    GetExtent(dwDrawAspect, lindex, ptd) {
        lpsizel := SIZE()
        result := ComCall(9, this, DVASPECT, dwDrawAspect, "int", lindex, DVTARGETDEVICE.Ptr, ptd, SIZE.Ptr, lpsizel, "HRESULT")
        return lpsizel
    }

    Query(iid) {
        if (IViewObject2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtent := CallbackCreate(GetMethod(implObj, "GetExtent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtent)
    }
}
