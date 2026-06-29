#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }

/**
 * This interface encapsulates methods for retrieving data from the GPU asynchronously. (ID3D11Asynchronous)
 * @remarks
 * There are three types of asynchronous interfaces, all of which inherit this interface:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11query">ID3D11Query</a> - Queries information from the GPU.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a> - Determines whether a piece of geometry should be processed or not depending on the results of a previous draw call.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11counter">ID3D11Counter</a> - Measures GPU performance.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11asynchronous
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Asynchronous extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11Asynchronous
     * @type {Guid}
     */
    static IID := Guid("{4b35d0cd-1e15-4258-9c98-1b1333f6dd3b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Asynchronous interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetDataSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Asynchronous.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the size of the data (in bytes) that is output when calling ID3D11DeviceContext::GetData.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data (in bytes) that is output when calling GetData.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11asynchronous-getdatasize
     */
    GetDataSize() {
        result := ComCall(7, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D11Asynchronous.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDataSize := CallbackCreate(GetMethod(implObj, "GetDataSize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDataSize)
    }
}
