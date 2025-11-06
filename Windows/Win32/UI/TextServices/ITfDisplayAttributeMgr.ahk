#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfDisplayAttributeInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDisplayAttributeMgr interface is implemented by the TSF manager and used by an application to obtain and enumerate display attributes. Individual display attributes are accessed through the ITfDisplayAttributeInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfdisplayattributemgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDisplayAttributeMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfDisplayAttributeMgr
     * @type {Guid}
     */
    static IID => Guid("{8ded7393-5db1-475c-9e71-a39111b0ff67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdateInfo", "EnumDisplayAttributeInfo", "GetDisplayAttributeInfo"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo
     */
    OnUpdateInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumTfDisplayAttributeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributemgr-enumdisplayattributeinfo
     */
    EnumDisplayAttributeInfo() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDisplayAttributeInfo(ppEnum)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<ITfDisplayAttributeInfo>} ppInfo 
     * @param {Pointer<Guid>} pclsidOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributemgr-getdisplayattributeinfo
     */
    GetDisplayAttributeInfo(guid, ppInfo, pclsidOwner) {
        result := ComCall(5, this, "ptr", guid, "ptr*", ppInfo, "ptr", pclsidOwner, "HRESULT")
        return result
    }
}
