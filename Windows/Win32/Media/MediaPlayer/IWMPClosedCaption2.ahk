#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPClosedCaption.ahk" { IWMPClosedCaption }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPClosedCaption2 interface provides closed captioning methods that supplement the IWMPClosedCaption interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpclosedcaption2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPClosedCaption2 extends IWMPClosedCaption {
    /**
     * The interface identifier for IWMPClosedCaption2
     * @type {Guid}
     */
    static IID := Guid("{350ba78b-6bc8-4113-a5f5-312056934eb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPClosedCaption2 interfaces
    */
    struct Vtbl extends IWMPClosedCaption.Vtbl {
        get_SAMILangCount  : IntPtr
        getSAMILangName    : IntPtr
        getSAMILangID      : IntPtr
        get_SAMIStyleCount : IntPtr
        getSAMIStyleName   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPClosedCaption2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * This method cannot be used until a digital media file is open.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-get_samilangcount
     */
    get_SAMILangCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getSAMILangName method retrieves the name of a language supported by the current SAMI file.
     * @remarks
     * The languages in a SAMI file are indexed in the order shown in the file, starting with zero.
     * 
     * This method cannot be used until a digital media file is open.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-getsamilangname
     */
    getSAMILangName(nIndex, pbstrName) {
        result := ComCall(16, this, "int", nIndex, BSTR.Ptr, pbstrName, "HRESULT")
        return result
    }

    /**
     * The getSAMILangID method retrieves the locale identifier (LCID) of a language supported by the current SAMI file.
     * @remarks
     * The languages in a SAMI file are indexed in the order shown in the file, starting with zero.
     * 
     * This method cannot be used until a digital media file is open.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0 and returns an E_INVALIDARG <b>HRESULT</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-getsamilangid
     */
    getSAMILangID(nIndex, plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "int", nIndex, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * The get_SAMIStyleCount method retrieves the number of styles supported by the current SAMI file.
     * @remarks
     * This method cannot be used until a digital media file is open.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-get_samistylecount
     */
    get_SAMIStyleCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getSAMIStyleName method retrieves the name of a style supported by the current SAMI file.
     * @remarks
     * The styles in a SAMI file are indexed in the order shown in the file, starting with zero.
     * 
     * This method cannot be used until a digital media file is open.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption2-getsamistylename
     */
    getSAMIStyleName(nIndex, pbstrName) {
        result := ComCall(19, this, "int", nIndex, BSTR.Ptr, pbstrName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPClosedCaption2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SAMILangCount := CallbackCreate(GetMethod(implObj, "get_SAMILangCount"), flags, 2)
        this.vtbl.getSAMILangName := CallbackCreate(GetMethod(implObj, "getSAMILangName"), flags, 3)
        this.vtbl.getSAMILangID := CallbackCreate(GetMethod(implObj, "getSAMILangID"), flags, 3)
        this.vtbl.get_SAMIStyleCount := CallbackCreate(GetMethod(implObj, "get_SAMIStyleCount"), flags, 2)
        this.vtbl.getSAMIStyleName := CallbackCreate(GetMethod(implObj, "getSAMIStyleName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SAMILangCount)
        CallbackFree(this.vtbl.getSAMILangName)
        CallbackFree(this.vtbl.getSAMILangID)
        CallbackFree(this.vtbl.get_SAMIStyleCount)
        CallbackFree(this.vtbl.getSAMIStyleName)
    }
}
