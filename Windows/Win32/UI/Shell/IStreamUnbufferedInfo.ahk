#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that determines the sector size as an aid to byte alignment.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-istreamunbufferedinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStreamUnbufferedInfo extends IUnknown {
    /**
     * The interface identifier for IStreamUnbufferedInfo
     * @type {Guid}
     */
    static IID := Guid("{8a68fdda-1fdc-4c20-8ceb-416643b5a625}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamUnbufferedInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSectorSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamUnbufferedInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of bytes per sector on the disk currently being used. When using unbuffered input/output (I/O), it is important to know the size of the sectors on the disk being read in order to ensure proper byte alignment.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns successfully, contains a pointer to a <b>ULONG</b> value that represents the number of bytes per sector for the disk.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamunbufferedinfo-getsectorsize
     */
    GetSectorSize() {
        result := ComCall(3, this, "uint*", &pcbSectorSize := 0, "HRESULT")
        return pcbSectorSize
    }

    Query(iid) {
        if (IStreamUnbufferedInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSectorSize := CallbackCreate(GetMethod(implObj, "GetSectorSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSectorSize)
    }
}
