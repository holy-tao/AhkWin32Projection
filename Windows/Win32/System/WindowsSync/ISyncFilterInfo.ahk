#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about a filter that is used to control the data that is included in an ISyncChangeBatch object.
 * @remarks
 * 
  * If a provider filters the contents of a change batch that it creates, it must create a filtered <b>ISyncChangeBatch</b> object.  The filtered change batch object contains an <b>ISyncFilterInfo</b> object that describes how the contents of the change batch were filtered.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncfilterinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFilterInfo extends IUnknown{
    /**
     * The interface identifier for ISyncFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{794eaaf8-3f2e-47e6-9728-17e6fcf94cb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pcbBuffer 
     * @returns {HRESULT} 
     */
    Serialize(pbBuffer, pcbBuffer) {
        result := ComCall(3, this, "char*", pbBuffer, "uint*", pcbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
