#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CompositionFrameDisplayInstance.ahk" { CompositionFrameDisplayInstance }
#Import ".\IPresentStatistics.ahk" { IPresentStatistics }

/**
 * Describes how the system displayed an instance of a particular piece of content within a particular present.
 * @remarks
 * There may be many frames for which a present is on screen. Statistics are only reported for the first composition frame on which a present appears.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-icompositionframepresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct ICompositionFramePresentStatistics extends IPresentStatistics {
    /**
     * The interface identifier for ICompositionFramePresentStatistics
     * @type {Guid}
     */
    static IID := Guid("{ab41d127-c101-4c0a-911d-f9f2e9d08e64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositionFramePresentStatistics interfaces
    */
    struct Vtbl extends IPresentStatistics.Vtbl {
        GetContentTag           : IntPtr
        GetCompositionFrameId   : IntPtr
        GetDisplayInstanceArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositionFramePresentStatistics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag of the content on which statistics are being reporting. (ICompositionFramePresentStatistics::GetContentTag)
     * @returns {Pointer} Type: **[UINT_PTR_](/windows/desktop/winprog/windows-data-types)**
     * 
     * The tag of the content on which statistics are being reporting.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getcontenttag
     */
    GetContentTag() {
        result := ComCall(5, this, IntPtr)
        return result
    }

    /**
     * Gets the ID of the composition frame, to be used in other APIs to get more detailed information.
     * @returns {Integer} TYPE: **CompositionFrameId**
     * 
     * The ID of the composition frame, to be used in other APIs to get more detailed information.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getcompositionframeid
     */
    GetCompositionFrameId() {
        result := ComCall(6, this, Int64)
        return result
    }

    /**
     * Gets the array of display instances and its count.
     * @remarks
     * This data is valid for the lifetime of the `ICompositionFramePresentStatistics`, and should not be read after the `ICompositionFramePresentStatistics` is released.
     * @param {Pointer<Integer>} displayInstanceArrayCount Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The count of the _`displayInstanceArray`_.
     * @param {Pointer<Pointer<CompositionFrameDisplayInstance>>} displayInstanceArray Type: **[CompositionFrameDisplayInstance](ns-presentation-compositionframedisplayinstance.md) \*\***
     * 
     * The array of display instances.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-icompositionframepresentstatistics-getdisplayinstancearray
     */
    GetDisplayInstanceArray(displayInstanceArrayCount, displayInstanceArray) {
        displayInstanceArrayCountMarshal := displayInstanceArrayCount is VarRef ? "uint*" : "ptr"
        displayInstanceArrayMarshal := displayInstanceArray is VarRef ? "ptr*" : "ptr"

        ComCall(7, this, displayInstanceArrayCountMarshal, displayInstanceArrayCount, displayInstanceArrayMarshal, displayInstanceArray)
    }

    Query(iid) {
        if (ICompositionFramePresentStatistics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContentTag := CallbackCreate(GetMethod(implObj, "GetContentTag"), flags, 1)
        this.vtbl.GetCompositionFrameId := CallbackCreate(GetMethod(implObj, "GetCompositionFrameId"), flags, 1)
        this.vtbl.GetDisplayInstanceArray := CallbackCreate(GetMethod(implObj, "GetDisplayInstanceArray"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContentTag)
        CallbackFree(this.vtbl.GetCompositionFrameId)
        CallbackFree(this.vtbl.GetDisplayInstanceArray)
    }
}
