#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeBatchBase.ahk

/**
 * Represents additional capabilities of an ISyncChangeBatchBase object.
 * @remarks
 * 
  * An <b>ISyncChangeBatchBase2</b> object can be obtained by passing <b>IID_ISyncChangeBatchBase2</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatchbase">ISyncChangeBatchBase</a> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchbase2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchBase2 extends ISyncChangeBatchBase{
    /**
     * The interface identifier for ISyncChangeBatchBase2
     * @type {Guid}
     */
    static IID => Guid("{6fdb596a-d755-4584-bd0c-c0c23a548fbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Integer} targetFormatVersion 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pdwSerializedSize 
     * @returns {HRESULT} 
     */
    SerializeWithOptions(targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize) {
        result := ComCall(17, this, "int", targetFormatVersion, "uint", dwFlags, "char*", pbBuffer, "uint*", pdwSerializedSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
