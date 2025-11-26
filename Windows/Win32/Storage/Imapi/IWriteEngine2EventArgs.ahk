#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to retrieve information about the current write operation. This interface is passed to the DWriteEngine2Events::Update method that you implement.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iwriteengine2eventargs
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IWriteEngine2EventArgs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteEngine2EventArgs
     * @type {Guid}
     */
    static IID => Guid("{27354136-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartLba", "get_SectorCount", "get_LastReadLba", "get_LastWrittenLba", "get_TotalSystemBuffer", "get_UsedSystemBuffer", "get_FreeSystemBuffer"]

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
     * @returns {Integer} Starting logical block address of the write operation. Negative values for LBAs are supported.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_startlba
     */
    get_StartLba() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of sectors to write to the device in the current write operation.
     * @returns {Integer} The number of sectors to write in the current write operation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_sectorcount
     */
    get_SectorCount() {
        result := ComCall(8, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the address of the sector most recently read from the burn image.
     * @returns {Integer} Logical block address of the sector most recently read from the input data stream.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_lastreadlba
     */
    get_LastReadLba() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the address of the sector most recently written to the device.
     * @returns {Integer} Logical block address of the sector most recently written to the device.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_lastwrittenlba
     */
    get_LastWrittenLba() {
        result := ComCall(10, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the size of the internal data buffer that is used for writing to disc.
     * @returns {Integer} Size, in bytes, of the internal data buffer that is used for writing to disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_totalsystembuffer
     */
    get_TotalSystemBuffer() {
        result := ComCall(11, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of used bytes in the internal data buffer that is used for writing to disc.
     * @returns {Integer} Size, in bytes, of the used portion  of the internal data buffer that is used for writing to disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_usedsystembuffer
     */
    get_UsedSystemBuffer() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of unused bytes in the internal data buffer that is used for writing to disc.
     * @returns {Integer} Size, in bytes, of the unused portion  of the internal data buffer that is used for writing to disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-iwriteengine2eventargs-get_freesystembuffer
     */
    get_FreeSystemBuffer() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
