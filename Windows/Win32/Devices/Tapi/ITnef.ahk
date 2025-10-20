#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITnef extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulElemID 
     * @param {Pointer<Void>} lpvData 
     * @param {Pointer<SPropTagArray>} lpPropList 
     * @returns {HRESULT} 
     */
    AddProps(ulFlags, ulElemID, lpvData, lpPropList) {
        result := ComCall(3, this, "uint", ulFlags, "uint", ulElemID, "ptr", lpvData, "ptr", lpPropList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lpPropList 
     * @param {Pointer<STnefProblemArray>} lpProblems 
     * @returns {HRESULT} 
     */
    ExtractProps(ulFlags, lpPropList, lpProblems) {
        result := ComCall(4, this, "uint", ulFlags, "ptr", lpPropList, "ptr", lpProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt16>} lpKey 
     * @param {Pointer<STnefProblemArray>} lpProblems 
     * @returns {HRESULT} 
     */
    Finish(ulFlags, lpKey, lpProblems) {
        result := ComCall(5, this, "uint", ulFlags, "ushort*", lpKey, "ptr", lpProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMessage>} lpMessage 
     * @param {Integer} ulFlags 
     * @param {Pointer<IStream>} lppStream 
     * @returns {HRESULT} 
     */
    OpenTaggedBody(lpMessage, ulFlags, lppStream) {
        result := ComCall(6, this, "ptr", lpMessage, "uint", ulFlags, "ptr", lppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulElemID 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpProps 
     * @returns {HRESULT} 
     */
    SetProps(ulFlags, ulElemID, cValues, lpProps) {
        result := ComCall(7, this, "uint", ulFlags, "uint", ulElemID, "uint", cValues, "ptr", lpProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lpRecipientTable 
     * @returns {HRESULT} 
     */
    EncodeRecips(ulFlags, lpRecipientTable) {
        result := ComCall(8, this, "uint", ulFlags, "ptr", lpRecipientTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulComponentID 
     * @param {Pointer<SPropTagArray>} lpCustomPropList 
     * @param {Pointer<SPropValue>} lpCustomProps 
     * @param {Pointer<SPropTagArray>} lpPropList 
     * @param {Pointer<STnefProblemArray>} lpProblems 
     * @returns {HRESULT} 
     */
    FinishComponent(ulFlags, ulComponentID, lpCustomPropList, lpCustomProps, lpPropList, lpProblems) {
        result := ComCall(9, this, "uint", ulFlags, "uint", ulComponentID, "ptr", lpCustomPropList, "ptr", lpCustomProps, "ptr", lpPropList, "ptr", lpProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
