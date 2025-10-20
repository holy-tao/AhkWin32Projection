#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a text description and raw data block associated with an error.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefileserrorinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesErrorInfo extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{7112fa5f-7571-435a-8eb7-195c7c1429bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BYTE_BLOB>} ppBlob 
     * @returns {HRESULT} 
     */
    GetRawData(ppBlob) {
        result := ComCall(3, this, "ptr", ppBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    GetDescription(ppszDescription) {
        result := ComCall(4, this, "ptr", ppszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
