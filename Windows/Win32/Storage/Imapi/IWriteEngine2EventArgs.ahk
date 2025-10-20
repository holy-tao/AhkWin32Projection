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
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartLba(value) {
        result := ComCall(7, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_SectorCount(value) {
        result := ComCall(8, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_LastReadLba(value) {
        result := ComCall(9, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_LastWrittenLba(value) {
        result := ComCall(10, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_TotalSystemBuffer(value) {
        result := ComCall(11, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_UsedSystemBuffer(value) {
        result := ComCall(12, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_FreeSystemBuffer(value) {
        result := ComCall(13, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
