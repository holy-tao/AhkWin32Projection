#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMIndexer.ahk

/**
 * The IWMIndexer2 interface enables you to change the settings of the indexer object to suit your needs.This interface is implemented as part of the indexer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmindexer2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMIndexer2 extends IWMIndexer{
    /**
     * The interface identifier for IWMIndexer2
     * @type {Guid}
     */
    static IID => Guid("{b70f1e42-6255-4df0-a6b9-02b212d9e2bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} nIndexerType 
     * @param {Pointer<Void>} pvInterval 
     * @param {Pointer<Void>} pvIndexType 
     * @returns {HRESULT} 
     */
    Configure(wStreamNum, nIndexerType, pvInterval, pvIndexType) {
        result := ComCall(5, this, "ushort", wStreamNum, "int", nIndexerType, "ptr", pvInterval, "ptr", pvIndexType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
