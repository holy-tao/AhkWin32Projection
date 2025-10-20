#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Use this interface to generate a read-only data stream whose data is initialized with pseudo-random data (not cryptographically safe). You must call the SetSize method to set the requested size of the stream.
 * @remarks
 * 
  * To create the <b>MsftStreamPrgn001</b> object in a script, use IMAPI2.MsftStreamPrgn001 as the program identifier when calling <b>CreateObject</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-istreampseudorandombased
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IStreamPseudoRandomBased extends IStream{
    /**
     * The interface identifier for IStreamPseudoRandomBased
     * @type {Guid}
     */
    static IID => Guid("{27354145-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Seed(value) {
        result := ComCall(14, this, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    get_Seed(value) {
        result := ComCall(15, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} values 
     * @param {Integer} eCount 
     * @returns {HRESULT} 
     */
    put_ExtendedSeed(values, eCount) {
        result := ComCall(16, this, "uint*", values, "uint", eCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} values 
     * @param {Pointer<UInt32>} eCount 
     * @returns {HRESULT} 
     */
    get_ExtendedSeed(values, eCount) {
        result := ComCall(17, this, "uint*", values, "uint*", eCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
