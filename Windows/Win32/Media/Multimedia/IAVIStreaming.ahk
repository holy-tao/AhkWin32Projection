#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAVIStreaming interface supports preparing open data streams for playback in streaming operations. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nn-vfw-iavistreaming
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct IAVIStreaming extends IUnknown {
    /**
     * The interface identifier for IAVIStreaming
     * @type {Guid}
     */
    static IID := Guid("{00020022-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAVIStreaming interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin : IntPtr
        End   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAVIStreaming.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Begin method prepares for the streaming operation. Called when an application uses the AVIStreamBeginStreaming function.
     * @remarks
     * For handlers written in C++, <b>Begin</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Begin(LONG lStart, LONG lEnd, LONG lRate); 
     *  
     * 
     * ```
     * @param {Integer} lStart Starting frame for streaming.
     * @param {Integer} lEnd Ending frame for streaming.
     * @param {Integer} lRate Speed at which the file is read relative to its normal playback rate. Normal speed is 1000. Larger values indicate faster speeds; smaller values indicate slower speeds.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistreaming-begin
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(3, this, "int", lStart, "int", lEnd, "int", lRate, "HRESULT")
        return result
    }

    /**
     * The End method ends the streaming operation. Called when an application uses the AVIStreamEndStreaming function.
     * @remarks
     * For handlers written in C++, <b>End</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT End(VOID); 
     *  
     * 
     * ```
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistreaming-end
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAVIStreaming.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin := CallbackCreate(GetMethod(implObj, "Begin"), flags, 4)
        this.vtbl.End := CallbackCreate(GetMethod(implObj, "End"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin)
        CallbackFree(this.vtbl.End)
    }
}
