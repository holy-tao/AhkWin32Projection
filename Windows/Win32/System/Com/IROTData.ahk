#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Implemented by monikers to enable the running object table (ROT) to compare monikers against each other.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-irotdata
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IROTData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IROTData
     * @type {Guid}
     */
    static IID => Guid("{f29f6bc0-5021-11ce-aa15-00006901293f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetComparisonData"]

    /**
     * Retrieves data from a moniker that can be used to test the moniker for equality against another moniker.
     * @remarks
     * The <b>GetComparisonData</b> method is primarily called by the running object table (ROT). The comparison data returned by the method is tested for binary equality against the comparison data returned by another moniker. The <i>pcbData</i> parameter enables the ROT to locate the end of the data retrieved.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The comparison data that you return must uniquely identify the moniker, while still being as short as possible. The comparison data should include information about the internal state of the moniker, as well as the moniker's CLSID. For example, the comparison data for a file moniker would include the path name stored within the moniker, as well as the CLSID of the file moniker implementation. This makes it possible to distinguish two monikers that happen to store similar state information but are instances of different moniker classes.
     * 
     * The comparison data for a moniker cannot exceed 2048 bytes in length. For composite monikers, the total length of the comparison data for all of its components cannot exceed 2048 bytes; consequently, if your moniker can be a component within a composite moniker, the comparison data you return must be significantly less than 2048 bytes.
     * 
     * If your comparison data is longer than the value specified by the <i>cbMax</i> parameter, you must return an error. Note that when <b>GetComparisonData</b> is called on the components of a composite moniker, the value of <i>cbMax</i> becomes smaller for each moniker in sequence.
     * @param {Pointer<Integer>} pbData A pointer to a buffer that receives the comparison data.
     * @param {Integer} cbMax The length of the buffer specified in <i>pbData</i>.
     * @param {Pointer<Integer>} pcbData A pointer to a variable that receives the length of the comparison data.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irotdata-getcomparisondata
     */
    GetComparisonData(pbData, cbMax, pcbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbDataMarshal, pbData, "uint", cbMax, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }
}
