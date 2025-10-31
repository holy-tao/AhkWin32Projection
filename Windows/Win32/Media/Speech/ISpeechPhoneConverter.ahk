#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhoneConverter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhoneConverter
     * @type {Guid}
     */
    static IID => Guid("{c3e4f353-433f-43d6-89a1-6a62a7054c3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LanguageId", "put_LanguageId", "PhoneToId", "IdToPhone"]

    /**
     * 
     * @param {Pointer<Integer>} LanguageId 
     * @returns {HRESULT} 
     */
    get_LanguageId(LanguageId) {
        result := ComCall(7, this, "int*", LanguageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LanguageId 
     * @returns {HRESULT} 
     */
    put_LanguageId(LanguageId) {
        result := ComCall(8, this, "int", LanguageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Phonemes 
     * @param {Pointer<VARIANT>} IdArray 
     * @returns {HRESULT} 
     */
    PhoneToId(Phonemes, IdArray) {
        Phonemes := Phonemes is String ? BSTR.Alloc(Phonemes).Value : Phonemes

        result := ComCall(9, this, "ptr", Phonemes, "ptr", IdArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} IdArray 
     * @param {Pointer<BSTR>} Phonemes 
     * @returns {HRESULT} 
     */
    IdToPhone(IdArray, Phonemes) {
        result := ComCall(10, this, "ptr", IdArray, "ptr", Phonemes, "HRESULT")
        return result
    }
}
