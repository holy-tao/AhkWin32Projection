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
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_startlba
     */
    get_StartLba(value) {
        result := ComCall(7, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_sectorcount
     */
    get_SectorCount(value) {
        result := ComCall(8, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_lastreadlba
     */
    get_LastReadLba(value) {
        result := ComCall(9, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_lastwrittenlba
     */
    get_LastWrittenLba(value) {
        result := ComCall(10, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_totalsystembuffer
     */
    get_TotalSystemBuffer(value) {
        result := ComCall(11, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_usedsystembuffer
     */
    get_UsedSystemBuffer(value) {
        result := ComCall(12, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2eventargs-get_freesystembuffer
     */
    get_FreeSystemBuffer(value) {
        result := ComCall(13, this, "int*", value, "HRESULT")
        return result
    }
}
