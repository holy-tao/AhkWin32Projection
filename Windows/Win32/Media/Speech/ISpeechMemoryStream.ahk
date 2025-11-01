#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechMemoryStream extends ISpeechBaseStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechMemoryStream
     * @type {Guid}
     */
    static IID => Guid("{eeb14b68-808b-4abe-a5ea-b51da7588008}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetData", "GetData"]

    /**
     * 
     * @param {VARIANT} Data 
     * @returns {HRESULT} 
     */
    SetData(Data) {
        result := ComCall(12, this, "ptr", Data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pData 
     * @returns {HRESULT} 
     */
    GetData(pData) {
        result := ComCall(13, this, "ptr", pData, "HRESULT")
        return result
    }
}
