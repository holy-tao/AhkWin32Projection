#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a time-keeping object that measures the latency of the composition infrastructure used by the application and provides this data to Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationFrameInfoProvider extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationFrameInfoProvider
     * @type {Guid}
     */
    static IID := Guid("{fb759dba-6f4c-4c01-874e-19c8a05907f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationFrameInfoProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNextFrameInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationFrameInfoProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the composition timing information from the compositor.
     * @remarks
     * The system implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider">IDirectManipulationFrameInfoProvider</a> uses <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-portal">DirectComposition</a>. <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-getframestatistics">GetFrameStatistics</a> is used to calculate the parameter values for <b>GetNextFrameInfo</b>.
     * @param {Pointer<Integer>} time The current time, in milliseconds.
     * @param {Pointer<Integer>} processTime The time, in milliseconds, when the compositor begins constructing the next frame.
     * @param {Pointer<Integer>} compositionTime The time, in milliseconds, when the compositor finishes composing and drawing the next frame on the screen.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationframeinfoprovider-getnextframeinfo
     */
    GetNextFrameInfo(time, processTime, compositionTime) {
        timeMarshal := time is VarRef ? "uint*" : "ptr"
        processTimeMarshal := processTime is VarRef ? "uint*" : "ptr"
        compositionTimeMarshal := compositionTime is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, timeMarshal, time, processTimeMarshal, processTime, compositionTimeMarshal, compositionTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationFrameInfoProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNextFrameInfo := CallbackCreate(GetMethod(implObj, "GetNextFrameInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNextFrameInfo)
    }
}
