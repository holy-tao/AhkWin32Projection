#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseProperties extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseProperties
     * @type {Guid}
     */
    static IID => Guid("{08166b47-102e-4b23-a599-bdb98dbfd1f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ISpeechPhraseProperty>} Property 
     * @returns {HRESULT} 
     */
    Item(Index, Property) {
        result := ComCall(8, this, "int", Index, "ptr*", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} EnumVARIANT 
     * @returns {HRESULT} 
     */
    get__NewEnum(EnumVARIANT) {
        result := ComCall(9, this, "ptr*", EnumVARIANT, "HRESULT")
        return result
    }
}
