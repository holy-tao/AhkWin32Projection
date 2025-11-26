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
     */
    SAMILangCount {
        get => this.get_SAMILangCount()
    }

    /**
     */
    SAMIStyleCount {
        get => this.get_SAMIStyleCount()
    }

    /**
     * The get_SAMILangCount method retrieves the number of languages supported by the current SAMI file.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpclosedcaption2-get_samilangcount
     */
    get_SAMILangCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getSAMILangName method retrieves the name of a language supported by the current SAMI file.
     * @param {Integer} nIndex <b>long</b> containing the index of the language name to retrieve.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpclosedcaption2-getsamilangname
     */
    getSAMILangName(nIndex, pbstrName) {
        result := ComCall(16, this, "int", nIndex, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The getSAMILangID method retrieves the locale identifier (LCID) of a language supported by the current SAMI file.
     * @param {Integer} nIndex <b>long</b> containing the index.
     * @param {Pointer<Integer>} plLangID Pointer to a <b>long</b> containing the index of the LCID to retrieve.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpclosedcaption2-getsamilangid
     */
    getSAMILangID(nIndex, plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "int", nIndex, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * The get_SAMIStyleCount method retrieves the number of styles supported by the current SAMI file.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpclosedcaption2-get_samistylecount
     */
    get_SAMIStyleCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getSAMIStyleName method retrieves the name of a style supported by the current SAMI file.
     * @param {Integer} nIndex <b>long</b> containing the index of the style name to retrieve.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name of the style as specified in the SAMI file.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpclosedcaption2-getsamistylename
     */
    getSAMIStyleName(nIndex, pbstrName) {
        result := ComCall(19, this, "int", nIndex, "ptr", pbstrName, "HRESULT")
        return result
    }
}
