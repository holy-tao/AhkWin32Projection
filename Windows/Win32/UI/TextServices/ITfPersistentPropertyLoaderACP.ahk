#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfPersistentPropertyLoaderACP interface is implemented by an application and used by the TSF manager to load properties asynchronously.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfpersistentpropertyloaderacp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfPersistentPropertyLoaderACP extends IUnknown{
    /**
     * The interface identifier for ITfPersistentPropertyLoaderACP
     * @type {Guid}
     */
    static IID => Guid("{4ef89150-0807-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    LoadProperty(pHdr, ppStream) {
        result := ComCall(3, this, "ptr", pHdr, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
