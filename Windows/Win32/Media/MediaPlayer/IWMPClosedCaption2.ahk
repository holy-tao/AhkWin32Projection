#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPClosedCaption.ahk

/**
 * The IWMPClosedCaption2 interface provides closed captioning methods that supplement the IWMPClosedCaption interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpclosedcaption2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPClosedCaption2 extends IWMPClosedCaption{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPClosedCaption2
     * @type {Guid}
     */
    static IID => Guid("{350ba78b-6bc8-4113-a5f5-312056934eb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SAMILangCount", "getSAMILangName", "getSAMILangID", "get_SAMIStyleCount", "getSAMIStyleName"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-get_samilangcount
     */
    get_SAMILangCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-getsamilangname
     */
    getSAMILangName(nIndex, pbstrName) {
        result := ComCall(16, this, "int", nIndex, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Integer>} plLangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-getsamilangid
     */
    getSAMILangID(nIndex, plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "int", nIndex, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-get_samistylecount
     */
    get_SAMIStyleCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-getsamistylename
     */
    getSAMIStyleName(nIndex, pbstrName) {
        result := ComCall(19, this, "int", nIndex, "ptr", pbstrName, "HRESULT")
        return result
    }
}
