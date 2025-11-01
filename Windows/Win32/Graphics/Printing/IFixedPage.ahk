#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IFixedPage extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFixedPage
     * @type {Guid}
     */
    static IID => Guid("{3d9f6448-7e95-4cb5-94fb-0180c2883a57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrintTicket", "GetPagePart", "GetWriteStream", "SetPrintTicket", "SetPagePart", "DeleteResource", "GetXpsPartIterator"]

    /**
     * 
     * @param {Pointer<IPartPrintTicket>} ppPrintTicket 
     * @returns {HRESULT} 
     */
    GetPrintTicket(ppPrintTicket) {
        result := ComCall(7, this, "ptr*", ppPrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    GetPagePart(uri, ppUnk) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(8, this, "ptr", uri, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintWriteStream>} ppWriteStream 
     * @returns {HRESULT} 
     */
    GetWriteStream(ppWriteStream) {
        result := ComCall(9, this, "ptr*", ppWriteStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPartPrintTicket} ppPrintTicket 
     * @returns {HRESULT} 
     */
    SetPrintTicket(ppPrintTicket) {
        result := ComCall(10, this, "ptr", ppPrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    SetPagePart(pUnk) {
        result := ComCall(11, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {HRESULT} 
     */
    DeleteResource(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(12, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsPartIterator>} pXpsPartIt 
     * @returns {HRESULT} 
     */
    GetXpsPartIterator(pXpsPartIt) {
        result := ComCall(13, this, "ptr*", pXpsPartIt, "HRESULT")
        return result
    }
}
