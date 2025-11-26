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
     * Provides access to metafile records, including their type, data, and flags.
     * @param {Integer} recordType Type: <b>DWORD</b>
     * 
     * The type of metafile record being processed. Please see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a> for a list of record types.
     * @param {Pointer<Void>} recordData Type: <b>const void*</b>
     * 
     * The data contained in this record. Please see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a> for information on record data layouts.
     * @param {Integer} recordDataSize Type: <b>UINT</b>
     * 
     * TThe size of the data pointed to by recordData.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * The set of flags set for this record. Please see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a> for information on record flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * S_OK if successful, otherwise a failure HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1gdimetafilesink1-processrecord
     */
    ProcessRecord(recordType, recordData, recordDataSize, flags) {
        recordDataMarshal := recordData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", recordType, recordDataMarshal, recordData, "uint", recordDataSize, "uint", flags, "HRESULT")
        return result
    }
}
