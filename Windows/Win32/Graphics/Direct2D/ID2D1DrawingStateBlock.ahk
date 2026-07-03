#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_DRAWING_STATE_DESCRIPTION.ahk" { D2D1_DRAWING_STATE_DESCRIPTION }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import "..\DirectWrite\IDWriteRenderingParams.ahk" { IDWriteRenderingParams }

/**
 * Represents the drawing state of a render target:\_the antialiasing mode, transform, tags, and text-rendering options.
 * @remarks
 * <h3><a id="Creating_ID2D1DrawingStateBlock_Objects"></a><a id="creating_id2d1drawingstateblock_objects"></a><a id="CREATING_ID2D1DRAWINGSTATEBLOCK_OBJECTS"></a>Creating ID2D1DrawingStateBlock Objects</h3>
 * To create an <b>ID2D1DrawingStateBlock</b>, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1factory-createdrawingstateblock">ID2D1Factory::CreateDrawingStateBlock</a> method.
 * 
 * A drawing state block is a device-independent resource; you can create it once and retain it for the life of your application. For more information about resources, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1drawingstateblock
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DrawingStateBlock extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1DrawingStateBlock
     * @type {Guid}
     */
    static IID := Guid("{28506e39-ebf6-46a1-bb47-fd85565ab957}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DrawingStateBlock interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetDescription         : IntPtr
        SetDescription         : IntPtr
        SetTextRenderingParams : IntPtr
        GetTextRenderingParams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DrawingStateBlock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the antialiasing mode, transform, and tags portion of the drawing state.
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION>} stateDescription Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_drawing_state_description">D2D1_DRAWING_STATE_DESCRIPTION</a>*</b>
     * 
     * When this method returns, contains the antialiasing mode, transform, and tags portion of the drawing state. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1drawingstateblock-getdescription
     */
    GetDescription(stateDescription) {
        ComCall(4, this, D2D1_DRAWING_STATE_DESCRIPTION.Ptr, stateDescription)
    }

    /**
     * Specifies the antialiasing mode, transform, and tags portion of the drawing state.
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION>} stateDescription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1drawingstateblock-setdescription
     */
    SetDescription(stateDescription) {
        ComCall(5, this, D2D1_DRAWING_STATE_DESCRIPTION.Ptr, stateDescription)
    }

    /**
     * Specifies the text-rendering configuration of the drawing state.
     * @param {IDWriteRenderingParams} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * The text-rendering configuration of the drawing state, or NULL to use default settings.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1drawingstateblock-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        ComCall(6, this, "ptr", textRenderingParams)
    }

    /**
     * Retrieves the text-rendering configuration of the drawing state.
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a> object that describes the text-rendering configuration of the drawing state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1drawingstateblock-gettextrenderingparams
     */
    GetTextRenderingParams(textRenderingParams) {
        ComCall(7, this, IDWriteRenderingParams.Ptr, textRenderingParams)
    }

    Query(iid) {
        if (ID2D1DrawingStateBlock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.SetDescription := CallbackCreate(GetMethod(implObj, "SetDescription"), flags, 2)
        this.vtbl.SetTextRenderingParams := CallbackCreate(GetMethod(implObj, "SetTextRenderingParams"), flags, 2)
        this.vtbl.GetTextRenderingParams := CallbackCreate(GetMethod(implObj, "GetTextRenderingParams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.SetDescription)
        CallbackFree(this.vtbl.SetTextRenderingParams)
        CallbackFree(this.vtbl.GetTextRenderingParams)
    }
}
