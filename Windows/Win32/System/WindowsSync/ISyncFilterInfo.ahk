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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Serialize"]

    /**
     * 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<Integer>} pcbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfilterinfo-serialize
     */
    Serialize(pbBuffer, pcbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pcbBufferMarshal := pcbBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbBufferMarshal, pbBuffer, pcbBufferMarshal, pcbBuffer, "HRESULT")
        return result
    }
}
