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
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} cbMax 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irotdata-getcomparisondata
     */
    GetComparisonData(pbData, cbMax, pcbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbDataMarshal, pbData, "uint", cbMax, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }
}
