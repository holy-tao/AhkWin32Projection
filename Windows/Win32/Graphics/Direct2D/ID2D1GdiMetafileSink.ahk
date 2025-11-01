#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A developer implemented interface that allows a metafile to be replayed.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1gdimetafilesink
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GdiMetafileSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GdiMetafileSink
     * @type {Guid}
     */
    static IID => Guid("{82237326-8111-4f7c-bcf4-b5c1175564fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessRecord"]

    /**
     * 
     * @param {Integer} recordType 
     * @param {Pointer<Void>} recordData 
     * @param {Integer} recordDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gdimetafilesink-processrecord
     */
    ProcessRecord(recordType, recordData, recordDataSize) {
        result := ComCall(3, this, "uint", recordType, "ptr", recordData, "uint", recordDataSize, "HRESULT")
        return result
    }
}
