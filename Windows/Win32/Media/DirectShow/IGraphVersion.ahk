#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IGraphVersion interface is implemented on the Filter Graph Manager to provide a way for plug-in distributors and applications to know when the graph has changed.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-igraphversion
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IGraphVersion extends IUnknown {
    /**
     * The interface identifier for IGraphVersion
     * @type {Guid}
     */
    static IID := Guid("{56a868ab-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGraphVersion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGraphVersion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The QueryVersion method retrieves the current graph version number.
     * @remarks
     * The version number is incremented every time there is a change in the set of filters in the graph or in their connections. If the version number has changed since the last enumeration, the graph must be re-enumerated.
     * @returns {Integer} Pointer to the current graph version.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphversion-queryversion
     */
    QueryVersion() {
        result := ComCall(3, this, "int*", &pVersion := 0, "HRESULT")
        return pVersion
    }

    Query(iid) {
        if (IGraphVersion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryVersion := CallbackCreate(GetMethod(implObj, "QueryVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryVersion)
    }
}
