#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to erase data from a disc.
 * @remarks
 * 
  * To create the <b>MsftDiscFormat2Erase</b> object in a script, use IMAPI2.MsftDiscFormat2Erase as the program identifier when calling <b>CreateObject</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2erase
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2Erase extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2Erase
     * @type {Guid}
     */
    static IID => Guid("{27354156-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Recorder", "get_Recorder", "put_FullErase", "get_FullErase", "get_CurrentPhysicalMediaType", "put_ClientName", "get_ClientName", "EraseMedia"]

    /**
     * 
     * @param {IDiscRecorder2} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-get_recorder
     */
    get_Recorder(value) {
        result := ComCall(13, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-put_fullerase
     */
    put_FullErase(value) {
        result := ComCall(14, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-get_fullerase
     */
    get_FullErase(value) {
        result := ComCall(15, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType(value) {
        result := ComCall(16, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(17, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-get_clientname
     */
    get_ClientName(value) {
        result := ComCall(18, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2erase-erasemedia
     */
    EraseMedia() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
