#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to retrieve information about the current write operation. This interface is passed to the DWriteEngine2Events::Update method that you implement.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-iwriteengine2eventargs
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IWriteEngine2EventArgs extends IDispatch {
    /**
     * The interface identifier for IWriteEngine2EventArgs
     * @type {Guid}
     */
    static IID := Guid("{27354136-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWriteEngine2EventArgs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StartLba          : IntPtr
        get_SectorCount       : IntPtr
        get_LastReadLba       : IntPtr
        get_LastWrittenLba    : IntPtr
        get_TotalSystemBuffer : IntPtr
        get_UsedSystemBuffer  : IntPtr
        get_FreeSystemBuffer  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWriteEngine2EventArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    StartLba {
        get => this.get_StartLba()
    }

    /**
     * @type {Integer} 
     */
    SectorCount {
        get => this.get_SectorCount()
    }

    /**
     * @type {Integer} 
     */
    LastReadLba {
        get => this.get_LastReadLba()
    }

    /**
     * @type {Integer} 
     */
    LastWrittenLba {
        get => this.get_LastWrittenLba()
    }

    /**
     * @type {Integer} 
     */
    TotalSystemBuffer {
        get => this.get_TotalSystemBuffer()
    }

    /**
     * @type {Integer} 
     */
    UsedSystemBuffer {
        get => this.get_UsedSystemBuffer()
    }

    /**
     * @type {Integer} 
     */
    FreeSystemBuffer {
        get => this.get_FreeSystemBuffer()
    }

    /**
     * Retrieves the starting logical block address (LBA) of the current write operation.
     * @remarks
     * This is the same value passed to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-writesection">IWriteEngine2::WriteSection</a> method.
     * @returns {Integer} Starting logical block address of the write operation. Negative values for LBAs are supported.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_startlba
     */
    get_StartLba() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of sectors to write to the device in the current write operation.
     * @remarks
     * This is the same value passed to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-writesection">IWriteEngine2::WriteSection</a> method.
     * @returns {Integer} The number of sectors to write in the current write operation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_sectorcount
     */
    get_SectorCount() {
        result := ComCall(8, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the address of the sector most recently read from the burn image.
     * @returns {Integer} Logical block address of the sector most recently read from the input data stream.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_lastreadlba
     */
    get_LastReadLba() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the address of the sector most recently written to the device.
     * @returns {Integer} Logical block address of the sector most recently written to the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_lastwrittenlba
     */
    get_LastWrittenLba() {
        result := ComCall(10, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the size of the internal data buffer that is used for writing to disc.
     * @returns {Integer} Size, in bytes, of the internal data buffer that is used for writing to disc.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_totalsystembuffer
     */
    get_TotalSystemBuffer() {
        result := ComCall(11, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of used bytes in the internal data buffer that is used for writing to disc.
     * @remarks
     * This value increases as data is read into the buffer and decreases as data is written to disc.
     * @returns {Integer} Size, in bytes, of the used portion  of the internal data buffer that is used for writing to disc.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_usedsystembuffer
     */
    get_UsedSystemBuffer() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of unused bytes in the internal data buffer that is used for writing to disc.
     * @remarks
     * This method returns the same value as if you subtracted <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_usedsystembuffer">IWriteEngine2EventArgs::get_UsedSystemBuffer</a> from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_totalsystembuffer">IWriteEngine2EventArgs::get_TotalSystemBuffer</a>.
     * @returns {Integer} Size, in bytes, of the unused portion  of the internal data buffer that is used for writing to disc.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_freesystembuffer
     */
    get_FreeSystemBuffer() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWriteEngine2EventArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StartLba := CallbackCreate(GetMethod(implObj, "get_StartLba"), flags, 2)
        this.vtbl.get_SectorCount := CallbackCreate(GetMethod(implObj, "get_SectorCount"), flags, 2)
        this.vtbl.get_LastReadLba := CallbackCreate(GetMethod(implObj, "get_LastReadLba"), flags, 2)
        this.vtbl.get_LastWrittenLba := CallbackCreate(GetMethod(implObj, "get_LastWrittenLba"), flags, 2)
        this.vtbl.get_TotalSystemBuffer := CallbackCreate(GetMethod(implObj, "get_TotalSystemBuffer"), flags, 2)
        this.vtbl.get_UsedSystemBuffer := CallbackCreate(GetMethod(implObj, "get_UsedSystemBuffer"), flags, 2)
        this.vtbl.get_FreeSystemBuffer := CallbackCreate(GetMethod(implObj, "get_FreeSystemBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StartLba)
        CallbackFree(this.vtbl.get_SectorCount)
        CallbackFree(this.vtbl.get_LastReadLba)
        CallbackFree(this.vtbl.get_LastWrittenLba)
        CallbackFree(this.vtbl.get_TotalSystemBuffer)
        CallbackFree(this.vtbl.get_UsedSystemBuffer)
        CallbackFree(this.vtbl.get_FreeSystemBuffer)
    }
}
