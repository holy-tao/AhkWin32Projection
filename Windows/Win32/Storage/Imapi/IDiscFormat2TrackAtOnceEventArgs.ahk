#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWriteEngine2EventArgs.ahk

/**
 * Use this interface to retrieve information about the current write operation.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2trackatonceeventargs
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2TrackAtOnceEventArgs extends IWriteEngine2EventArgs{
    /**
     * The interface identifier for IDiscFormat2TrackAtOnceEventArgs
     * @type {Guid}
     */
    static IID => Guid("{27354140-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_CurrentTrackNumber(value) {
        result := ComCall(14, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_CurrentAction(value) {
        result := ComCall(15, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_ElapsedTime(value) {
        result := ComCall(16, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_RemainingTime(value) {
        result := ComCall(17, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
