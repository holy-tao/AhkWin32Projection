#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMultisessionSequential.ahk" { IMultisessionSequential }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to retrieve information about the size of a writable unit on sequentially recorded media.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-imultisessionsequential2
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMultisessionSequential2 extends IMultisessionSequential {
    /**
     * The interface identifier for IMultisessionSequential2
     * @type {Guid}
     */
    static IID := Guid("{b507ca22-2204-11dd-966a-001aa01bbc58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultisessionSequential2 interfaces
    */
    struct Vtbl extends IMultisessionSequential.Vtbl {
        get_WriteUnitSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultisessionSequential2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    WriteUnitSize {
        get => this.get_WriteUnitSize()
    }

    /**
     * Retrieves the size of a writable unit on the media. (IMultisessionSequential2.get_WriteUnitSize)
     * @returns {Integer} The size of a writable unit on the media in sectors.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential2-get_writeunitsize
     */
    get_WriteUnitSize() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMultisessionSequential2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WriteUnitSize := CallbackCreate(GetMethod(implObj, "get_WriteUnitSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WriteUnitSize)
    }
}
