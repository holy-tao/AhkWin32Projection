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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Seed", "get_Seed", "put_ExtendedSeed", "get_ExtendedSeed"]

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-put_seed
     */
    put_Seed(value) {
        result := ComCall(14, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-get_seed
     */
    get_Seed() {
        result := ComCall(15, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Pointer<Integer>} values 
     * @param {Integer} eCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-put_extendedseed
     */
    put_ExtendedSeed(values, eCount) {
        valuesMarshal := values is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, valuesMarshal, values, "uint", eCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} values 
     * @param {Pointer<Integer>} eCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-get_extendedseed
     */
    get_ExtendedSeed(values, eCount) {
        valuesMarshal := values is VarRef ? "ptr*" : "ptr"
        eCountMarshal := eCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, valuesMarshal, values, eCountMarshal, eCount, "HRESULT")
        return result
    }
}
