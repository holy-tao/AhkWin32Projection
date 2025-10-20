#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents methods that an IAsynchronousDataRetriever object can call to indicate that processing has been completed on an IAsynchronousDataRetriever method.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-idataretrievercallback
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IDataRetrieverCallback extends IUnknown{
    /**
     * The interface identifier for IDataRetrieverCallback
     * @type {Guid}
     */
    static IID => Guid("{71b4863b-f969-4676-bbc3-3d9fdc3fb2c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkData 
     * @returns {HRESULT} 
     */
    LoadChangeDataComplete(pUnkData) {
        result := ComCall(3, this, "ptr", pUnkData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @returns {HRESULT} 
     */
    LoadChangeDataError(hrError) {
        result := ComCall(4, this, "int", hrError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
