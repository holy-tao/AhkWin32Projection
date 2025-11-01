#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1GdiMetafileSink.ahk

/**
 * This interface performs all the same functions as the existing ID2D1GdiMetafileSink interface. It also enables access to metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1gdimetafilesink1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GdiMetafileSink1 extends ID2D1GdiMetafileSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GdiMetafileSink1
     * @type {Guid}
     */
    static IID => Guid("{fd0ecb6b-91e6-411e-8655-395e760f91b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

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
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gdimetafilesink1-processrecord
     */
    ProcessRecord(recordType, recordData, recordDataSize, flags) {
        result := ComCall(4, this, "uint", recordType, "ptr", recordData, "uint", recordDataSize, "uint", flags, "HRESULT")
        return result
    }
}
