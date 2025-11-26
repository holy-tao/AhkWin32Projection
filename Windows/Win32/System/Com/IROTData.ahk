#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Implemented by monikers to enable the running object table (ROT) to compare monikers against each other.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irotdata
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
     * @param {Pointer<Integer>} pbData A pointer to a buffer that receives the comparison data.
     * @param {Integer} cbMax The length of the buffer specified in <i>pbData</i>.
     * @param {Pointer<Integer>} pcbData A pointer to a variable that receives the length of the comparison data.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irotdata-getcomparisondata
     */
    GetComparisonData(pbData, cbMax, pcbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbDataMarshal, pbData, "uint", cbMax, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }
}
