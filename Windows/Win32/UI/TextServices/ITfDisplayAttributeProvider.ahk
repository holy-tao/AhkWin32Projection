#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDisplayAttributeProvider interface is implemented by a text service and is used by the TSF manager to enumerate and obtain individual display attribute information objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfdisplayattributeprovider
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDisplayAttributeProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfDisplayAttributeProvider
     * @type {Guid}
     */
    static IID => Guid("{fee47777-163c-4769-996a-6e9c50ad8f54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumDisplayAttributeInfo", "GetDisplayAttributeInfo"]

    /**
     * 
     * @param {Pointer<IEnumTfDisplayAttributeInfo>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeprovider-enumdisplayattributeinfo
     */
    EnumDisplayAttributeInfo(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<ITfDisplayAttributeInfo>} ppInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeprovider-getdisplayattributeinfo
     */
    GetDisplayAttributeInfo(guid, ppInfo) {
        result := ComCall(4, this, "ptr", guid, "ptr*", ppInfo, "HRESULT")
        return result
    }
}
