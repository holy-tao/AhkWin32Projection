#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfDisplayAttributeInfo.ahk
#Include .\ITfDisplayAttributeInfo.ahk
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
     * @returns {IEnumTfDisplayAttributeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeprovider-enumdisplayattributeinfo
     */
    EnumDisplayAttributeInfo() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDisplayAttributeInfo(ppEnum)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {ITfDisplayAttributeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeprovider-getdisplayattributeinfo
     */
    GetDisplayAttributeInfo(guid) {
        result := ComCall(4, this, "ptr", guid, "ptr*", &ppInfo := 0, "HRESULT")
        return ITfDisplayAttributeInfo(ppInfo)
    }
}
