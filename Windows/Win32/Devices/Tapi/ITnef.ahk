#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnefiunknown
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITnef extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddProps", "ExtractProps", "Finish", "OpenTaggedBody", "SetProps", "EncodeRecips", "FinishComponent"]

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulElemID 
     * @param {Pointer<Void>} lpvData 
     * @param {Pointer<SPropTagArray>} lpPropList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-addprops
     */
    AddProps(ulFlags, ulElemID, lpvData, lpPropList) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", ulFlags, "uint", ulElemID, lpvDataMarshal, lpvData, "ptr", lpPropList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lpPropList 
     * @param {Pointer<Pointer<STnefProblemArray>>} lpProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-extractprops
     */
    ExtractProps(ulFlags, lpPropList, lpProblems) {
        lpProblemsMarshal := lpProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", ulFlags, "ptr", lpPropList, lpProblemsMarshal, lpProblems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpKey 
     * @param {Pointer<Pointer<STnefProblemArray>>} lpProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-finish
     */
    Finish(ulFlags, lpKey, lpProblems) {
        lpKeyMarshal := lpKey is VarRef ? "ushort*" : "ptr"
        lpProblemsMarshal := lpProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", ulFlags, lpKeyMarshal, lpKey, lpProblemsMarshal, lpProblems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMessage} lpMessage 
     * @param {Integer} ulFlags 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-opentaggedbody
     */
    OpenTaggedBody(lpMessage, ulFlags) {
        result := ComCall(6, this, "ptr", lpMessage, "uint", ulFlags, "ptr*", &lppStream := 0, "HRESULT")
        return IStream(lppStream)
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulElemID 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-setprops
     */
    SetProps(ulFlags, ulElemID, cValues, lpProps) {
        result := ComCall(7, this, "uint", ulFlags, "uint", ulElemID, "uint", cValues, "ptr", lpProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {IMAPITable} lpRecipientTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-encoderecips
     */
    EncodeRecips(ulFlags, lpRecipientTable) {
        result := ComCall(8, this, "uint", ulFlags, "ptr", lpRecipientTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulComponentID 
     * @param {Pointer<SPropTagArray>} lpCustomPropList 
     * @param {Pointer<SPropValue>} lpCustomProps 
     * @param {Pointer<SPropTagArray>} lpPropList 
     * @param {Pointer<Pointer<STnefProblemArray>>} lpProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itnef-finishcomponent
     */
    FinishComponent(ulFlags, ulComponentID, lpCustomPropList, lpCustomProps, lpPropList, lpProblems) {
        lpProblemsMarshal := lpProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "uint", ulFlags, "uint", ulComponentID, "ptr", lpCustomPropList, "ptr", lpCustomProps, "ptr", lpPropList, lpProblemsMarshal, lpProblems, "HRESULT")
        return result
    }
}
